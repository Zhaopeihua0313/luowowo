package cn.wolfcode.luowowo.cache.service;

import cn.wolfcode.luowowo.cache.vo.AnswerStats;
import cn.wolfcode.luowowo.common.util.AjaxResult;

/**
 * 攻略统计缓存服务
 */
public interface IAnswerStatsCacheService {

    int ANSWER_STATS_THUMBUP=1;   //点赞数
    int ANSWER_STATS_SHARENUM=2;  //分享数

    /**
     * 给回答点赞
     * @param answerId
     * @param userId
     * @return
     */
    AjaxResult answerThumbup(String answerId, Long userId);

    /**
     * 判断 redies 缓存中有没有对应的 key
     * @param answerId
     * @return
     */
    boolean hasStatsKey(String answerId);

    /**
     * 往redis中存入回答缓存数据
     * @param vo
     */
    void setAnswerStats(AnswerStats vo);

    AnswerStats getAnswerStats(String answerId);

}
