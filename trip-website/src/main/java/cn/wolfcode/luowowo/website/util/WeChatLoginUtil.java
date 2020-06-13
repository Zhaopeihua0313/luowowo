package cn.wolfcode.luowowo.website.util;

/**
 * WeChat 登录工具类 by YangYR
 */
public class WeChatLoginUtil {

    static String appID = "wxdc8e5b99573f5566";
    static String appsecret = "72a3d698df6265bac9853dc54a8339bf";
    static String state = "ytrlww";
    static String callbackUrl = "http://unic.nat300.top/wxcallback";

    /**
     * 获取 WeChat登录的 url（二维码，测试号自动生成二维码没用）
     */
    static public String getUrlForCodeWeChat() {
        String url = "https://open.weixin.qq.com/connect/oauth2/authorize?" +
                "appid=" + appID +
                "&redirect_uri=" + callbackUrl +
                "&response_type=code" +
                "&scope=snsapi_userinfo" +
                "&state=" + state +
                "#wechat_redirect";
        return url;
    }

    /**
     * 获取 用 code 去申请 access_token 和 openid 的 url（step1）
     */
    static public String getUrlForAccessTokenAndOpenIdWeChat(String code) {
        String url = "https://api.weixin.qq.com/sns/oauth2/access_token?" +
                "appid=" + appID +
                "&secret=" + appsecret +
                "&code=" + code +
                "&grant_type=authorization_code";
        return url;
    }

    /**
     * 获取 用 access_token 和 openid 去申请 用户信息 的 url（step2）
     */
    static public String getUrlForUserInfoWeChat(String accessToken, String openId) {
        String url = "https://api.weixin.qq.com/sns/userinfo?" +
                "access_token=" + accessToken +
                "&openid=" + openId +
                "&lang=zh_CN";
        return url;
    }



}
