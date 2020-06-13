package cn.wolfcode.luowowo.cache.service;

/**
 * 验证码缓存
 */
public interface IVerifyCodeCacheService {

    /**
     * 设置 验证码缓存
     */
    void setVerifyCode(String phone, String verifyCode);

    /**
     * 获取 验证码缓存
     */
    String getVerifyCode(String phone);

}
