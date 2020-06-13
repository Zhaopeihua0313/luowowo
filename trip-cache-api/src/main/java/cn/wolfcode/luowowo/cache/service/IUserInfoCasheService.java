package cn.wolfcode.luowowo.cache.service;

/**
 * 用户对象缓存
 */
public interface IUserInfoCasheService {

    /**
     * 设置 用户对象缓存
     */
    void setUserInfo(String token, String json);

    /**
     * 获取 用户数据缓存
     */
    String getUserInfo(String token);

    /**
     * 删除 用户对象缓存
     */
    void deleteUserInfo(String token);

}
