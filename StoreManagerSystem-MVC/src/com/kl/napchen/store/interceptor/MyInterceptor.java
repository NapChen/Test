package com.kl.napchen.store.interceptor;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class MyInterceptor implements HandlerInterceptor {

	// 最后执行，可用于释放资源:可以根据exception是否为null判断是否发生了异常，进行日志记录。
	/**
	 * 该方法也是需要当前对应的Interceptor的preHandle方法的返回值为true时才会执行。该方法将在整个请求完成之后，
	 * 也就是DispatcherServlet渲染了视图执行， 这个方法的主要作用是用于清理资源的
	 */
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object obj, Exception exception)
			throws Exception {
		System.out.println("Myinterceptor-----afterCompletion");
		System.out.println("exception:" + exception);
	}

	// 生成视图之前执行:有机会修改ModelAndView
	/**
	 * 这个方法只会在当前这个Interceptor的preHandle方法返回值为true的时候才会执行。
	 * postHandle是进行处理器拦截用的，它的执行时间是在处理器进行处理之后，
	 * 即在Controller的方法调用之后执行，但是它会在DispatcherServlet进行视图的渲染之前执行，
	 * 也就是说在这个方法中你可以对ModelAndView进行操作。
	 * 这个方法的链式结构跟正常访问的方向是相反的，先声明的Interceptor拦截器该方法反而会后调用，
	 */
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object obj, ModelAndView modelAndView)
			throws Exception {
		System.out.println("Myinterceptor-----postHandle");
	}

	// Action之前执行:可以进行编码、安全控制等处理；
	/**
	 * preHandle方法是进行处理器拦截用的，顾名思义，该方法将在Controller处理之前进行调用，
	 * SpringMVC中的Interceptor拦截器是链式的， 可以同时存在
	 * 多个Interceptor，然后SpringMVC会根据声明的前后顺序一个接一个的执行，
	 * 而且所有的Interceptor中的preHandle方法都会在
	 * Controller方法调用之前调用。SpringMVC的这种Interceptor链式结构也是可以进行中断的，
	 * 这种中断方式是令preHandle的返 回值为false，当preHandle的返回值为false的时候整个请求就结束了。
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object obj) throws Exception {
		System.out.println("Myinterceptor-----preHandle");
		// 输出请求信息
		System.out.println("getRequestURI:" + request.getRequestURI());
		System.out.println("getRemoteHost:" + request.getRemoteHost());
		System.out.println("getLocalName:" + request.getLocalName());
		System.out.println("getPathInfo:" + request.getPathInfo());
		System.out.println("getRemoteHost:" + request.getRemoteHost());
		System.out.println("getRemoteAddr:" + request.getRemoteAddr());
		System.out.println("getServletPath:" + request.getServletPath());
		Enumeration<String> hearderNames = request.getHeaderNames();
		while (hearderNames.hasMoreElements()) {
			System.out.println(hearderNames.nextElement() + ":"
					+ request.getHeader(hearderNames.nextElement()));
		}
		return true;
	}
}
