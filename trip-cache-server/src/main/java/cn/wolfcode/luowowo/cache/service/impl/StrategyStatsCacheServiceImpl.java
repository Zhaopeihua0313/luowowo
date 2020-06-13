package cn.wolfcode.luowowo.cache.service.impl;

import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.IStrategyStatsCacheService;
import cn.wolfcode.luowowo.cache.vo.StrategyStats;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.common.util.DateUtil;
import com.alibaba.fastjson.JSON;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

@Service
public class StrategyStatsCacheServiceImpl implements IStrategyStatsCacheService {

    @Autowired
    private StringRedisTemplate redisTemplate;


    /**
     * 判断：判断 redies 缓存中有没有对应的 key
     */
    public boolean hasStatsKey(Long destilId) {
        return redisTemplate.hasKey(RedisKey.STRATEGY_STATS.getCacheKey(destilId));
    }

    /**
     * 获取：根据攻略 id 获取缓存中的某攻略所有统计数据
     */
    public StrategyStats getStatsById(Long strategyId) {
        String key = RedisKey.STRATEGY_STATS.getCacheKey(strategyId);
        String voStr = redisTemplate.opsForValue().get(key);
        return JSON.parseObject(voStr, StrategyStats.class);
    }

    /**
     * 更改：给某个统计字段增加一定数值
     */
    public void incrbyNum(Long detailId, int num, int strategyType) {
        ValueOperations<String, String> ops = redisTemplate.opsForValue();

        //根据攻略 id 从缓存中获取vo对象，并且转换成攻略统计数据对象
        String cacheKey = RedisKey.STRATEGY_STATS.getCacheKey(detailId);
        StrategyStats vo = JSON.parseObject(ops.get(cacheKey), StrategyStats.class);

        //根据类型, 对统计值进行添加
        switch (strategyType) {
            case STRATEGY_STATS_VIEWNUM: //阅读数
                vo.setViewnum(vo.getViewnum() + num);
                break;
            case STRATEGY_STATS_REPLYNUM://评论数
                vo.setReplynum(vo.getReplynum() + num);
                break;
            case STRATEGY_STATS_FAVORNUM://收藏数
                vo.setFavornum(vo.getFavornum() + num);
                break;
            case STRATEGY_STATS_THUMBUP: //点赞数
                vo.setThumbsupnum(vo.getThumbsupnum() + num);
                break;
            case STRATEGY_STATS_SHARENUM: //分享数
                vo.setSharenum(vo.getSharenum() + num);
        }

        //在redies缓存中跟新vo对象
        setStrategyStats(vo);
    }

    /**
     * 存：往缓存中存入攻略缓存
     */
    public void setStrategyStats(StrategyStats vo) {
        Long strategyId = vo.getStrategyId();
        String key = RedisKey.STRATEGY_STATS.getCacheKey(strategyId);

        //把攻略统计对象转换成 json 字符串，然后 ops 直接 set 就替换原数据
        redisTemplate.opsForValue().set(key, JSON.toJSONString(vo));
    }

    /**
     * 操作：用户收藏攻略或取消收藏
     */
    public boolean favor(Long strategyId, Long userId) {
        boolean flag = false;
        int num = -1;           //用作数据统计的增量，默认为攻略收藏数 -1

        //把用户做主题，key 为用户 id，redis 存的是每个用户的收藏，每个用户下又有多个收藏的攻略 id
        String cacheKey = RedisKey.STRATEGY_STATS_FAVOR.getCacheKey(userId);
        ValueOperations<String, String> ops = redisTemplate.opsForValue();
        List<Long> strategyIds = new ArrayList<>();
        //判断用户收藏里有没有该文章
        if (redisTemplate.hasKey(cacheKey)) {   //用户有收藏，获取收藏里有没有该攻略
            strategyIds = JSON.parseArray(ops.get(cacheKey), Long.class);
            //判断该用户是否有收藏该攻略，如果没有，那收藏操作成立，攻略收藏里添加该攻略并且攻略收藏数加一
            if (!strategyIds.contains(strategyId)) {
                num = 1;
                flag = true;
                strategyIds.add(strategyId);
            } else {    //如果用户已经有收藏了，还进行收藏操作，那就是取消收藏，攻略收藏里把该攻略剔除
                strategyIds.remove(strategyId);
            }
        } else {    //该用户没有收藏，给收藏里添加该攻略，另外设置收藏数为 1，用作数据统计
            strategyIds.add(strategyId);
            num = 1;
            flag = true;
        }

        //更新 redis 中该功率的收藏者
        ops.set(cacheKey, JSON.toJSONString(strategyIds));
        //收藏数添加
        incrbyNum(strategyId, num, IStrategyStatsCacheService.STRATEGY_STATS_FAVORNUM);

        return flag;
    }

    /**
     * 判断：判断用户是否已收藏该某攻略
     */
    public boolean isFavor(Long strategyId, Long userId) {
        //从 redis 中获取该用户的收藏攻略单
        String cacheKey = RedisKey.STRATEGY_STATS_FAVOR.getCacheKey(userId);
        String favorStrategiesStr = redisTemplate.opsForValue().get(cacheKey);
        List<Long> favorStrategies = JSON.parseArray(favorStrategiesStr, Long.class);
        //判断攻略收藏单里是否有该攻略
        return favorStrategies == null ? false : favorStrategies.contains(strategyId);
    }

