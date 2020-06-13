package cn.wolfcode.luowowo.mgrsite.controller;


import cn.wolfcode.luowowo.article.domain.*;
import cn.wolfcode.luowowo.article.service.*;
import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.*;
import cn.wolfcode.luowowo.cache.vo.*;
import cn.wolfcode.luowowo.common.query.DestinationQueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.member.service.IUserInfoService;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * 数据操作控制器 开发使用，请勿对外开放(记住哦)
 */
@Controller
public class DataController {

    @Reference
    private IStrategyDetailService strategyDetailService;
    @Reference
    private IStrategyStatsCacheService strategyStatsCacheService;
    @Reference
    private ITravelService travelService;
    @Reference
    private ITravelStatsCacheService travelStatsCacheService;
    @Reference
    private IDestinationService destinationService;
    @Reference
    private IScenicService scenicService;
    @Reference
    private IScenicStatsCacheService statsCacheService;
    @Reference
    private IQuestionService questionService;
    @Reference
    private IQuestionStatsCacheService questionStatsCacheService;
    @Reference
    private IAnswerService answerService;
    @Reference
    private IAnswerStatsCacheService answerStatsCacheService;
    @Reference
    private IUserRankStatsCacheService userRankStatsCacheService;
    @Reference
    private IUserInfoService userInfoService;


