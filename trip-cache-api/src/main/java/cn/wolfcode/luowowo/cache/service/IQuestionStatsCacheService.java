package cn.wolfcode.luowowo.cache.service;

import cn.wolfcode.luowowo.article.domain.Question;
import cn.wolfcode.luowowo.cache.vo.QuestionStats;
import cn.wolfcode.luowowo.common.util.AjaxResult;

import java.util.List;

/**
 * 攻略统计缓存服务
 */
public interface IQuestionStatsCacheService {

    int QUESTION_STATS_VIEWNUM=1;   //阅读数
    int QUESTION_STATS_ANSWERNUM=2;   //回答数
    int QUESTION_STATS_FOCUSNUM=3;   //关注数
    int QUESTION_STATS_SHARENUM=4;   //分享数

    /**
     * 判断 redies 缓存中有没有对应的 key
     * @param questionId
     * @return
     */
    boolean hasStatsKey(Long questionId);

    /**
     * 往缓存中存入问题缓存数据
     * @param vo
     */
    void setQuestionStats(QuestionStats vo);

    /**
     * 从缓存中阙处问题缓存对象
     * @param questionId
     * @return
     */
    QuestionStats getQuestionStats(Long questionId);

    /**
     * 对缓存数据做增减
     * @param questionId
     * @param i
     * @param questionStatsViewnum
     */
    void incr(Long questionId, int i, int questionStatsViewnum);

    /**
     * 问题关注
     * @param userId
     * @param questionId
     * @return
     */
    boolean focus(Long userId, Long questionId);

    /**
     * 判断该用户有没有关注过该问题
     * @param userId
     * @param questionId
     * @return
     */
    boolean isFocus(Long userId, Long questionId);

    /**
     * 获取所有的问题缓存
     * @return
     */
    List<QuestionStats> listAllQuestionStats();
}
