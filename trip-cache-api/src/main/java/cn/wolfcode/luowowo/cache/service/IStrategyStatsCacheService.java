package cn.wolfcode.luowowo.cache.service;

import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.vo.StrategyStats;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import java.util.List;

/**
 * 攻略统计缓存服务
 */
public interface IStrategyStatsCacheService {

    int STRATEGY_STATS_VIEWNUM=1;   //阅读数
    int STRATEGY_STATS_REPLYNUM=2;  //评论数
    int STRATEGY_STATS_FAVORNUM=3;  //收藏数
    int STRATEGY_STATS_THUMBUP=4;   //评论数
    int STRATEGY_STATS_SHARENUM=5;   //分享数

    /**
     * 判断 判断 redies 缓存中有没有对应的 key
     */
    boolean hasStatsKey(Long detailId);

    /**
     * 设置 往缓存中存入攻略缓存
     */
    void setStrategyStats(StrategyStats vo);

    /**
     * 获取 根据攻略 id 获取缓存中的某攻略所有统计数据
     */
    StrategyStats getStatsById(Long strategyId);

    /**
     * 设置 给某个统计字段增加一定数值
     */
    void incrbyNum(Long detailId, int num, int strategyType);

    /**
     * 操作 收藏攻略
     */
    boolean favor(Long strategyId, Long userId);

    /**
     * 判断 是否已收藏
     */
    boolean isFavor(Long strategyId, Long userId);

    /**
     * 操作 用户点赞顶攻略
     */
    AjaxResult thumbup(Long strategyId, Long id);

    /**
     * 获取 所有攻略的统计数据缓存
     */
    List<StrategyStats> listAllStrategyStats();

    /**
     * 判断 攻略在排行榜缓存里是否存在
     * @param sortKey 排行榜key
     * @param strategyId 攻略id
     * @return true存在 false不存在
     */
    boolean existInRank(RedisKey sortKey, Long strategyId);

    /**
     * 增加 把 攻略排行数据 增加排行序数 并且存在缓存中
     * @param sortKey 排行榜key
     * @param num 要增加排行序数(越大的越前)
     * @param strategyId 攻略id
     */
    void addInRand(RedisKey sortKey, int num, Long strategyId);

    /**
     * 获取 某攻略排行榜缓存前几个
     * @param sortKey 攻略排行榜key
     * @param count 前几个
     */
    List<StrategyStats> listRankTopCount(RedisKey sortKey, int count);

    /**
     * 删除 某攻略排行
     */
    void deleteStrategySort(String sortKey);

    /**
     * 查询所有攻略
     * @param strategyId
     * @return
     */
    StrategyStats getStrategyById(Long strategyId);

    /**
     * 根据攻略文章的id查询如数据
     * @param detailId
     * @return
     */
    StrategyStats getStrategyState(Long detailId);

    /**
     * 收藏过此攻略的用户
     * @param userId
     * @return
     */
    List<Long> listStrategiesByUserId(Long userId);

}
