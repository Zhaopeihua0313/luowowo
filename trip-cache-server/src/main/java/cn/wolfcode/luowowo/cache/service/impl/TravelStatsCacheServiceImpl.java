package cn.wolfcode.luowowo.cache.service.impl;

import cn.wolfcode.luowowo.article.domain.Travel;
import cn.wolfcode.luowowo.article.service.ITravelService;
import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.ITravelStatsCacheService;
import cn.wolfcode.luowowo.cache.vo.TravelStats;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.common.util.DateUtil;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import com.alibaba.fastjson.JSON;
import org.apache.dubbo.config.annotation.Reference;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

import java.util.*;
import java.util.concurrent.TimeUnit;

@Service
public class TravelStatsCacheServiceImpl implements ITravelStatsCacheService {

    @Autowired
    private StringRedisTemplate redisTemplate;

    @Reference
    private ITravelService travelService;


    /**
     * 判断：判断 redies 缓存中有没有对应的 key
     */
    public boolean hasStatsKey(Long destilId) {
        return redisTemplate.hasKey(RedisKey.TRAVEL_STATS.getCacheKey(destilId));
    }

    /**
     * 获取：根据游记 id 获取缓存中的某游记所有统计数据
     */
    public TravelStats getStatsById(Long travelId) {
        String key = RedisKey.TRAVEL_STATS.getCacheKey(travelId);
        String voStr = redisTemplate.opsForValue().get(key);
        return JSON.parseObject(voStr, TravelStats.class);
    }

    /**
     * 更改：给某个统计字段增加一定数值
     */
    public void incrbyNum(Long travelId, int num, int travelType) {
        ValueOperations<String, String> ops = redisTemplate.opsForValue();

        //根据游记 id 从缓存中获取vo对象，并且转换成游记统计数据对象
        String cacheKey = RedisKey.TRAVEL_STATS.getCacheKey(travelId);
        TravelStats vo = JSON.parseObject(ops.get(cacheKey), TravelStats.class);

        //根据类型, 对统计值进行添加
        switch (travelType) {
            case TRAVEL_STATS_VIEWNUM: //阅读数
                vo.setViewnum(vo.getViewnum() + num);
                break;
            case TRAVEL_STATS_REPLYNUM://评论数
                vo.setReplynum(vo.getReplynum() + num);
                break;
            case TRAVEL_STATS_FAVORNUM://收藏数
                vo.setFavornum(vo.getFavornum() + num);
                break;
            case TRAVEL_STATS_THUMBUP: //点赞数
                vo.setThumbsupnum(vo.getThumbsupnum() + num);
                break;
            case TRAVEL_STATS_SHARENUM: //分享数
                vo.setSharenum(vo.getSharenum() + num);

        }

        //在redies缓存中跟新vo对象
        setTravelStats(vo);
    }

    /**
     * 存：往缓存中存入游记缓存
     */
    public void setTravelStats(TravelStats vo) {
        Long travelId = vo.getTravelId();
        String key = RedisKey.TRAVEL_STATS.getCacheKey(travelId);

        //把游记统计对象转换成 json 字符串，然后 ops 直接 set 就替换原数据
        redisTemplate.opsForValue().set(key, JSON.toJSONString(vo));
    }

