package cn.wolfcode.luowowo.cache.service;

import cn.wolfcode.luowowo.article.domain.Answer;
import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.vo.UserRankStats;
import cn.wolfcode.luowowo.member.domain.UserInfo;

import java.util.List;

/**
 * Created by huawei on 2019/11/26.
 */
public interface IUserRankStatsCacheService {

    int USER_STSTS_GOLDEN=0;   //金牌数
    int USER_STSTS_ANSWER=1;  //回答数
    int USER_STSTS_THUM=2;  //点赞数

    //判断是否有缓存数据
    boolean hasStatsKey(Long authorId,String answerId);
    //判断是否有用户统计数据
    boolean hasStatsKeyOfUser(Long authorId);
    //给用户补充回答数据
    UserRankStats addAnswerData(String cacheKey, Answer answer);
    //往缓存中存入用户统计缓存
    void setUserRankStats(UserRankStats userRankStats);
    //从缓存中取出用户统计数据
    List<UserRankStats> listAll();
    //判断用户在排行榜缓存里面是否存在
    boolean existInRank(RedisKey key, Long userId);
    //在redis生成排行数据
    void addInRand(RedisKey key, int num, Long value);
    //查询排行榜前几名
    List<UserRankStats> ranklistTop10(RedisKey key, int count);
    //给某个统计字段`添加一定的数值,即加分
    void incr(Long userId, int num, int type);
    //删除redis的排行榜数据
    void deleteUserSort(String prefix);
    //用户注册后生成一个相应的用户统计对象
    void creatNewUserStats(UserInfo user);

}
