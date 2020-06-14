package cn.wolfcode.luowowo.cache.service.impl;

import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.IScenicStatsCacheService;
import cn.wolfcode.luowowo.cache.vo.ScenicStats;
import com.alibaba.fastjson.JSON;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service
public class ScenicStatsCacheServiceImpl implements IScenicStatsCacheService {

    @Autowired
    private StringRedisTemplate redisTemplate;

    /**
     * 判断：判断 redies 缓存中有没有对应的 key
     */
    public boolean hasStatsKey(Long scenicId) {
        return redisTemplate.hasKey(RedisKey.SCENIC_STATS.getCacheKey(scenicId));
    }

    /**
     * 获取：根据景点 id 获取缓存中的某景点所有统计数据
     */
    public ScenicStats getStatsById(Long scenicId) {
        String key = RedisKey.SCENIC_STATS.getCacheKey(scenicId);
        String voStr = redisTemplate.opsForValue().get(key);
        return JSON.parseObject(voStr, ScenicStats.class);
    }

    /**
     * 更改：给某个统计字段增加一定数值
     */
    public void incrbyNum(Long scenicId, int num, int scenicType) {
        ValueOperations<String, String> ops = redisTemplate.opsForValue();
        //根据景点 id 从缓存中获取vo对象，并且转换成景点统计数据对象
        String cacheKey = RedisKey.SCENIC_STATS.getCacheKey(scenicId);
        ScenicStats vo = JSON.parseObject(ops.get(cacheKey), ScenicStats.class);
        //根据类型, 对统计值进行添加
        switch (scenicType) {
            case SCENIC_STATS_VISIT: //去过数
                vo.setVisitnum(vo.getVisitnum() + num);
                break;
            case SCENIC_STATS_REPLYNUM://点评数
                vo.setReplynum(vo.getReplynum() + num);
                break;
            case SCENIC_STATS_FAVORNUM://收藏数
                vo.setFavornum(vo.getFavornum() + num);
                break;
        }
        //在redies缓存中跟新vo对象
        setScenicStats(vo);
    }

    /**
     * 存：往缓存中存入景点缓存
     */
    public void setScenicStats(ScenicStats vo) {
        Long scenicId = vo.getScenicId();
        String key = RedisKey.SCENIC_STATS.getCacheKey(scenicId);
        //把景点统计对象转换成 json 字符串，然后 ops 直接 set 就替换原数据
        redisTemplate.opsForValue().set(key, JSON.toJSONString(vo));
    }

    /**
     * 操作：用户收藏景点或取消收藏
     */
    public boolean favor(Long scenicId, Long userId) {
        boolean flag = false;
        int num = -1;           //用作数据统计的增量，默认为景点收藏数 -1
        //把用户做主体，key 为用户 id，redis 存的是每个用户的收藏，每个用户下又有多个收藏的景点 id
        String cacheKey = RedisKey.SCENIC_STATS_FAVOR.getCacheKey(userId);
        ValueOperations<String, String> ops = redisTemplate.opsForValue();
        List<Long> scenicIds = new ArrayList<>();
        //判断用户收藏里有没有该景点
        if (redisTemplate.hasKey(cacheKey)) {   //用户有收藏，获取收藏里有没有该景点
            scenicIds = JSON.parseArray(ops.get(cacheKey), Long.class);
            //判断该用户是否有收藏该景点，如果没有，那收藏操作成立，景点收藏里添加该景点并且景点收藏数加一
            if (!scenicIds.contains(scenicId)) {
                num = 1;
                flag = true;
                scenicIds.add(scenicId);
            } else {    //如果用户已经有收藏了，还进行收藏操作，那就是取消收藏，景点收藏里把该景点剔除
                scenicIds.remove(scenicId);
            }
        } else {    //该用户没有收藏，给收藏里添加该景点，另外设置收藏数为 1，用作数据统计
            scenicIds.add(scenicId);
            num = 1;
            flag = true;
        }
        //更新 redis 中该景点的收藏者
        ops.set(cacheKey, JSON.toJSONString(scenicIds));
        //收藏数添加
        incrbyNum(scenicId, num, IScenicStatsCacheService.SCENIC_STATS_FAVORNUM);
        return flag;
    }