    /**
     * 操作：用户收藏游记或取消收藏
     */
    public boolean favor(Long travelId, Long userId) {
        boolean flag = false;
        int num = -1;           //用作数据统计的增量，默认为游记收藏数 -1

        //把用户做主题，key 为用户 id，redis 存的是每个用户的收藏，每个用户下又有多个收藏的游记 id
        String cacheKey = RedisKey.TRAVEL_STATS_FAVOR.getCacheKey(userId);
        ValueOperations<String, String> ops = redisTemplate.opsForValue();
        List<Long> travelIds = new ArrayList<>();
        //判断用户收藏里有没有该文章
        if (redisTemplate.hasKey(cacheKey)) {   //用户有收藏，获取收藏里有没有该游记
            travelIds = JSON.parseArray(ops.get(cacheKey), Long.class);
            //判断该用户是否有收藏该游记，如果没有，那收藏操作成立，游记收藏里添加该游记并且游记收藏数加一
            if (!travelIds.contains(travelId)) {
                num = 1;
                flag = true;
                travelIds.add(travelId);
            } else {    //如果用户已经有收藏了，还进行收藏操作，那就是取消收藏，游记收藏里把该游记剔除
                travelIds.remove(travelId);
            }
        } else {    //该用户没有收藏，给收藏里添加该游记，另外设置收藏数为 1，用作数据统计
            travelIds.add(travelId);
            num = 1;
            flag = true;
        }

        //更新 redis 中该功率的收藏者
        ops.set(cacheKey, JSON.toJSONString(travelIds));
        //收藏数添加
        incrbyNum(travelId, num, ITravelStatsCacheService.TRAVEL_STATS_FAVORNUM);

        return flag;
    }

    /**
     * 判断：判断用户是否已收藏该某游记
     */
    public boolean isFavor(Long travelId, Long userId) {
        //从 redis 中获取该用户的收藏游记单
        String cacheKey = RedisKey.STRATEGY_STATS_FAVOR.getCacheKey(userId);
        String favorTravelsStr = redisTemplate.opsForValue().get(cacheKey);
        List<Long> favorTravels = JSON.parseArray(favorTravelsStr, Long.class);
        //判断游记收藏单里是否有该攻略
        return favorTravels == null ? false : favorTravels.contains(travelId);
    }

    /**
     * 操作 用户点赞顶游记
     */
    public AjaxResult thumbup(Long travelId, Long userId) {
        AjaxResult result = new AjaxResult();
        String cacheKey = RedisKey.TRAVEL_STATS_THUMBUP.getCacheKey(travelId + ":" + userId);

        //查询 redis 用户是否有点赞，有则不给点赞，没有就进行点赞
        if (redisTemplate.opsForValue().get(cacheKey) == null) {
            //用户没有点赞，设置 redis 缓存有效期为1天，存取用户点赞
            Date today = new Date();
            long oneDay = DateUtil.getDateBetween(today, DateUtil.getEndDate(today));
            redisTemplate.opsForValue().set(cacheKey, "", oneDay, TimeUnit.MILLISECONDS);
            //redis 统计数据缓存点赞数+1
            incrbyNum(travelId, 1, ITravelStatsCacheService.TRAVEL_STATS_THUMBUP);
            //点赞数回显
            result.setData(getStatsById(travelId).getThumbsupnum());
        } else {
            result.mark("你今天已经给该游记点过赞啦");
        }

        return result;
    }

    /**
     * 获取 所有游记的统计数据缓存
     */
    public List<TravelStats> listAllTravelStats() {
        ArrayList<TravelStats> vos = new ArrayList<>();

        //使用通配符获取所有的
        String cacheKey = RedisKey.TRAVEL_STATS.getCacheKey("*");
        Set<String> keys = redisTemplate.keys(cacheKey);
        for (String key : keys) {
            String json = redisTemplate.opsForValue().get(key);
            TravelStats vo = JSON.parseObject(json, TravelStats.class);
            vos.add(vo);
        }

        return vos;
    }

    /**
     * 判断 某游记在某排行榜缓存里是否存在
     *
     * @param sortKey  排行榜key
     * @param travelId 游记id
     * @return true存在 false不存在
     */
    public boolean existInRank(RedisKey sortKey, Long travelId) {
        String name = RedisKey.TRAVEL_STATS.getCacheKey(travelId);
        //zset 取出某有序列表里某元素排名，没有排名会返回 null
        Long rank = redisTemplate.opsForZSet().rank(sortKey.getPrefix(), name);
        //通过判断排名来识别是否存在
        return rank != null;
    }

