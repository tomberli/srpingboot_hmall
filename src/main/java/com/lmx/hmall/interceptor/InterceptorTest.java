package com.lmx.hmall.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 拦截器
 */
public class InterceptorTest implements HandlerInterceptor {
    private Logger logger = LoggerFactory.getLogger(InterceptorTest.class);
    /**
     * 要是返回false,那么就不会去执行controller里面的代码
     * controller执行前
     * 执行了该方法，后面的方法postHandle、afterCompletion才会执行
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        logger.info("preHandle:执行了该方法");
        String username = (String)request.getSession().getAttribute("username");
        if("".equals(username) || username == null){
            request.getRequestDispatcher("/tipInterceptorJsp").forward(request, response);
            return false;
        }else{
            return true;
        }
    }

    /**
     * controller执行后，才会被执行
     * @param request
     * @param response
     * @param handler
     * @param modelAndView
     * @throws Exception
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        logger.info("postHandle:执行了该方法");
    }

    /**
     * controller执行后才会被执行，在postHandle方法后面执行
     * @param request
     * @param response
     * @param handler
     * @param ex
     * @throws Exception
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        logger.info("afterCompletion:执行了该方法");
    }
}




























