package com.student.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

public class interceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, Object handler) throws Exception {
        //首先进入的方法
        System.out.println("preHandle");

        String url = request.getRequestURI();
        if (url.indexOf("Add") >= 0) {
            if (request.getSession().getAttribute("login") != null) {
                // 判断用户名在session中是否存在，存在则放行
                System.out.println("login不为空，可以添加");
                return true;
            }else{
                System.out.println("login为空，不让添加");
                request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
                return false;
            }
        }
        System.out.println("URL不含Add");
        return true;
    }
    //返回modelAndView之前执行
    @Override
    public void postHandle(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

        System.out.println("postHandle");
    }
    //执行Handler完成执行此方法
    @Override
    public void afterCompletion(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, Object handler, Exception ex) throws Exception {

        System.out.println("afterCompletion");
    }
}