package cn.wolfcode.luowowo.website.resolver;

import cn.wolfcode.luowowo.cache.service.IUserInfoCasheService;
import cn.wolfcode.luowowo.common.util.Consts;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import cn.wolfcode.luowowo.website.annotation.LoginUser;
import com.alibaba.fastjson.JSON;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 自定义参数解析器
 */
@Component
public class UserInfoArgumentResolver implements HandlerMethodArgumentResolver {

    @Reference
    private IUserInfoCasheService userInfoCacheService;

    /**
     * 表示该参数是否支持使用该解析器
     * @return true:支持 false:不支持
     */
    public boolean supportsParameter(MethodParameter parameter) {
        //参数的类型是 UserInfo 类型并且有贴自定义的 LoginUser 注解的
        return UserInfo.class.equals(parameter.getParameterType()) &&
                parameter.hasParameterAnnotation(LoginUser.class);
    }

    /**
     * 方法形参解析的过程
     * @return 最终解析的结果
     */
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
        //从本地 session 中获取登录对象
        HttpServletRequest req = webRequest.getNativeRequest(HttpServletRequest.class);
        HttpSession session = req.getSession();
        Object userInfo = session.getAttribute(Consts.USER_INFO);
        if (userInfo != null) {
            return userInfo;
        }
        //如果本地 session 没有，就去查询 redis
        Cookie[] cs = req.getCookies();
        if (cs != null) {
            for (Cookie cookie : cs) {
                if (cookie.getName().equals(Consts.USER_INFO_TOKEN)) {
                    String token = cookie.getValue();
                    String cacheVale = userInfoCacheService.getUserInfo(token);
                    if (cacheVale != null) {
                        userInfo = JSON.parseObject(cacheVale, UserInfo.class);
                        session.setAttribute(Consts.USER_INFO, userInfo);
                        return userInfo;
                    }
                    break;
                }
            }
        }
        //没有登录对象，返回null
        return null;
    }

}