package cn.wolfcode.luowowo.website.controller;

import cn.wolfcode.luowowo.cache.service.IUserInfoCasheService;
import cn.wolfcode.luowowo.cache.service.IVerifyCodeCacheService;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.common.util.Consts;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import cn.wolfcode.luowowo.member.service.IUserInfoService;
import cn.wolfcode.luowowo.website.annotation.LoginUser;
import cn.wolfcode.luowowo.website.util.HttpClientUtils;
import cn.wolfcode.luowowo.website.util.QQLoginUtil;
import cn.wolfcode.luowowo.website.util.WeChatLoginUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.UUID;

@Controller
public class LoginController {

    @Reference
    private IUserInfoService userInfoService;

    @Reference
    private IVerifyCodeCacheService verifyCodeCacheService;

    @Reference
    private IUserInfoCasheService userInfoCasheService;

    private String wechatLine = "";

    /**
     * 处理 验证手机是否可用未被注册
     */
    @RequestMapping("/checkPhone")
    @ResponseBody
    public Object checkPhone(String phone) {
        return userInfoService.checkPhone(phone);
    }

    /**
     * 处理 发送验证码
     */
    @RequestMapping("/sendVerifyCode")
    @ResponseBody
    public Object sendVerifyCode(String phone) {
        AjaxResult ajaxResult = new AjaxResult();
        //先检查验证码是否过期
        if (verifyCodeCacheService.getVerifyCode(phone) != null) {
            return ajaxResult.mark("验证已发送，请勿在有效期内重复点击");
        }
        //验证码
        String verifyCode = UUID.randomUUID().toString().substring(0, 4);
        //发送验证码（模拟）
        System.out.println(phone + " 的验证码是：" + verifyCode);
        //保存验证码到 redis 中
        verifyCodeCacheService.setVerifyCode(phone, verifyCode);
        return ajaxResult;
    }

    /**
     * 处理 用户注册
     */
    @RequestMapping("/userRegist")
    @ResponseBody
    public Object userRegist(String phone, String nickname, String password, String rpassword, String verifyCode) {
        return userInfoService.userRegist(nickname, phone, password, rpassword, verifyCode);
    }

