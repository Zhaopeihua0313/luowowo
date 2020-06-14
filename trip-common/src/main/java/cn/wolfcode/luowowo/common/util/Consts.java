package cn.wolfcode.luowowo.common.util;

/**
 * 常量工具类
 */
public abstract class Consts {

    public static final long VERIFY_CODE_TIMEOUT = 60L * 1000; //60s 验证码超时时间
    public static final long USER_INFO_TIMEOUT = 60L * 1000 * 20; //20m 用户信息超时时间
    public static final String USER_INFO_TOKEN = "userInfoToken";
    public static final String USER_INFO = "userInfo";

}
