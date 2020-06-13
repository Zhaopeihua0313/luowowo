package cn.wolfcode.luowowo.cache.service;

import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.vo.TravelStats;
import cn.wolfcode.luowowo.common.util.AjaxResult;

import java.util.List;

/**
 * 游记统计缓存服务
 */
public interface ITravelStatsCacheService {

    int TRAVEL_STATS_VIEWNUM=1;   //阅读数
    int TRAVEL_STATS_REPLYNUM=2;  //评论数
    int TRAVEL_STATS_FAVORNUM=3;  //收藏数
    int TRAVEL_STATS_THUMBUP=4;   //评论数
    int TRAVEL_STATS_SHARENUM=5;

    /**
     * 判断 判断 redies 缓存中有没有对应的 key
     */
    boolean hasStatsKey(Long travelId);

    /**
     * 设置 往缓存中存入游记缓存
     */
    void setTravelStats(TravelStats vo);

    /**
     * 获取 根据游记 id 获取缓存中的某游记所有统计数据
     */
    TravelStats getStatsById(Long travelId);

    /**
     * 设置 给某个统计字段增加一定数值
     */
    void incrbyNum(Long travelId, int num, int travelType);

    /**
     * 操作 收藏游记
     */
    boolean favor(Long travelId, Long userId);

    /**
     * 判断 是否已收藏
     */
    boolean isFavor(Long travelId, Long userId);


    /**
     * 操作 用户点赞顶游记
     */
    AjaxResult thumbup(Long travelId, Long id);

    /**
     * 获取 所有游记的统计数据缓存
     */
    List<TravelStats> listAllTravelStats();

    /**
     * 判断 游记在排行榜缓存里是否存在
     * @param sortKey 排行榜key
     * @param travelId 游记id
     * @return true存在 false不存在
     */
    boolean existInRank(RedisKey sortKey, Long travelId);

    /**
     * 增加 把 游记排行数据 增加排行序数 并且存在缓存中
     * @param sortKey 排行榜key
     * @param num 要增加排行序数(越大的越前)
     * @param travelId 游记id
     */
    void addInRand(RedisKey sortKey, int num, Long travelId);

    /**
     * 获取 某游记排行榜缓存前几个
     * @param sortKey 游记排行榜key
     * @param count 前几个
     */
    List<TravelStats> listRankTopCount(RedisKey sortKey, int count);

    /**
     * 删除 某游记排行
     */
    void deleteTravelSort(String sortKey);

    /**
     * 获取 阅读总数
     * @param userId
     * @return
     */
    int getReadNumById(Long userId);


    /**
     * 获取 今日访问量
     * @return
     */
    int getTodayNum();

    /**
     * 获取 访问总量
     * @return
     */
    int addAccess();

    /**
     * 根据用户id 查询收藏游记
     * @param userId
     * @return
     */
    List<Long> listTravelsByUserId(Long userId);
}