    /**
     * 处理 用户注销
     */
    @RequestMapping("/userLogout")
    @ResponseBody
    public AjaxResult userLogout(HttpServletRequest request, HttpServletResponse response, HttpSession session, @LoginUser UserInfo userInfo) {
        AjaxResult result = new AjaxResult();
        try {
            //删除 cookie
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals(Consts.USER_INFO_TOKEN)) {
                        //删除 redis
                        userInfoCasheService.deleteUserInfo(cookie.getValue());
                        //删除 cookie
                        cookie.setMaxAge(0);
                    }
                }
            }
            //删除 session
            session.invalidate();
        } catch (Exception e) {
            result.mark("服务器提示：操作失败");
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    /**
     * 处理 普通用户登录
     */
    @RequestMapping("/userLogin")
    @ResponseBody
    public Object userLogin(String phone, String password, HttpSession session, HttpServletResponse response) {
        //通过手机号和密码查询是否有该用户
        AjaxResult result = userInfoService.userLogin(phone, password);
        //根据 result 来断登录操作是否成功，成功就把对象存入到 session 和 redis，并且把 redis 的 key 作为 cookie 返回给浏览器端
        result = doLogin(result, session, response);
        return result;
    }

    /**处理登录，用户信息的储存
     * 根据 result 来断登录操作是否成功，成功就把对象存入到 session 和 redis，并且把 redis 的 key 作为 cookie 返回给浏览器端
     */
    public AjaxResult doLogin(AjaxResult result, HttpSession session, HttpServletResponse response) {
        if (result.isSuccess()) {
            Object userInfo = result.getData();
            //把当前登录对象存入 session （userInfo：用户对象数据）默认有效时间30分钟？
            session.setAttribute(Consts.USER_INFO, result.getData());
            //把当前登录对象转成 JSON 存入 redis （userInfoToken:fb171670a0f948f2a81a9536f831be4b ：用户对象数据的json）默认有效时间20分钟
            String token = UUID.randomUUID().toString().replaceAll("-", "");
            System.out.println("===== doLogin ======登录的 token ：" + token);
            userInfoCasheService.setUserInfo(token, JSON.toJSONString(userInfo));
            //把当前登录对象在 redis 中的 key 以 cookie 方式返回给客户端 （userInfoToken ：fb171670a0f948f2a81a9536f831be4b）
            Cookie cookie = new Cookie(Consts.USER_INFO_TOKEN, token);
            cookie.setPath("/");
            response.addCookie(cookie);
        } else {
            if (!StringUtils.hasText(result.getMsg())) {
                result.mark("信息不匹配，登录失败！");
            }
        }
        return result;
    }

    /**
     * 查看 redis 中用户的信息
     */
    @RequestMapping("/ew")
    @ResponseBody
    public Object ew(@LoginUser UserInfo user) {
        System.out.println(user);
        return user;
    }

    /**
     * 微信登录的 回调地址（用户手机微信会访问该地址，当页面访问...该方法做的信息只对手机端有效）
     * 在该方法做全部的微信登录处理
     */
    @RequestMapping("/wxcallback")
    public String wxcallback(String code, String state, HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws Exception {
        System.out.println("wxcallback 微信回调 code ：" + code);
        System.out.println("wxcallback 微信回调 state ：" + state);
        //防攻击
        if (state != null && state.equals("ytrlww") && code != null) {
            //通过 code 去获取 access_token
            String accessTokenInfo = HttpClientUtils.get(WeChatLoginUtil.getUrlForAccessTokenAndOpenIdWeChat(code), "UTF-8");
            JSONObject accessTokenInfoJson = JSON.parseObject(accessTokenInfo);
            System.out.println("微信回调 accessTokenInfoJson：" + accessTokenInfoJson);
            //判断获取 access_token 请求的结果
            if (accessTokenInfoJson.get("access_token") != null) {
                String openid = accessTokenInfoJson.get("openid").toString();
                String accessToken = accessTokenInfoJson.get("access_token").toString();
                System.out.println("微信回调 openid：" + openid + "，accessToken：" + accessToken);
                //用 access_token 和 openid 去申请 用户信息
                String userInfo = HttpClientUtils.get(WeChatLoginUtil.getUrlForUserInfoWeChat(accessToken, openid), "UTF-8");
                JSONObject userInfoJson = JSON.parseObject(userInfo);
                System.out.println("微信回调 userInfo：" + userInfoJson);
                //判断有没有获取用户信息成功
                if(userInfoJson.get("nickname") != null) {
                    //执行 微信登录
                    AjaxResult result = userInfoService.userLoginByWechat(userInfoJson, openid);
                    //判断登录操作是否成功，成功就把对象存入到 session 和 redis（重复了先不管，因为需要定制）
                    if (result.isSuccess()) {
                        Object user = result.getData();
                        //当前登录对象存入 session（userInfo：用户对象数据）默认有效时间30分钟？
                        session.setAttribute(Consts.USER_INFO, result.getData());
                        //把登录成功的对象转成 JSON 存入 redis（userInfoToken:fb171670a0f948f2a81a9536f831be4b ：用户对象数据的json）默认有效时间20分钟
                        String token = UUID.randomUUID().toString().replaceAll("-", "");
                        System.out.println("微信回调 --------------------------------------------  redis 的 token：" + token);
                        userInfoCasheService.setUserInfo(token, JSON.toJSONString(user));
                        //连接令牌
                        wechatLine = token;
                    } else {
                        model.addAttribute("centerPic", "m_loginError.png");
                        System.out.println("微信登录验证失败");
                        System.out.println(result.getMsg());
                    }
                }
            }
        }
        model.addAttribute("centerPic", "m_loginOK.png");
        return "index/callback";
    }

    /**
     * 微信登录的 检测看微信登录是否成功
     */
    @RequestMapping("/checkWeChatLoginResult")
    @ResponseBody
    public AjaxResult checkWeChatLoginResult(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) {
        AjaxResult result = new AjaxResult();
        result.mark("尚未微信登录");
        try {
            //判断连接令牌
            System.out.println("微信检测 start 当前登陆者 wechatLine 的值：" + wechatLine);
            if (wechatLine != null && wechatLine != "") {
                Cookie cookie = new Cookie(Consts.USER_INFO_TOKEN, wechatLine);
                cookie.setPath("/");
                response.addCookie(cookie);
                wechatLine = "";
                result.setSuccess(true);
                result.setMsg("已微信登录");
                return result;
            }
            //判断本地 session 是否有登录对象
            Object userInfo = session.getAttribute(Consts.USER_INFO);
            System.out.println("微信检测 start 当前登陆者 session 的值：" + userInfo);
            if (userInfo != null) {
                result.setSuccess(true);
                result.setMsg("已微信登录");
                return result;
            }
            //本地 sesison 没有，查远程 redis
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals(Consts.USER_INFO_TOKEN)) {
                        System.out.println("微信检测 NAME：" + cookie.getName() + "，VALUE：" + cookie.getValue());
                        String token = cookie.getValue();
                        System.out.println("微信检测 当前登陆者 本地 cookie（userInfoToken） 的值：" + token);
                        String json = userInfoCasheService.getUserInfo(token);
                        System.out.println("微信检测 当前登陆者 redis 中的值：" + json);
                        //如果通过 cookie 能取到 redis，就给设置 session，并且放行
                        if (json != null) {
                            //转 json 格式
                            userInfo = JSON.parseObject(json, UserInfo.class);
                            //存入本地 session 做 session 的续命
                            session.setAttribute(Consts.USER_INFO, userInfo);
                            System.out.println("微信检测 当前登陆者 存入本地的 session ==================== ：" + session.getAttribute(Consts.USER_INFO));
                            result.setSuccess(true);
                            result.setMsg("已微信登录");
                            return result;
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    /**
     * 微信登录的 扫码页面
     */
    @RequestMapping("/wxLoginGetCode")
    public String wxLoginGetCode(String code, String state, HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws Exception {
        System.out.println("wxLoginGetCode 微信 扫二维码啦");
        return "index/wxLoginGetCode";
    }

    /**
     * QQ登录的 回调地址
     */
    @RequestMapping("/qqcallback")
    public String qqcallback(String code, String state, HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws Exception {
        System.out.println("code：" + code);
        System.out.println("state：" + state);
        System.out.println("QQ用户开始登录=====");
        AjaxResult ajaxResult = new AjaxResult();
        if (code != null) {
            //用户QQ确认登录后，通过回调返回的code去获取用户的token
            String urlForAccessToken = QQLoginUtil.getUrlForAccessTokenQQ(code);
            System.out.println("urlForAccessToken：" + urlForAccessToken);
            String tokenInfo = HttpClientUtils.get(urlForAccessToken, "UTF-8");
            System.out.println("tokenInfo：" + tokenInfo);
            //获取到用的 token 后
            if (tokenInfo != null && tokenInfo.trim().length() > 0) {
                String[] strings = tokenInfo.split("&");
                //用户的 token
                String accessToken = strings[0].split("=")[1];
                //通过用户的 token 去获取用户的 oppenID
                String urlForOppenIDQQ = QQLoginUtil.getUrlForOppenIDQQ(accessToken);
                System.out.println("urlForOppenIDQQ：" + urlForOppenIDQQ);
                String oppenIDInfo = HttpClientUtils.get(urlForOppenIDQQ, "UTF-8");
                System.out.println("oppenIDInfo：" + oppenIDInfo);
                //通过用户的 oppendID 和 access_token 获取用户信息
                if (StringUtils.hasText(oppenIDInfo) ) {
                    String oppenIDInfoStr = oppenIDInfo.replace("callback(", "").replace(");", "");
                    if (StringUtils.hasText(oppenIDInfoStr)) {
                        JSONObject oppenIDInfoJson = JSON.parseObject(oppenIDInfoStr);
                        System.out.println("oppenIDInfoJson：" + oppenIDInfoJson);
                        System.out.println("openid：" + oppenIDInfoJson.get("openid"));
                        Object openId = oppenIDInfoJson.get("openid");
                        if (openId != null && StringUtils.hasText(openId.toString())) {
                            //获取用户信息
                            String urlForUserInfoQQ = QQLoginUtil.getUrlForUserInfoQQ(openId.toString(), accessToken);
                            System.out.println("urlForUserInfoQQ：" + urlForUserInfoQQ);
                            String userInfo = HttpClientUtils.get(urlForUserInfoQQ, "UTF-8");
                            System.out.println("userInfo：" + userInfo);
                            JSONObject userInfoJson = JSON.parseObject(userInfo);
                            if (userInfoJson.get("ret") != null && userInfoJson.get("ret").toString().equals("0")) {
                                //执行QQ登录
                                AjaxResult result = userInfoService.userLoginByQQ(userInfoJson, openId.toString());
                                //判断登录操作是否成功，成功就把对象存入到 session 和 redis
                                if (result.isSuccess()) {
                                    Object user = result.getData();
                                    //当前登录对象存入 session
                                    session.setAttribute(Consts.USER_INFO, result.getData());
                                    //把登录成功的对象转成 JSON 存入 redis
                                    String token = UUID.randomUUID().toString().replaceAll("-", "");
                                    System.out.println("redis 的 token：" + token);
                                    userInfoCasheService.setUserInfo(token, JSON.toJSONString(user));
                                    //把 token 以 cookie 方式返回给客户端
                                    Cookie cookie = new Cookie(Consts.USER_INFO_TOKEN, token);
                                    cookie.setPath("/");
                                    response.addCookie(cookie);
                                    model.addAttribute("qqResult", result);
                                } else {
                                    System.out.println("QQ登录验证失败");
                                    System.out.println(result.getMsg());
                                }
                            }
                        }
                    }
                }
            }
        }
        System.out.println("QQ登录结束");
        return "index/callback";
    }

}
