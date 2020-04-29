package com.nongzi.component.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author saykuray
 * @date 2020/4/28 20:44
 */
public class LoginInterceptor implements HandlerInterceptor {

    /**
     * 对所有的后台管理系统访问进行拦截
     * @param request 用户请求
     * @param response 用户响应
     * @param handler
     * @return true:放行 false:拦截
     * @throws Exception 抛出可能产生的异常
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();
        System.out.println(url);
        System.out.println(request.getMethod());
        // 1.根据url进行拦截
        if (url.indexOf("/admin/login") != -1) {
            return true;
        }
        // 2.对拦截下的请求进行判断用户是否登录。登录放行，未登录重定向到登录页面
        Object adminName = request.getSession().getAttribute("adminName");
        if (adminName != null) {
            return true;
        } else {
            response.sendRedirect("/nongzi/admin/login");
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
