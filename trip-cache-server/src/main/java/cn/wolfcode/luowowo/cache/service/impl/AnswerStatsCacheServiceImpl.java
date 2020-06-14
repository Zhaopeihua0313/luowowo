package cn.wolfcode.luowowo.cache.service.impl;

import cn.wolfcode.luowowo.article.service.IAnswerService;
import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.IAnswerStatsCacheService;
import cn.wolfcode.luowowo.cache.vo.AnswerStats;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.common.util.DateUtil;
import com.alibaba.fastjson.JSON;
import org.apache.dubbo.config.annotation.Reference;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.util.StringUtils;
import java.util.Date;
import java.util.concurrent.TimeUnit;

@Service
public class AnswerStatsCacheServiceImpl implements IAnswerStatsCacheService{

    @Autowired
    private StringRedisTemplate redisTemplate;

    @Reference
    private IAnswerService answerService;

    /**
     * 操作回答点赞
     * @param answerId
     * @param userId
     * @return
     */
    public AjaxResult answerThumbup(String answerId, Long userId) {
        AjaxResult ajaxResult = new AjaxResult();
        String cacheKey = RedisKey.ANSWER_STATS_THUMNUP.getCacheKey(answerId + ":" + userId);
        String s = redisTemplate.opsForValue().get(cacheKey);
        //查询redis用户是否有点赞,有就不点赞,没有才点赞
        if(!StringUtils.hasLength(redisTemplate.opsForValue().get(cacheKey))){
            //用户没有点过赞,所以点赞,设置过期时间为一天
            Date start = new Date();
            Date endDate = DateUtil.getEndDate(start);
            long dateBetween = DateUtil.getDateBetween(start, endDate);//有效期,单位毫秒
            //把标记设置到redis
            redisTemplate.opsForValue().set(cacheKey,"1",dateBetween, TimeUnit.MILLISECONDS);
            //MongoDB里面对应的点赞数要增加
            answerService.updateThumbup(answerId,1);
        }else{
            ajaxResult.mark("你今天已经点过赞啦");
        }
        return ajaxResult;
    }

    //判断缓存有没有对应的key
    public boolean hasStatsKey(String answerId) {
        return redisTemplate.hasKey(RedisKey.ANSWER_STATS.getCacheKey(answerId));
    }

    //把数据存到缓存
    public void setAnswerStats(AnswerStats vo) {
        String answerId = vo.getAnswerId();
        String cacheKey = RedisKey.ANSWER_STATS.getCacheKey(answerId);
        //把问题统计对象转换成 json 字符串，然后 ops 直接 set 就替换原数据
        redisTemplate.opsForValue().set(cacheKey, JSON.toJSONString(vo));
    }

    /**
     * 从redis缓存取出数据
     */
    public AnswerStats getAnswerStats(String answerId){
        String answerCacheKey = RedisKey.ANSWER_STATS.getCacheKey(answerId);
        String json = redisTemplate.opsForValue().get(answerCacheKey);
        return JSON.parseObject(json,AnswerStats.class);
    }

}
