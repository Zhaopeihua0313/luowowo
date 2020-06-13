package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.Answer;
import cn.wolfcode.luowowo.article.domain.Question;
import cn.wolfcode.luowowo.article.domain.QuestionContent;
import cn.wolfcode.luowowo.article.mapper.QuestionContentMapper;
import cn.wolfcode.luowowo.article.mapper.QuestionMapper;
import cn.wolfcode.luowowo.article.repository.AnswerMongoRepository;
import cn.wolfcode.luowowo.article.service.IQuestionService;
import cn.wolfcode.luowowo.cache.service.IQuestionStatsCacheService;
import cn.wolfcode.luowowo.cache.vo.QuestionStats;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import org.apache.dubbo.config.annotation.Reference;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.util.StringUtils;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class QuestionServiceImpl implements IQuestionService {

    @Autowired
    private QuestionMapper questionMapper;

    @Autowired
    private AnswerMongoRepository repository;

    @Autowired
    private QuestionContentMapper questionContentMapper;

    @Reference
    private IQuestionStatsCacheService questionStatsCacheService;

    public List<Question> listAll() {
        //获得所有问题
        List<Question> questions = questionMapper.selectAll();
        //接下来遍历所有问题,得到问题id,根据问题id查到金牌回答(即点赞数最高的回答)
        //因迭代器的原因,弄一个新的集合来装questions
        List<Question> qs = new ArrayList<>();
        for (Question question : questions) {
            Long questionId = question.getId();
            List<Answer> list = repository.findByQuestionId(questionId, Sort.by(Sort.Direction.DESC,"thumbupNum"));//逆序排序
            List<Answer> list1 = new ArrayList<>();
            if(list.size()>0){
                Answer answer = list.get(0);//获取第一个,就是点赞最大的那个(也就是金牌回答)
                list1.add(answer);//获取第一个,就是点赞最大的那个
                question.setAnswers(list1);//每个问题的answers属性只装了点赞量最大的那个
            }
            qs.add(question);
        }
        return qs;
    }

    //根据问题id获取问题
    public Question get(Long qid) {
        return questionMapper.selectByPrimaryKey(qid);
    }

    public AjaxResult save(Question question) {
        AjaxResult ajaxResult = new AjaxResult();
        try{
            char[] chars = question.getTitle().toCharArray();
            if(chars.length<10){
                throw new RuntimeException("标题不能少于10字");
            }
            if(chars.length>80){
                throw new RuntimeException("标题不能多于80字");
            }
            if(!StringUtils.hasLength(question.getTravelContent().getContent())){
                throw new RuntimeException("详细描述不能为空");
            }
            question.setCreatTime(new Date());
            questionMapper.insert(question);
            QuestionContent content = question.getTravelContent();//注意这个TravelContent是问题内容
            content.setId(question.getId());
            //把内容存入内容表
            questionContentMapper.insert(content);
            ajaxResult.addData(question.getId());
        }catch (Exception e){
            e.printStackTrace();
            ajaxResult.mark(e.getMessage());
        }
        return ajaxResult;
    }

    //更新统计数据到sql
    public void update(Question question) {
        questionMapper.updateByPrimaryKey(question);
    }

}
