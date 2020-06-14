package cn.wolfcode.luowowo.cache.service.impl;

import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.IVerifyCodeCacheService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import java.util.concurrent.TimeUnit;

@Service
public class VerifyCodeCacheImpl implements IVerifyCodeCacheService {

    @Autowired
    private StringRedisTemplate redisTemplate;

    /**
     * 设置 验证码缓存
     */
    @Override
    public void setVerifyCode(String phone, String verifyCode) {
        //格式：verify_code:18814187411（redis 的 key）
        String cacheKey = RedisKey.VERIFY_CODE.getCacheKey(phone);
        //保存到 redis 中，设置有效时间
        redisTemplate.opsForValue().set(cacheKey, verifyCode,
                RedisKey.VERIFY_CODE.getTimeout(), TimeUnit.MILLISECONDS);
    }

    /**
     * 获取 验证码缓存
     */
    @Override
    public String getVerifyCode(String phone) {
        String cacheKey = RedisKey.VERIFY_CODE.getCacheKey(phone);
        return redisTemplate.opsForValue().get(cacheKey);
    }

}