    /**
     * 处理 攻略统计数据的缓存数据落地，把 redis 持久化到 mysql 中
     */
    @RequestMapping("/dataDown")
    @ResponseBody
    public AjaxResult dataDown() {
        AjaxResult result = new AjaxResult();
        try {

            //调用方法做 redis 数据落地
            strategyStatsDataDown();
            travelStatsDataDown();
            scenicStatsDataDown();
            questionStatsDataDown();
            System.out.println("----> 手动执行 攻略统计数据落地 完毕" + "【" + new Date() + "】");

        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;

    }

    /**
     * 处理 攻略统计数据 根据其来创建 redis 的数据做缓存
     */
    @RequestMapping("/putRedis")
    @ResponseBody
    public AjaxResult putRedis() {
        AjaxResult result = new AjaxResult();
        try {

            //调用方法做 redis 缓存，强制执行，覆盖原有的缓存
            strategyStatsToRedis(true);
            travelStatsToRedis(true);
            scenicStatsToRedis(true);
            questionStatsToRedis(true);
            answerStatsToRedis(true);
            userRankStatsToRedis(true);
            System.out.println("----> 手动强制执行 攻略统计数据的缓存到redis 完毕" + "【" + new Date() + "】");

        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;

    }

    /**
     * 方法 攻略统计数据的缓存数据落地，把 redis 持久化到 mysql 中攻略统计数据的缓存数据落地，把 redis 持久化到 mysql 中
     */
    public void strategyStatsDataDown() {
        //从redis中查询出所有的热数据(攻略 五数统计数据)
        List<StrategyStats> vos = strategyStatsCacheService.listAllStrategyStats();
        for (StrategyStats vo : vos) {
            //取出热数据
            StrategyDetail detail = new StrategyDetail();
            detail.setId(vo.getStrategyId());
            detail.setFavornum(vo.getFavornum());
            detail.setReplynum(vo.getReplynum());
            detail.setViewnum(vo.getViewnum());
            detail.setThumbsupnum(vo.getThumbsupnum());
            detail.setSharenum(vo.getSharenum());

            //更新到mysql
            strategyDetailService.updateStats(detail);
        }
    }

    /**
     * 方法 游记统计数据的缓存数据落地，把 redis 持久化到 mysql 中游记统计数据的缓存数据落地，把 redis 持久化到 mysql 中
     */
    public void travelStatsDataDown() {
        //从redis中查询出所有的热数据(游记 五数统计数据)
        List<TravelStats> vos = travelStatsCacheService.listAllTravelStats();
        for (TravelStats vo : vos) {
            //取出热数据
            Travel travel = new Travel();
            travel.setId(vo.getTravelId());
            travel.setFavornum(vo.getFavornum());
            travel.setReplynum(vo.getReplynum());
            travel.setViewnum(vo.getViewnum());
            travel.setThumbsupnum(vo.getThumbsupnum());
            travel.setSharenum(vo.getSharenum());

            //更新到mysql
            travelService.updateStats(travel);
        }
    }
    /**
     * 方法 景点统计数据的缓存数据落地，把 redis 持久化到 mysql 中景点统计数据的缓存数据落地，把 redis 持久化到 mysql 中
     */
    public void scenicStatsDataDown() {
        //从redis中查询出所有的热数据(景点统计数据)
        List<ScenicStats> vos = statsCacheService.listAll();
        for (ScenicStats vo : vos) {
            //取出热数据
            Scenic scenic = new Scenic();
            scenic.setId(vo.getScenicId());
            scenic.setFavornum(vo.getFavornum());
            scenic.setReplynum(vo.getReplynum());
            scenic.setVisitnum(vo.getVisitnum());
            //更新到mysql
            scenicService.updateStats(scenic);
        }
    }

    /**
     * 方法 攻略统计数据 缓存起来，把 mysql 的攻略数据缓存到 redis 中
     * @param forse 是否强制执行
     */
    public void strategyStatsToRedis(boolean forse) {
        //查询所有攻略数据，准备给 redis 做缓存
        List<StrategyDetail> list = strategyDetailService.selectAll();

        //如果是强制执行，就删除排行榜数据，让其再生成
        if (forse) {
            strategyStatsCacheService.deleteStrategySort(RedisKey.STRATEGY_STATS_UP_SORT.getPrefix());
            strategyStatsCacheService.deleteStrategySort(RedisKey.STRATEGY_STATS_HOT_SORT.getPrefix());
        }

        for (StrategyDetail strategyDetail : list) {
            //缓存中没有数据才缓存数据，或者强制执行
            if ( !strategyStatsCacheService.hasStatsKey(strategyDetail.getId()) || forse) {
                //封装vo对象
                StrategyStats vo = new StrategyStats();
                vo.setDestId(strategyDetail.getDest().getId());         //目的地id
                vo.setDestName(strategyDetail.getDest().getName());     //目的地名称
                vo.setTitle(strategyDetail.getTitle());                 //攻略标题
                vo.setStrategyId(strategyDetail.getId());               //攻略id

                vo.setViewnum(strategyDetail.getViewnum());             //阅读数
                vo.setReplynum(strategyDetail.getReplynum());           //评论数
                vo.setFavornum(strategyDetail.getFavornum());           //收藏数
                vo.setSharenum(strategyDetail.getSharenum());           //分享数
                vo.setThumbsupnum(strategyDetail.getThumbsupnum());     //点赞数

                System.out.println(vo);

                //缓存到redies中，替换存储
                strategyStatsCacheService.setStrategyStats(vo);
            }

            //飙升排行榜数据存入缓存，没有才执行
            if ( !strategyStatsCacheService.existInRank(RedisKey.STRATEGY_STATS_UP_SORT, strategyDetail.getId()) ) {
                //飙升排行值=阅读数+评论数
                int num = strategyDetail.getViewnum() + strategyDetail.getReplynum();
                strategyStatsCacheService.addInRand(RedisKey.STRATEGY_STATS_UP_SORT, num, strategyDetail.getId());
            }
            //热度排行榜数据存入缓存，没有才执行
            if ( !strategyStatsCacheService.existInRank(RedisKey.STRATEGY_STATS_HOT_SORT, strategyDetail.getId()) ) {
                //热门排行值=收藏数+点赞数
                int num = strategyDetail.getFavornum() + strategyDetail.getThumbsupnum();
                strategyStatsCacheService.addInRand(RedisKey.STRATEGY_STATS_HOT_SORT, num, strategyDetail.getId());
            }
        }
    }
    /**
     * 方法 景点统计数据 缓存起来，把 mysql 的景点数据缓存到 redis 中
     * @param forse 是否强制执行
     */
    public void scenicStatsToRedis(boolean forse) {
        //查询所有攻略数据，准备给 redis 做缓存
        List<Scenic> list = scenicService.listAll();
        for (Scenic scenic : list) {
            //缓存中没有数据才缓存数据，或者强制执行
            if ( !statsCacheService.hasStatsKey(scenic.getId()) || forse) {
                //封装vo对象
                ScenicStats vo = new ScenicStats();
                vo.setScenicId(scenic.getId());                //id
                vo.setVisitnum(scenic.getVisitnum());           //去过数
                vo.setReplynum(scenic.getReplynum());           //点评数
                vo.setFavornum(scenic.getFavornum());           //收藏数
                System.out.println(vo);
                //缓存到redies中，替换存储
                statsCacheService.setScenicStats(vo);
            }
        }
    }

    /**
     * 方法 游记统计数据 缓存起来，把 mysql 的游记数据缓存到 redis 中
     * @param forse 是否强制执行
     */
    public void travelStatsToRedis(boolean forse) {
        //查询所有游记数据，准备给 redis 做缓存
        List<Travel> list = travelService.list();

        //如果是强制执行，就删除排行榜数据，让其再生成
        if (forse) {
            travelStatsCacheService.deleteTravelSort(RedisKey.TRAVEL_STATS_UP_SORT.getPrefix());
            travelStatsCacheService.deleteTravelSort(RedisKey.TRAVEL_STATS_HOT_SORT.getPrefix());
        }

        for (Travel travel : list) {
            //缓存中没有数据才缓存数据，或者强制执行
            if ( !travelStatsCacheService.hasStatsKey(travel.getId()) || forse) {
                //封装vo对象
                TravelStats vo = new TravelStats();
                vo.setDestId(travel.getDest().getId());                 //目的地id
                vo.setDestName(travel.getDest().getName());             //目的地名称
                vo.setAuthorId(travel.getAuthor().getId());             //作者id
                vo.setAuthorName(travel.getAuthor().getNickname());     //作者昵称
                vo.setTitle(travel.getTitle());                         //游记标题
                vo.setTravelId(travel.getId());                         //游记id

                vo.setViewnum(travel.getViewnum());             //阅读数
                vo.setReplynum(travel.getReplynum());           //评论数
                vo.setFavornum(travel.getFavornum());           //收藏数
                vo.setSharenum(travel.getSharenum());           //分享数
                vo.setThumbsupnum(travel.getThumbsupnum());     //点赞数

                System.out.println(vo);

                //缓存到redies中，替换存储
                travelStatsCacheService.setTravelStats(vo);
            }

            //飙升排行榜数据存入缓存，没有才执行
            if ( !travelStatsCacheService.existInRank(RedisKey.TRAVEL_STATS_UP_SORT, travel.getId()) ) {
                //飙升排行值=阅读数+评论数
                int num = travel.getViewnum() + travel.getReplynum();
                travelStatsCacheService.addInRand(RedisKey.TRAVEL_STATS_UP_SORT, num, travel.getId());
            }
            //热度排行榜数据存入缓存，没有才执行
            if ( !travelStatsCacheService.existInRank(RedisKey.TRAVEL_STATS_HOT_SORT, travel.getId()) ) {
                //热门排行值=收藏数+点赞数
                int num = travel.getFavornum() + travel.getThumbsupnum();
                travelStatsCacheService.addInRand(RedisKey.TRAVEL_STATS_HOT_SORT, num, travel.getId());
            }
        }
    }

    /**
     * 显示 后台首页（用目的地管理页充当）
     */
    @RequestMapping("/")
    public String index(@ModelAttribute("qo")DestinationQueryObject qo, Model model) {

        //列表数据
        model.addAttribute("pageInfo", destinationService.query(qo));
        //吐司
        model.addAttribute("toasts", destinationService.getToasts(qo.getParentId()));
        return "destination/list";
    }

    /**
     * 方法 提问统计数据 缓存起来，把 mysql 的提问数据缓存到 redis 中
     * @param forse 是否强制执行
     */
    public void questionStatsToRedis(boolean forse) {
        //查询所有问题数据，准备给 redis 做缓存
        List<Question> questions = questionService.listAll();

        for (Question question : questions) {
            //缓存中没有数据才缓存数据，或者强制执行
            if ( !questionStatsCacheService.hasStatsKey(question.getId()) || forse) {
                //封装vo对象
                QuestionStats vo = new QuestionStats();
                vo.setUserId(question.getAuthor().getId());//提问者id
                vo.setUserName(question.getAuthor().getNickname());//提问者昵称
                vo.setHeadImgUrl(question.getAuthor().getHeadImgUrl());//提问者头像
                vo.setLevel(question.getAuthor().getLevel());//提问者等级
                vo.setQuestionId(question.getId());//问题id

                vo.setViewNum(question.getViewNum());//阅读数
                vo.setAnswerNum(question.getAnswerNum());//该问题的回答数
                vo.setFocusMemberNum(question.getFocusMemberNum());//被关注数
                vo.setShareNum(question.getShareNum());//共享数

                System.out.println(vo);

                //缓存到redies中，替换存储
                questionStatsCacheService.setQuestionStats(vo);
            }
        }
    }

    /**
     * 方法 问题统计数据的缓存数据落地，把 redis 持久化到 mysql 中问题统计数据的缓存数据落地，把 redis 持久化到 mysql 中
     */
    public void questionStatsDataDown() {
        //从redis中查询出所有的热数据
        List<QuestionStats> vos = questionStatsCacheService.listAllQuestionStats();
        for (QuestionStats vo : vos) {
            //取出热数据
            Question question = new Question();
            question.setId(vo.getQuestionId());
            question.setViewNum(vo.getViewNum());
            question.setAnswerNum(vo.getAnswerNum());
            question.setFocusMemberNum(vo.getFocusMemberNum());
            question.setShareNum(vo.getShareNum());
            //更新到MySQL
            questionService.update(question);
        }
    }

    /**
     * 方法 回答统计数据 缓存起来，把mongodb的回答数据缓存到 redis 中
     * @param forse 是否强制执行
     */
    public void answerStatsToRedis(boolean forse) {
        //查询所有回答数据，准备给 redis 做缓存
        List<Answer> answers = answerService.listAll();

        for (Answer answer : answers) {
            //缓存中没有数据才缓存数据，或者强制执行
            if ( !answerStatsCacheService.hasStatsKey(answer.getId()) || forse) {
                //封装vo对象
                AnswerStats vo = new AnswerStats();
                vo.setAnswerId(answer.getId());
                vo.setQuestionId(answer.getQuestionId());
                vo.setAuthorId(answer.getAuthorId());
                vo.setUserName(answer.getAuthorname());
                vo.setHeadImgUrl(answer.getHeadUrl());
                vo.setLevel(answer.getLevel());
                vo.setSharenum(answer.getShareNum());
                vo.setThumbsupnum(answer.getThumbupNum());
                vo.setGolden(answer.getGolden());

                System.out.println(vo);

                //缓存到redies中，替换存储
                answerStatsCacheService.setAnswerStats(vo);
            }
        }
    }

    /**
     * 把榜单数据缓存到redis
     * @param forse
     */
    public void userRankStatsToRedis(boolean forse) {
        //查询所有回答数据，准备给 redis 做缓存
        List<Answer> answers = answerService.listAll();

        //如果是强制执行，就删除排行榜数据，让其再生成
        if (forse) {
            userRankStatsCacheService.deleteUserSort(RedisKey.USER_ANSWER_GOLDEN_SORT.getPrefix());
            userRankStatsCacheService.deleteUserSort(RedisKey.USER_ANSWER_ANSWERSNUM_SORT.getPrefix());
            userRankStatsCacheService.deleteUserSort(RedisKey.USER_ANSWER_THUMBUP_SORT.getPrefix());
        }

        for (Answer answer : answers) {
            //缓存中没有数据才缓存数据，或者强制执行
            if ( !userRankStatsCacheService.hasStatsKey(answer.getAuthorId(),answer.getId()) || forse) {
                //封装vo对象
                String cacheKey = RedisKey.USER_SCORE_STATS.getCacheKey(answer.getAuthorId());

                if(userRankStatsCacheService.hasStatsKeyOfUser(answer.getAuthorId())){//如果缓存中有了该用户,只是还没有该回答的数据
                    //调用方法把该回答的数据加到该用户统计数据中
                    UserRankStats userRankStats = userRankStatsCacheService.addAnswerData(cacheKey,answer);
                    //补充用户数据
                    userRankStats.setUser(userInfoService.get(answer.getAuthorId()));
                    //缓存到redies中，替换存储
                    userRankStatsCacheService.setUserRankStats(userRankStats);
                }else{//缓存中根本还没有该用户数据
                    UserRankStats userRankStats = new UserRankStats();
                    if(answer.getGolden()){
                        userRankStats.setGoldenNum(userRankStats.getAnswersNum()+1);//金牌数
                    }
                    userRankStats.setAnswersNum(userRankStats.getAnswersNum()+1);//回答数
                    List<String> answerIds = userRankStats.getAnswers();
                    answerIds.add(answer.getId());
                    userRankStats.setAnswers(answerIds);//设置回答集合
                    userRankStats.setThumbsupnum(userRankStats.getThumbsupnum()+answer.getThumbupNum());//点赞数
                    //补充用户数据
                    userRankStats.setUser(userInfoService.get(answer.getAuthorId()));
                    //缓存到redies中，替换存储
                    userRankStatsCacheService.setUserRankStats(userRankStats);
                }
            }
        }
        //把用户统计数据从redis取出来
        List<UserRankStats> vos = userRankStatsCacheService.listAll();
        for (UserRankStats vo : vos) {
            //金牌排行榜数据存入缓存,没有才执行
            if(!userRankStatsCacheService.existInRank(RedisKey.USER_ANSWER_GOLDEN_SORT,vo.getUser().getId())){
                //金牌排行值=金牌数
                int num = vo.getGoldenNum();
                userRankStatsCacheService.addInRand(RedisKey.USER_ANSWER_GOLDEN_SORT,num,vo.getUser().getId());
            }
            //回答数排行榜数据存入缓存,没有才执行
            if(!userRankStatsCacheService.existInRank(RedisKey.USER_ANSWER_ANSWERSNUM_SORT,vo.getUser().getId())){
                //回答排行值=回答数
                int num = vo.getAnswersNum();
                userRankStatsCacheService.addInRand(RedisKey.USER_ANSWER_ANSWERSNUM_SORT,num,vo.getUser().getId());
            }
            //被点赞数排行榜数据存入缓存,没有才执行
            if(!userRankStatsCacheService.existInRank(RedisKey.USER_ANSWER_THUMBUP_SORT,vo.getUser().getId())){
                //被点赞排行值=被点赞数
                int num = vo.getThumbsupnum();
                userRankStatsCacheService.addInRand(RedisKey.USER_ANSWER_THUMBUP_SORT,num,vo.getUser().getId());
            }
        }

    }
}
