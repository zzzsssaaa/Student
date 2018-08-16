package com.student.filter;

import java.io.IOException;

import javax.servlet.Filter;

import javax.servlet.FilterChain;

import javax.servlet.FilterConfig;

import javax.servlet.ServletException;

import javax.servlet.ServletRequest;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class ServiceFilter implements Filter {

    private FilterConfig filterConfig;
    static int count;

    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("初始化了");
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request1 = (HttpServletRequest) request;
        String ruri = request1.getRequestURI();
        if (ruri!=null&&((ruri.indexOf("do")!=-1))) {
            count ++;
            System.out.println("第"+count+"次调用do接口");
        }
        chain.doFilter(request,response);
    }

    public void destroy() {
        System.out.println("销毁了");
    }
}