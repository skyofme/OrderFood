package com.etc.Util;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserTestUtil {
	
	
	/*
	 * 判断用户是否已经登录，已经登录的继续，未登录的跳转到登录界面
	 * 参数：HttpServletRequest request,HttpServletResponse response，
	 * 前台传来的
	 */
	public static void findUserTest(HttpServletRequest request,HttpServletResponse response) throws IOException {
		Object attribute = request.getSession().getAttribute("user");
		if (null==attribute) {
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
			request.getSession().removeAttribute("name");
			request.getSession().removeAttribute("user");
			request.getSession().removeAttribute("role");
			out.flush();
			out.close();
			//response.sendRedirect("http://localhost:8080/OrderFood/login.jsp");
			//System.out.println(builder.toString());
		}
	}
}