    public boolean visit(Long scenicId, Long userId) {
        boolean flag = false;
        int num = -1;           //用作数据统计的增量，默认为景点收藏数 -1
        //把用户做主体，key 为用户 id，redis 存的是每个用户的收藏，每个用户下又有多个收藏的景点 id
        String cacheKey = RedisKey.SCENIC_STATS_VISIT.getCacheKey(userId);
        ValueOperations<String, String> ops = redisTemplate.opsForValue();
        List<Long> scenicIds = new ArrayList<>();
        //判断用户收藏里有没有该文章
        if (redisTemplate.hasKey(cacheKey)) {   //用户有收藏，获取收藏里有没有该景点
            scenicIds = JSON.parseArray(ops.get(cacheKey), Long.class);
            //判断该用户是否有收藏该景点，如果没有，那收藏操作成立，景点收藏里添加该景点并且景点收藏数加一
            if (!scenicIds.contains(scenicId)) {
                num = 1;
                flag = true;
                scenicIds.add(scenicId);
            } else {    //如果用户已经有收藏了，还进行收藏操作，那就是取消收藏，景点收藏里把该景点剔除
                scenicIds.remove(scenicId);
            }
        } else {    //该用户没有收藏，给收藏里添加该景点，另外设置收藏数为 1，用作数据统计
            scenicIds.add(scenicId);
            num = 1;
            flag = true;
        }
        //更新 redis 中该景点的收藏者
        ops.set(cacheKey, JSON.toJSONString(scenicIds));
        //收藏数添加
        incrbyNum(scenicId, num, IScenicStatsCacheService.SCENIC_STATS_VISIT);
        return flag;
    }

    /**
     * 判断：判断用户是否已收藏该某景点
     */
    public boolean isFavor(Long scenicId, Long userId) {
        //从 redis 中获取该用户的收藏景点单
        String cacheKey = RedisKey.SCENIC_STATS_FAVOR.getCacheKey(userId);
        String favorStrategiesStr = redisTemplate.opsForValue().get(cacheKey);
        List<Long> favorStrategies = JSON.parseArray(favorStrategiesStr, Long.class);
        //判断景点收藏单里是否有该景点
        return favorStrategies == null ? false : favorStrategies.contains(scenicId);
    }

    public boolean isVisit(Long scenicId, Long userId) {
        //从 redis 中获取该用户的收藏景点单
        String cacheKey = RedisKey.SCENIC_STATS_VISIT.getCacheKey(userId);
        String visitStrategiesStr = redisTemplate.opsForValue().get(cacheKey);
        List<Long> visitStrategies = JSON.parseArray(visitStrategiesStr, Long.class);
        //判断景点收藏单里是否有该景点
        return visitStrategies == null ? false : visitStrategies.contains(scenicId);
    }

    /**
     * 获取 所有景点的统计数据缓存
     */
    public List<ScenicStats> listAll() {
        ArrayList<ScenicStats> vos = new ArrayList<>();
        //使用通配符获取所有的
        String cacheKey = RedisKey.SCENIC_STATS.getCacheKey("*");
        Set<String> keys = redisTemplate.keys(cacheKey);
        for (String key : keys) {
            String json = redisTemplate.opsForValue().get(key);
            ScenicStats vo = JSON.parseObject(json, ScenicStats.class);
            vos.add(vo);
        }
        return vos;
    }

    @Override
    public List<Long> listScenicsByUserId(Long userId) {
        List<Long> ids = new ArrayList<>();

        String cacheKey = RedisKey.SCENIC_STATS_FAVOR.getCacheKey(userId);
        String s = redisTemplate.opsForValue().get(cacheKey);
        if(s != null){
            ids =  JSON.parseArray(s , Long.class);
        }
        return ids;
    }

}
