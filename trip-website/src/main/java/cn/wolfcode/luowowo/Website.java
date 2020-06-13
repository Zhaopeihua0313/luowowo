package cn.wolfcode.luowowo;

import cn.wolfcode.luowowo.website.interceptor.CheckLoginInterceptor;
import cn.wolfcode.luowowo.website.resolver.UserInfoArgumentResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

@SpringBootApplication
public class Website implements WebMvcConfigurer{

    @Autowired
    private CheckLoginInterceptor checkLoginInterceptor;
    @Autowired
    private UserInfoArgumentResolver userInfoArgumentResolver;

    public static void main(String[] args) {
        SpringApplication.run(Website.class, args);
    }

    /**
     * 添加拦截器 登录验证拦截器
     */
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(checkLoginInterceptor)
                .excludePathPatterns("/login.html", "/regist.html", "/images/*", "/js/*", "/style/*")
                .addPathPatterns("/**");
    }

    /**
     * 添加参数解析器 参数的类型是 UserInfo 类型并且有贴自定义的 LoginUser 注解的 启用自定义的解析器去 redis 中获取用户信息
     */
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
        resolvers.add(userInfoArgumentResolver);
    }

}
