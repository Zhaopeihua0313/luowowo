package cn.wolfcode.luowowo.cache.service.impl;

import cn.wolfcode.luowowo.article.domain.Answer;
import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.IUserRankStatsCacheService;
import cn.wolfcode.luowowo.cache.vo.UserRankStats;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import com.alibaba.fastjson.JSON;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Created by huawei on 2019/11/26.
 */

@Service
public class UserRankStatsCacheServiceImpl implements IUserRankStatsCacheService {

    @Autowired
    private StringRedisTemplate redisTemplate;

    //判断是否有缓存数据
    public boolean hasStatsKey(Long authorId,String answerId) {
        String cacheKey = RedisKey.USER_SCORE_STATS.getCacheKey(authorId);
        //首先看看缓存中有没有数据
        Boolean aBoolean = redisTemplate.hasKey(cacheKey);//有用户数据就是true
        Boolean bBoolean = true;
        if(aBoolean){
            //如果有,再看缓存中的数据包不包括该回答
            String s = redisTemplate.opsForValue().get(cacheKey);
            UserRankStats userRankStats = JSON.parseObject(s, UserRankStats.class);
            List<String> answers = userRankStats.getAnswers();
            bBoolean = answers.contains(answerId);//包含就是true
        }
        return aBoolean && bBoolean;
    }
    //判断缓存是否有缓存的用户数据
    public boolean hasStatsKeyOfUser(Long authorId) {
        String cacheKey = RedisKey.USER_SCORE_STATS.getCacheKey(authorId);
        return redisTemplate.hasKey(cacheKey);
    }

    //初始化数据
    public UserRankStats addAnswerData(String cacheKey, Answer answer) {
        String s = redisTemplate.opsForValue().get(cacheKey);
        UserRankStats userRankStats = JSON.parseObject(s, UserRankStats.class);
        if(answer.getGolden()){
            userRankStats.setGoldenNum(userRankStats.getAnswersNum()+1);//金牌数
        }
        userRankStats.setAnswersNum(userRankStats.getAnswersNum()+1);//回答数
        List<String> answers = userRankStats.getAnswers();
        answers.add(answer.getId());
        userRankStats.setAnswers(answers);//设置回答集合
        userRankStats.setThumbsupnum(userRankStats.getThumbsupnum()+answer.getThumbupNum());//点赞数
        return userRankStats;
    }

    //往缓存中存入用户统计缓存
    public void setUserRankStats(UserRankStats userRankStats) {
        Long userId = userRankStats.getUser().getId();
        String cacheKey = RedisKey.USER_SCORE_STATS.getCacheKey(userId);
        //存入redis
        redisTemplate.opsForValue().set(cacheKey,JSON.toJSONString(userRankStats));
    }

    //从缓存中取出用户统计数据
    public List<UserRankStats> listAll() {
        ArrayList<UserRankStats> vos = new ArrayList<>();
        String cacheKey = RedisKey.USER_SCORE_STATS.getCacheKey("*");
        Set<String> keys = redisTemplate.keys(cacheKey);
        for (String key : keys) {
            String json = redisTemplate.opsForValue().get(key);
            UserRankStats userRankStats = JSON.parseObject(json, UserRankStats.class);
            vos.add(userRankStats);
        }
        return vos;
    }

    //判断用户在排行榜是否存在
    public boolean existInRank(RedisKey key, Long userId) {
        String value = RedisKey.USER_SCORE_STATS.getCacheKey(userId);
        //zset 取出某有序列表里某元素排名，没有排名会返回 null
        Long rank = redisTemplate.opsForZSet().rank(key.getPrefix(), value);
        return rank!=null;
    }

    //在redis生成排行数据
    public void addInRand(RedisKey key, int num, Long value) {
        //incrementScore(zset名, zset里的元素名, 分数) ：增加zset里某元素的排序值
        redisTemplate.opsForZSet().incrementScore(key.getPrefix(),RedisKey.USER_SCORE_STATS.getCacheKey(value),num);
    }

    //查询排行榜前几名
    public List<UserRankStats> ranklistTop10(RedisKey key, int count) {
        ArrayList<UserRankStats> list = new ArrayList<>();
        //zset 按照降序选定范围返回元素
        Set<String> sets = redisTemplate.opsForZSet().reverseRange(key.getPrefix(), 0, count - 1);//返回的是名称(这里我用的用户统计redis的对象的key)
        for (String set : sets) {
            String s = redisTemplate.opsForValue().get(set);//根据名称去用户统计redis里面找到对应的对象
            UserRankStats userRankStats = JSON.parseObject(s, UserRankStats.class);
            list.add(userRankStats);
        }
        return list;
    }

    //给统计数据某个字段添加值
    public void incr(Long userId, int num, int type) {
        ValueOperations<String, String> ops = redisTemplate.opsForValue();
        //根据用户 id 从缓存中获取vo对象，并且转换成用户统计数据对象
        String cacheKey = RedisKey.USER_SCORE_STATS.getCacheKey(userId);
        UserRankStats vo = JSON.parseObject(ops.get(cacheKey), UserRankStats.class);
        //根据类型, 对统计值进行添加
        switch (type) {
            case USER_STSTS_GOLDEN: //金牌数
                vo.setGoldenNum(vo.getGoldenNum()+num);
                break;
            case USER_STSTS_ANSWER://回答数
                vo.setAnswersNum(vo.getAnswersNum()+num);
                break;
            case USER_STSTS_THUM://点赞数
                vo.setThumbsupnum(vo.getThumbsupnum()+num);
                break;
        }

        //在redies缓存中跟新vo对象
        setUserRankStats(vo);
    }

    //删除排行榜数据
    public void deleteUserSort(String sortKey) {
        redisTemplate.delete(sortKey);
    }

    //新注册用户后往缓存中增加一个用户统计缓存
    public void creatNewUserStats(UserInfo user) {
        UserRankStats userRankStats = new UserRankStats();
        userRankStats.setUser(user);
        setUserRankStats(userRankStats);
    }

}
