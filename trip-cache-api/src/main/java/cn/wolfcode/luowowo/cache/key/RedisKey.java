package cn.wolfcode.luowowo.cache.key;

import cn.wolfcode.luowowo.common.util.Consts;
import lombok.Getter;

/**
 * redis 的 键名工具类
 */
@Getter
public enum RedisKey {

    VERIFY_CODE("verify_code", Consts.VERIFY_CODE_TIMEOUT),         //验证码
    USER_INFO(Consts.USER_INFO_TOKEN, Consts.USER_INFO_TIMEOUT),    //用户

    STRATEGY_STATS("strategy_stats", -1L),                          //攻略统计
    STRATEGY_STATS_THUMBUP("strategy_stats_thumbup", -1L),          //攻略点赞统计
    STRATEGY_STATS_HOT_SORT("strategy_stats_hot_sort", -1L),        //攻略热门统计排序
    STRATEGY_STATS_UP_SORT("strategy_stats_up_sort", -1L),          //攻略飙升统计排序
    STRATEGY_STATS_FAVOR("strategy_stats_favor", -1L),              //攻略收藏统计

    TRAVEL_STATS("travel_stats", -1L),                               //游记统计
    TRAVEL_STATS_THUMBUP("travel_stats_thumbup", -1L),               //游记点赞统计
    TRAVEL_STATS_HOT_SORT("travel_stats_hot_sort", -1L),             //游记热门统计排序
    TRAVEL_STATS_UP_SORT("travel_stats_up_sort", -1L),               //游记飙升统计排序
    TRAVEL_STATS_FAVOR("travel_stats_favor", -1L),                  //游记收藏统计

    SCENIC_STATS("scenic_stats", -1L),                            //景点统计
    SCENIC_STATS_VISIT("scenic_stats_visit", -1L),              //景点去过统计
    SCENIC_STATS_FAVOR("scenic_stats_favor", -1L),              //景点收藏统计


    ANSWER_STATS_THUMNUP("answer_stats_thumnup",-1L),               //社区回答点赞
    ANSWER_STATS("answer_stats",-1L),                                 //回答统计
    USER_SCORE_STATS("user_score_stats",-1L),                        //用户各种得分统计
    USER_ANSWER_GOLDEN_SORT("user_answer_golden_sort",-1L),        //用户所得金牌数统计排序
    USER_ANSWER_ANSWERSNUM_SORT("user_answer_answersnum_sort",-1L),//用户的回答数统计排序
    USER_ANSWER_THUMBUP_SORT("user_answer_thumbup_sort",-1L),      //用户的回答被点赞数统计排序

    QUESTION_STATS("question_stats",-1L),                           //问题统计
    QUESTION_STATS_FOCUS("question_stats_focus",-1L);               //问题被关注统计


    private String prefix;      // key 前缀
    private Long timeout;       // key 超时时间 -1L 永不超时

    RedisKey(String prefix, Long timeout) {
        this.prefix = prefix;
        this.timeout = timeout;
    }

    /**
     * 拼接前缀返回
     */
    public String getCacheKey(Object key) {
        return prefix + ":" + key;
    }
}