    /**
     * 增加 把 游记排行数据 增加排行序数 并且存在缓存中
     *
     * @param sortKey  排行榜key
     * @param num      要增加排行序数(越大的越前)
     * @param travelId 游记id
     */
    public void addInRand(RedisKey sortKey, int num, Long travelId) {
        //incrementScore(zset名, zset里的元素, 要增加的排序数值) ：增加zset里某元素的排序值
        redisTemplate.opsForZSet().incrementScore(sortKey.getPrefix(), RedisKey.TRAVEL_STATS.getCacheKey(travelId), num);
    }

    /**
     * 获取 某游记排行榜缓存前几个
     *
     * @param sortKey 游记排行榜key
     * @param count   前几个
     */
    public List<TravelStats> listRankTopCount(RedisKey sortKey, int count) {
        List<TravelStats> list = new ArrayList<>();
        //zset 按降序选定范围返回元素
        Set<String> sets = redisTemplate.opsForZSet().reverseRange(sortKey.getPrefix(), 0, count - 1);
        for (String set : sets) {
            String s = redisTemplate.opsForValue().get(set);
            TravelStats travelStats = JSON.parseObject(s, TravelStats.class);
            list.add(travelStats);
        }
        return list;
    }

    /**
     * 删除 某游记排行
     */
    public void deleteTravelSort(String sortKey) {
        redisTemplate.delete(sortKey);
    }

    /**
     * 获取总阅读数
     *
     * @param userId
     * @return
     */
    @Override
    public int getReadNumById(Long userId) {
        int num = 0;
        List<Travel> travels = travelService.listTravelByUserId(userId);
        for (Travel travel : travels) {
            String stateCheKey = getTravelStateCheKey(travel.getId());
            String s = redisTemplate.opsForValue().get(stateCheKey);
            TravelStats travelStats = JSON.parseObject(s, TravelStats.class);
            if (travelStats != null) {
                num += travelStats.getViewnum();
            }
        }
        return num;
    }

    public static String getTravelStateCheKey(Long detailId) {
        return RedisKey.STRATEGY_STATS.getCacheKey(detailId);
    }


    //今日访问量
    @Override
    public int getTodayNum() {
        String key = ":access";
        List<String> ranges = redisTemplate.opsForList().range(key, 0, -1);
        //今天开始时间
        Date date = new Date();
        Calendar now = Calendar.getInstance();
        now.setTime(date);
        now.set(Calendar.HOUR_OF_DAY, 00);
        now.set(Calendar.MINUTE, 00);
        now.set(Calendar.SECOND, 00);
        now.set(Calendar.MILLISECOND, 000);
        Date starTime = now.getTime();

        //结束
        Calendar end = Calendar.getInstance();
        end.setTime(date);
        end.set(Calendar.HOUR_OF_DAY, 23);
        end.set(Calendar.MINUTE, 59);
        end.set(Calendar.SECOND, 59);
        end.set(Calendar.MILLISECOND, 999);
        Date endDate = end.getTime();

        //访问量
        int todayNum = 0;
        for (String range : ranges) {
            Date d = JSON.parseObject(range, Date.class);
            if (d.getTime() > starTime.getTime() && d.getTime() < endDate.getTime()) {
                todayNum++;
            }
        }
        return todayNum;

    }

    @Override
    public int addAccess() {
        String key = ":access";
        Date date = new Date();
        redisTemplate.opsForList().rightPush(key, JSON.toJSONString(date));
        List<String> ranges = redisTemplate.opsForList().range(key, 0, -1);
        //总访问量
        int sum = ranges.size();
        return sum;
    }

    @Override
    public List<Long> listTravelsByUserId(Long userId) {
        List<Long> ids = new ArrayList<>();
        String cacheKey = RedisKey.TRAVEL_STATS_FAVOR.getCacheKey(userId);
        String s = redisTemplate.opsForValue().get(cacheKey);
        if(s != null){
            ids = JSON.parseArray(s, Long.class);
        }
        return ids;
    }


}
