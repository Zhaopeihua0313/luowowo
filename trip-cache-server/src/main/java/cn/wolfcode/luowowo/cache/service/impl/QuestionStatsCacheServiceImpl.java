package cn.wolfcode.luowowo.cache.service.impl;

import cn.wolfcode.luowowo.article.service.IAnswerService;
import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.IAnswerStatsCacheService;
import cn.wolfcode.luowowo.cache.service.IQuestionStatsCacheService;
import cn.wolfcode.luowowo.cache.vo.QuestionStats;
import cn.wolfcode.luowowo.cache.vo.StrategyStats;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.common.util.DateUtil;
import com.alibaba.fastjson.JSON;
import org.apache.dubbo.config.annotation.Reference;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

@Service
public class QuestionStatsCacheServiceImpl implements IQuestionStatsCacheService {

    @Autowired
    private StringRedisTemplate redisTemplate;

    //判断缓存有没有对应的key
    public boolean hasStatsKey(Long questionId) {
        return redisTemplate.hasKey(RedisKey.QUESTION_STATS.getCacheKey(questionId));
    }

    //把数据存到缓存
    public void setQuestionStats(QuestionStats vo) {
        Long questionId = vo.getQuestionId();
        String key = RedisKey.QUESTION_STATS.getCacheKey(questionId);
        //把问题统计对象转换成 json 字符串，然后 ops 直接 set 就替换原数据
        redisTemplate.opsForValue().set(key, JSON.toJSONString(vo));
    }

    //从缓存取出数据
    public QuestionStats getQuestionStats(Long questionId) {
        String key = RedisKey.QUESTION_STATS.getCacheKey(questionId);
        String json = redisTemplate.opsForValue().get(key);
        //把json字符串还原成问题统计对象
        return JSON.parseObject(json, QuestionStats.class);
    }

    //统计数据的改变
    public void incr(Long questionId, int num, int questionType) {
        ValueOperations<String, String> ops = redisTemplate.opsForValue();
        //根据问题id从缓存中取出对象,并转换成问题统计对象
        String cacheKey = RedisKey.QUESTION_STATS.getCacheKey(questionId);
        String json = ops.get(cacheKey);
        QuestionStats vo = JSON.parseObject(json, QuestionStats.class);
        //根据类型对统计值做变化
        switch (questionType){
            case QUESTION_STATS_VIEWNUM://阅读数
                vo.setViewNum(vo.getViewNum()+num);
                break;
            case QUESTION_STATS_ANSWERNUM://回答数
                vo.setAnswerNum(vo.getAnswerNum()+num);
                break;
            case QUESTION_STATS_FOCUSNUM://关注数
                vo.setFocusMemberNum(vo.getFocusMemberNum()+num);
                break;
            case QUESTION_STATS_SHARENUM://共享数
                vo.setShareNum(vo.getShareNum()+num);
                break;
        }
        //在缓存中更新vo对象
        setQuestionStats(vo);
    }

    //关注
    public boolean focus(Long userId, Long questionId) {
        int num = 0;//偏移量
        boolean flag = false;//返回的关注结果
        List<Long> ids = new ArrayList<>();
        //获取缓存key
        String cacheKey = RedisKey.QUESTION_STATS_FOCUS.getCacheKey(userId);
        //获取该用户的关注记录
        String s = redisTemplate.opsForValue().get(cacheKey);//该用户的关注记录
        if(StringUtils.hasLength(s)){//说明有关注过,解析他的关注记录
            ids = JSON.parseArray(s, Long.class);
        }
        if(ids.contains(questionId)){//该用户关注过该问题
            //取消关注
            ids.remove(questionId);
            num = -1;
        }else {
            //关注
            ids.add(questionId);
            num = 1;
            flag = true;
        }
        //保存关注记录
        redisTemplate.opsForValue().set(cacheKey,JSON.toJSONString(ids));
        //更新统计数据
        incr(questionId,num,QUESTION_STATS_FOCUSNUM);
        return flag;
    }

    //判断该用户有没有关注过该问题
    public boolean isFocus(Long userId, Long questionId) {
        List<Long> ids = new ArrayList<>();
        //获取缓存key
        String cacheKey = RedisKey.QUESTION_STATS_FOCUS.getCacheKey(userId);
        //获取该用户的关注记录
        String s = redisTemplate.opsForValue().get(cacheKey);//该用户的关注记录
        if(StringUtils.hasLength(s)){//说明有关注过,解析他的关注记录
            ids = JSON.parseArray(s, Long.class);
        }
        return ids.contains(questionId);
    }

    @Override
    public List<QuestionStats> listAllQuestionStats() {
        ArrayList<QuestionStats> vos = new ArrayList<>();

        //使用通配符获取所有的
        String cacheKey = RedisKey.QUESTION_STATS.getCacheKey("*");
        Set<String> keys = redisTemplate.keys(cacheKey);
        for (String key : keys) {
            String json = redisTemplate.opsForValue().get(key);
            QuestionStats vo = JSON.parseObject(json, QuestionStats.class);
            vos.add(vo);
        }

        return vos;
    }

}
