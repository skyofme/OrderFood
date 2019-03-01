package com.etc.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

/**
 * 登录过滤
 * 
 */
public class SessionFilter extends OncePerRequestFilter {

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.springframework.web.filter.OncePerRequestFilter#doFilterInternal(
	 * javax.servlet.http.HttpServletRequest,
	 * javax.servlet.http.HttpServletResponse, javax.servlet.FilterChain)
	 */
	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {

		// 不过滤的uri
		String[] notFilter = new String[] { "login.jsp", "register.jsp" };

		// 请求的uri
		String uri = request.getRequestURI();
		// 是否过滤
		boolean doFilter = true;
		Object obj=null;
		Object obj1=null;
		for (String s : notFilter) {
			// 如果uri中包含不过滤的uri，则不进行过滤
			if (uri.indexOf(s) != -1) {
				doFilter = false;
				break;
			}
		}
		// uri中包含background时才进行过滤
		if (uri.indexOf("background") != -1||uri.indexOf("shoppingcar")!= -1||uri.indexOf("showSelfOrder")!= -1) {
			if (doFilter) {
				// 执行过滤
				// 从session中获取登录者实体
				 obj = request.getSession().getAttribute("user");
				 obj1=request.getSession().getAttribute("role");
				 if(uri.indexOf("background") != -1){
					 obj = request.getSession().getAttribute("role");
					 System.out.println("改变-----"+obj);
				 }
				 if(uri.indexOf("shoppingcar")!= -1||uri.indexOf("showSelfOrder")!= -1){
					 if(obj1!= null){
						 obj=null;
					 }
				 }
				 System.out.println("session----------" + obj);
				if (null == obj) {
					// 如果session中不存在登录者实体，则弹出框提示重新登录
					// 设置request和response的字符集，防止乱码
					request.setCharacterEncoding("UTF-8");
					response.setCharacterEncoding("UTF-8");
					PrintWriter out = response.getWriter();
					String path=request.getContextPath();
					String loginPage = path+"/login.jsp";//绝对路径
					StringBuilder builder = new StringBuilder();
					builder.append("<script type=\"text/javascript\"  charset=\"gb2312\"   language=\"javascript\">");
					builder.append("alert('please login!');");
					builder.append("window.top.location.href='");
					builder.append(loginPage);
					builder.append("';");
					builder.append("</script>");
					out.print(builder.toString());
					System.out.println(builder.toString());
				} else {
					// 如果session中存在登录者实体，则继续
					filterChain.doFilter(request, response);
				}
			} else {
				// 如果不执行过滤，则继续
				filterChain.doFilter(request, response);
			}
		} else {
			// 如果不执行过滤，则继续
			filterChain.doFilter(request, response);
		}

	}

}