    /**
     * 操作 用户点赞顶攻略
     */
    public AjaxResult thumbup(Long strategyId, Long userId) {
        AjaxResult result = new AjaxResult();
        String cacheKey = RedisKey.STRATEGY_STATS_THUMBUP.getCacheKey(strategyId + ":" + userId);

        //查询 redis 用户是否有点赞，有则不给点赞，没有就进行点赞
        if (redisTemplate.opsForValue().get(cacheKey) == null) {
            //用户没有点赞，设置 redis 缓存有效期为1天，存取用户点赞
            Date today = new Date();
            long oneDay = DateUtil.getDateBetween(today, DateUtil.getEndDate(today));
            redisTemplate.opsForValue().set(cacheKey, "", oneDay, TimeUnit.MILLISECONDS);
            //redis 统计数据缓存点赞数+1
            incrbyNum(strategyId, 1, IStrategyStatsCacheService.STRATEGY_STATS_THUMBUP);
            //点赞数回显
            result.setData(getStatsById(strategyId).getThumbsupnum());
        } else {
            result.mark("你今天已经给该攻略点过赞啦");
        }

        return result;
    }

    /**
     * 获取 所有攻略的统计数据缓存
     */
    public List<StrategyStats> listAllStrategyStats() {
        ArrayList<StrategyStats> vos = new ArrayList<>();

        //使用通配符获取所有的
        String cacheKey = RedisKey.STRATEGY_STATS.getCacheKey("*");
        Set<String> keys = redisTemplate.keys(cacheKey);
        for (String key : keys) {
            String json = redisTemplate.opsForValue().get(key);
            StrategyStats vo = JSON.parseObject(json, StrategyStats.class);
            vos.add(vo);
        }

        return vos;
    }

    /**
     * 判断 某攻略在某排行榜缓存里是否存在
     *
     * @param sortKey    排行榜key
     * @param strategyId 攻略id
     * @return true存在 false不存在
     */
    public boolean existInRank(RedisKey sortKey, Long strategyId) {
        String name = RedisKey.STRATEGY_STATS.getCacheKey(strategyId);
        //zset 取出某有序列表里某元素排名，没有排名会返回 null
        Long rank = redisTemplate.opsForZSet().rank(sortKey.getPrefix(), name);
        //通过判断排名来识别是否存在
        return rank != null;
    }

    /**
     * 增加 把 攻略排行数据 增加排行序数 并且存在缓存中
     *
     * @param sortKey    排行榜key
     * @param num        要增加排行序数(越大的越前)
     * @param strategyId 攻略id
     */
    public void addInRand(RedisKey sortKey, int num, Long strategyId) {
        //incrementScore(zset名, zset里的元素, 要增加的排序数值) ：增加zset里某元素的排序值
        redisTemplate.opsForZSet().incrementScore(sortKey.getPrefix(), RedisKey.STRATEGY_STATS.getCacheKey(strategyId), num);
    }

    /**
     * 获取 某攻略排行榜缓存前几个
     *
     * @param sortKey 攻略排行榜key
     * @param count   前几个
     */
    public List<StrategyStats> listRankTopCount(RedisKey sortKey, int count) {
        List<StrategyStats> list = new ArrayList<>();
        //zset 按降序选定范围返回元素
        Set<String> sets = redisTemplate.opsForZSet().reverseRange(sortKey.getPrefix(), 0, count-1);
        for (String set : sets) {
            String s = redisTemplate.opsForValue().get(set);
            StrategyStats strategyStats = JSON.parseObject(s, StrategyStats.class);
            list.add(strategyStats);
        }
        return list;
    }

    /**
     * 删除 某攻略排行
     */
    public void deleteStrategySort(String sortKey) {
        redisTemplate.delete(sortKey);
    }

    @Override
    public StrategyStats getStrategyById(Long strategyId) {
        String json = redisTemplate.opsForValue().get(getStrategyStatsCacheKey(strategyId));
        StrategyStats vo = JSON.parseObject(json, StrategyStats.class);
        return vo;
    }


    @Override
    public StrategyStats getStrategyState(Long detailId) {
        String cacheKey = getStrategyStatsCacheKey(detailId);
        String s = redisTemplate.opsForValue().get(cacheKey);
        return JSON.parseObject(s , StrategyStats.class);
    }

    @Override
    public List<Long> listStrategiesByUserId(Long userId) {
        List<Long> ids = new ArrayList<>();
        String cacheKey = RedisKey.STRATEGY_STATS_FAVOR.getCacheKey(userId);
        String s = redisTemplate.opsForValue().get(cacheKey);
        if(s != null){
            ids = JSON.parseArray(s , Long.class);
        }
        return ids;
    }

    public static String getStrategyStatsCacheKey(Long detailId) {
        return RedisKey.STRATEGY_STATS.getCacheKey(detailId);
    }


}
