package cn.wolfcode.luowowo.website.util;

/**
 * QQ 登录工具类 by YangYR
 */
public class QQLoginUtil {

    static String grant_type = "authorization_code";
    static String client_id = "101397212";
    static String client_secret = "0e651fac3d100db3606fbfa24a2da989";
    static String redirect_uri = "http://unic.nat300.top/qqcallback";

    /**
     * 获取 QQ登录的 url（二维码）
     */
    static public String getUrlLoginQQ() {
        String urlLogin = "https://graph.qq.com/oauth2.0/authorize?" +
                "response_type=code&client_id=" + client_id +
                "&redirect_uri=" + redirect_uri +
                "&state=state";
        return urlLogin;
    }

    /**
     * 获取 去申请 access_token 的 url（step1）
     */
    static public String getUrlForAccessTokenQQ(String authorization_code) {
        String url = "https://graph.qq.com/oauth2.0/token?" +
                "grant_type=authorization_code" +
                "&client_id=" + client_id +
                "&client_secret=" + client_secret +
                "&code=" + authorization_code +
                "&redirect_uri=" + redirect_uri;
        return url;
    }

    /**
     * 获取 用 access_token 去申请用户 oppendID 的 url（step2）
     */
    static public String getUrlForOppenIDQQ(String accessToken) {
        String url = "https://graph.qq.com/oauth2.0/me?" +
                "access_token=" + accessToken;
        return url;
    }

    /**
     * 获取 用 oppendID 和 access_token 去申请用户信息的 url（step3）
     */
    static public String getUrlForUserInfoQQ(String oppendID, String accessToken) {
        String url = "https://graph.qq.com/user/get_user_info?" +
                "access_token=" + accessToken +
                "&oauth_consumer_key=" + client_id +
                "&openid=" + oppendID;
        return url;
    }

}
