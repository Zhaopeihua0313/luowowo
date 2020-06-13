package cn.wolfcode.luowowo.cache.service;

import cn.wolfcode.luowowo.cache.vo.ScenicStats;

import java.util.List;

/**
 * 景点统计缓存服务
 */
public interface IScenicStatsCacheService {

    int SCENIC_STATS_REPLYNUM = 1;  //点评数
    int SCENIC_STATS_FAVORNUM=2;  //收藏数
    int SCENIC_STATS_VISIT=3;   //去过数

    /**
     * 判断 判断 redies 缓存中有没有对应的 key
     */
    boolean hasStatsKey(Long scenicId);

    /**
     * 设置 往缓存中存入景点缓存
     */
    void setScenicStats(ScenicStats vo);

    /**
     * 获取 根据景点 id 获取缓存中的某景点所有统计数据
     */
    ScenicStats getStatsById(Long scenicId);

    /**
     * 设置 给某个统计字段增加一定数值
     */
    void incrbyNum(Long scenicId, int num, int scenicType);

    /**
     * 操作 收藏景点
     */
    boolean favor(Long scenicId, Long userId);
    /**
     * 操作 去过景点
     */
    boolean visit(Long scenicId, Long userId);

    /**
     * 判断 是否已收藏
     */
    boolean isFavor(Long scenicId, Long userId);
    /**
     * 判断 是否已点击去过
     */
    boolean isVisit(Long scenicId, Long userId);

    /**
     * 获取 所有景点的统计数据缓存
     */
    List<ScenicStats> listAll();

    /**
     * 根据用户id 获取收藏景点数据
     * @param userId
     * @return
     */
    List<Long> listScenicsByUserId(Long userId);
}
