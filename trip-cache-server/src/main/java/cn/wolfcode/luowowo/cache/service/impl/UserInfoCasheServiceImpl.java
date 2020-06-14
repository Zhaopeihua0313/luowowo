package cn.wolfcode.luowowo.cache.service.impl;

import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.IUserInfoCasheService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import java.util.concurrent.TimeUnit;

@Service
public class UserInfoCasheServiceImpl implements IUserInfoCasheService {

    @Autowired
    private StringRedisTemplate redisTemplate;

    /**
     * 设置 缓存用户对象
     */
    @Override
    public void setUserInfo(String token, String json) {

        String cacheKey = RedisKey.USER_INFO.getCacheKey(token);
        redisTemplate.opsForValue().set(cacheKey ,json,
                RedisKey.USER_INFO.getTimeout(), TimeUnit.MILLISECONDS);
    }

    /**
     * 获取 缓存用户数据
     */
    @Override
    public String getUserInfo(String token)
    {
        String cacheKey = RedisKey.USER_INFO.getCacheKey(token);
        String json = redisTemplate.opsForValue().get(cacheKey);
        if (json != null) {
            //自动续有效时间
            redisTemplate.expire(cacheKey, RedisKey.USER_INFO.getTimeout(), TimeUnit.MILLISECONDS);
        }
        return json;
    }

    /**
     * 删除 用户对象缓存
     */
    @Override
    public void deleteUserInfo(String token) {
        redisTemplate.delete(RedisKey.USER_INFO.getCacheKey(token));
    }

}
