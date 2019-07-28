package com.lmx.hmall.config;

import com.lmx.hmall.interceptor.InterceptorTest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * 拦截器配置
 */
@Configuration
public class InterceptorConfig extends WebMvcConfigurerAdapter {
    private Logger logger = LoggerFactory.getLogger(InterceptorConfig.class);
    public InterceptorConfig(){
        logger.info("注册拦截器:InterceptorConfig");
    }
    /**
     * 添加拦截规则
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //拦截所有用户显示，要是用户没有登陆，就不能显示
        //要是该路径，那么就会去执行Interceptor拦截器
        logger.info("addInterceptors:添加拦截器");
        registry.addInterceptor(new InterceptorTest()).addPathPatterns("/showAllUsers");
        super.addInterceptors(registry);
    }
}















