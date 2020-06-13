package cn.wolfcode.luowowo.website.interceptor;

import cn.wolfcode.luowowo.cache.service.IUserInfoCasheService;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.common.util.Consts;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import cn.wolfcode.luowowo.website.annotation.RequiredLogin;
import com.alibaba.fastjson.JSON;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * 登录验证拦截器
 * PS：System.out.println(); 等打印语句不要注释或者删掉，开发时有用
 */
@Component
public class CheckLoginInterceptor extends HandlerInterceptorAdapter{

    @Reference
    private IUserInfoCasheService userInfoCasheService;

    //是否开启登录拦截器操作信息控制台输出
    @Value("${projectSwitch.CheckLoginInterceptorConsolePrint}")
    private boolean openPrint;

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //判断动态资源
        if (handler instanceof HandlerMethod) {
            if (openPrint) System.out.println("");
            if (openPrint) System.out.println("  -↓");
            //判断本地 session 是否有登录对象
            HttpSession session = request.getSession();
            Object userInfo = session.getAttribute(Consts.USER_INFO);
            if (openPrint) System.out.println("  - 登录拦截开始 ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ 当前登陆者 session 的值：" + userInfo);
            if (openPrint) System.out.println("  - 当前拦截方法："
                    + ((HandlerMethod) handler).getShortLogMessage()
                    + "\033[34;4m " + ((HandlerMethod) handler).getMethod().getName() + "\033[0m"
                    + " 【 " + new Date()+ "】 " );
            if (userInfo != null) {
                if (openPrint) System.out.println("  -↑ 用户 session 存在，放行");
                return true;
            }

            //本地 sesison 没有，查远程 redis
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals(Consts.USER_INFO_TOKEN)) {
                        String token = cookie.getValue();
                        if (openPrint) System.out.println("  - 当前登陆者 本地 cookie（userInfoToken） 的值：" + token);
                        String json = userInfoCasheService.getUserInfo(token);
                        if (openPrint) System.out.println("  - 当前登陆者 redis 中的值：" + json);

                        //如果通过 cookie 能取到 redis，就给设置 session，并且放行
                        if (json != null) {
                            //转 json 格式
                            userInfo = JSON.parseObject(json, UserInfo.class);
                            //存入本地 session 做 session 的续命
                            session.setAttribute(Consts.USER_INFO, userInfo);
                            if (openPrint) System.out.println("  - 当前登陆者 存入本地的 session ==================== ：" + session.getAttribute(Consts.USER_INFO));
                            if (openPrint) System.out.println("  -↑ 用户信息已根据 cookie 找到 redis 信息并且生成 session，放行");
                            return true;
                        }
                    }
                }
            }

            //当前操作的动态方法
            HandlerMethod handlerMethod = (HandlerMethod) handler;

            //通过自定义的登录注解来判断该资源是否需要登录访问
            if ( !handlerMethod.hasMethodAnnotation(RequiredLogin.class) ) {
                if (openPrint) System.out.println("  -↑ 该方法不需要登录验证，放行");
                return true;
            }

            //判断是否异步请求
            if (handlerMethod.hasMethodAnnotation(ResponseBody.class)) {    //异步请求
                if (openPrint) System.out.println("  - 异步请求来啦");
                if (openPrint) System.out.println("  -|↑");
                AjaxResult result = new AjaxResult();
                result.mark("请先登录");
                result.setCode(AjaxResult.NO_LOGIN_CODE);
                //响应为 json
                response.setContentType("text/json;charset=UTF-8");
                response.getWriter().print(JSON.toJSONString(result));
            } else {        //同步请求
                //到这里表示访问的资源需要登录
                response.sendRedirect("/login.html");
            }

            return false;
        }

        //静态资源给放行
        return true;
    }



}































