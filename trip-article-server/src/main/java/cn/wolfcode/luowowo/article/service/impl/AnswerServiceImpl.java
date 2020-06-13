package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.Answer;
import cn.wolfcode.luowowo.article.repository.AnswerMongoRepository;
import cn.wolfcode.luowowo.article.service.IAnswerService;
import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.IAnswerStatsCacheService;
import cn.wolfcode.luowowo.cache.service.IQuestionStatsCacheService;
import cn.wolfcode.luowowo.cache.service.IUserRankStatsCacheService;
import cn.wolfcode.luowowo.cache.vo.AnswerStats;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import org.apache.dubbo.config.annotation.Reference;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class AnswerServiceImpl implements IAnswerService {

    @Autowired
    private AnswerMongoRepository repository;
    @Reference
    private IAnswerStatsCacheService answerStatsCacheService;
    @Reference
    private IUserRankStatsCacheService userRankStatsCacheService;


    //找到金牌回答
    public Answer getGoldenOne(Long questionId,String oldGoldenId) {
        //获取该问题下的所有回答并按照点赞数逆序排序,点赞数最多的就是就是金牌回答
        List<Answer> answers = repository.findByQuestionId(questionId, Sort.by(Sort.Direction.DESC, "thumbupNum"));
        Answer answer = null;
        if(answers.size()>0){
            //将点赞最高的回答设置为金牌回答,设置其他回答为非金牌回答
            answer = answers.get(0);//金牌回答
            answer.setGolden(true);
            repository.save(answer);//将修改后的数据同步到mongo数据库

            //防止 在该问题的第一次回答时设置过金牌(金牌数+1)此时重复金牌数+1,以及重复刷新,点赞最高的同一个人一直获得金牌 的情况
            if(answers.size()>1 && !answer.getId().equals(oldGoldenId)){
                //当该回答变成金牌回答时,并且该回答不是之前拥有金牌的回答时,该回答者统计数据的金牌数+1
                String cacheKey = RedisKey.USER_SCORE_STATS.getCacheKey(answer.getAuthorId());
                userRankStatsCacheService.incr(answer.getAuthorId(),1, IUserRankStatsCacheService.USER_STSTS_GOLDEN);
                //当该回答变成金牌回答时,排行榜的金牌数+1
                userRankStatsCacheService.addInRand(RedisKey.USER_ANSWER_GOLDEN_SORT,1,answer.getAuthorId());
            }

            //取出金牌回答,剩下的都设置为为非金牌回答
            answers.remove(0);
            if(answers.size()>0){
                for (Answer answer1 : answers) {
                    answer1.setGolden(false);
                    repository.save(answer1);
                }
            }
        }
        return answer;
    }

    //获取除金牌回答外的所有回答,并按时间逆序
    public List<Answer> listOthers(Long id) {
        List<Answer> answers = repository.findByQuestionId(id, Sort.by(Sort.Direction.DESC, "creatTime"));//所有回答
        ArrayList<Answer> list = new ArrayList<>();//用来装除金牌回答外的回答
        if(answers.size()>0){
            Answer answer = repository.findByQuestionIdAndGolden(id,true);//金牌回答
            if(answer!=null){
                for (Answer answer1 : answers) {
                    if(!answer1.getId().equals(answer.getId())){
                        list.add(answer1);
                    }
                }
            }
        }

        return list;
    }

    //保存回答
    public AjaxResult save(Answer answer) {
        AjaxResult ajaxResult = new AjaxResult();
        try{
            //如果内容为空,抛出异常
            if(!StringUtils.hasLength(answer.getContent())){
                throw new RuntimeException("内容不能为空");
            }
            //补充数据
            answer.setCreatTime(new Date());
            answer.setGolden(false);
            answer.setThumbupNum(0);
            answer.setShareNum(0);
            String summary = "";

            if(answer.getContent().toCharArray().length>50){
                summary = answer.getContent().substring(0,50)+"...";
            }else{
                summary = answer.getContent();
            }
            answer.setSummary(summary);
            //看看之前是否有过回答,如果没有,说明这是第一个回答,将其设置为金牌回答
            List<Answer> answers = repository.findByQuestionId(answer.getQuestionId(), null);
            if(answers.size()==0){
                answer.setGolden(true);
                //每设置一次金牌,该回答者统计数据的金牌数+1
                String cacheKey = RedisKey.USER_SCORE_STATS.getCacheKey(answer.getAuthorId());
                userRankStatsCacheService.incr(answer.getAuthorId(),1, IUserRankStatsCacheService.USER_STSTS_GOLDEN);
                //每设置一次金牌,排行榜的金牌数+1
                userRankStatsCacheService.addInRand(RedisKey.USER_ANSWER_GOLDEN_SORT,1,answer.getAuthorId());
            }
            //保存到mongo
            repository.save(answer);

            //保存成功后还得同步到redis
            String answerId = answer.getId();
            Optional<Answer> byId = repository.findById(answerId);
            byId.ifPresent(ans ->{
                //封装vo对象
                AnswerStats vo = new AnswerStats();
                vo.setAnswerId(ans.getId());
                vo.setQuestionId(ans.getQuestionId());
                vo.setAuthorId(ans.getAuthorId());
                vo.setUserName(ans.getAuthorname());
                vo.setHeadImgUrl(ans.getHeadUrl());
                vo.setLevel(ans.getLevel());
                vo.setSharenum(ans.getShareNum());
                vo.setThumbsupnum(ans.getThumbupNum());
                vo.setGolden(ans.getGolden());
                System.out.println(vo);
                //缓存到redies中，替换存储
                answerStatsCacheService.setAnswerStats(vo);
            });

        }catch (Exception e){
            e.printStackTrace();
            ajaxResult.mark(e.getMessage());
        }
        return ajaxResult;
    }

    //更新回答点赞数
    public void updateThumbup(String answerId, int i) {
        Optional<Answer> byId = repository.findById(answerId);
        byId.ifPresent(answer->{
            Integer thumbupNum = answer.getThumbupNum();
            answer.setThumbupNum(thumbupNum+i);
            repository.save(answer);
        });

    }

    @Override
    public List<Answer> listAll() {
        return repository.findAll();
    }

    @Override
    public Answer get(String answerId) {
        return repository.findById(answerId).get();
    }
}
