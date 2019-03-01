<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional/">
<html>
	<head>
	<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>品牌故事</title>
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<link rel="stylesheet" type="text/css" href="css/style1.css"/>
	</head>
	<body>
	<div class="clearfix nav">
		<a class="logo" href="javascript:;"></a>
		<ul class="clearfix nav-wrap">
			<li><a class="nav-item" href="index.jsp">首页</a></li>
			<li><a class="nav-item  nav-active" href="pinpai.jsp">品牌故事</a></li>
			<li><a class="nav-item" id="menu">美食系列</a></li>
			<li><a class="nav-item" href="shoppingcar/findsp/<%=request.getSession().getAttribute("user")%>">购物车</a></li>
			<li><a class="nav-item" href="showSelfOrder">我的订单</a></li>
			<c:if test="${!empty user}">
        		<li><a title="点我进入个人中心" href="customer/showme"><%=request.getSession().getAttribute("name") %></a></li>
        		<li><a href="removeuser">退出</a></li>
        		</c:if>
				<c:if test="${empty user}">
        		<li>			<a class="nav-item" href="login.jsp">登录/注册</a>
        		</li>
        		</c:if>
		
		</ul>
	</div>
	<div id="container">
			<div id="buttons">
		        <span index="1" class="on"></span>
		        <span index="2"></span>
		        <span index="3"></span>
		    </div>
		    <a href="javascript:;" id="prev" class="arrow"><img src="img/l.png"/></a>
		    <a href="javascript:;" id="next" class="arrow"><img src="img/r.png"/></a>
		</div>
		
		<ul class="breadnav clearfix">
			<li class="bnav-item"><a href="index.html">首页</a></li>
			<li class="bnav-item">&lt;</li>
			<li class="bnav-item"><a href="pinpai.jsp">品牌故事</a></li>
		</ul>
		<div class="comp-wrap">
			<p class="comp-tit">公司简介</p>
			<div class="comp-pic">
				<img src="img/about-pic3.jpg"/>
			</div>
			<div class="comp-txt">
				<p>贵族食代牛排是昔日的台湾首富、台湾知名企业贵族食代集团吴彦祖和周杰伦董事长先生招待贵宾的知名私房料理。严选一头牛的第六至第八对肋骨这六块牛排。是以“一头牛仅供6客”的贵族食代牛排为招牌菜的中高价位直营连锁西餐厅，独具中国口味，全熟牛排，鲜嫩多汁，适合中国人口味，以菜色精致、好吃、服务好、风格高雅、管理专业着称。</p>
				<p>何谓经典，可能就是在品鉴无数美食后，其绝妙的滋味仍旧不能被替代。再次品味时，仍能激起内心的波澜与感动。如此经典，我们将为您重新诠释。全新的摆盘，搭配特制爽口的配菜，全熟风味，您不可辜负的舌尖美味。</p>
				<p>2003年登陆大陆，截至目前，贵族食代牛排在上海、北京、深圳、广州、南京、武汉、成都、重庆等地已经有40余家直营店，成为高端连锁牛排的领导品牌。</p>
			</div>
		</div>

		<div class="foot">
			<div class="foot-wrap">
				<p class="foot-tit">友情链接</p>
				<ul class="foot-link clearfix">
					<li class="foot-pic">
						<a href="javascript:;"><img src="img/link6.png"/></a>
					</li>
					<li class="foot-pic">
						<a href="javascript:;"><img src="img/link5.png"/></a>
					</li>
					<li class="foot-pic">
						<a href="javascript:;"><img src="img/link4.png"/></a>
					</li>
					<li class="foot-pic">
						<a href="javascript:;"><img src="img/link3.png"/></a>
					</li>
					<li class="foot-pic">
						<a href="javascript:;"><img src="img/link2.png"/></a>
					</li>
					<li class="foot-pic">
						<a href="javascript:;"><img src="img/link1.png"/></a>
					</li>
				</ul>
				<div class="copyright">
					<p>CopyRight©2003-2015 www.91cy.cn All rigt rederved</p>
					<p>版权所有：贵族食代牛排有限公司  来源:<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
					<p>ICP备案号：京ICP备16047255号-3本站信息由会员自主添加，如信息涉及隐私等，网站不承担任何责任！</p>
				</div>
			</div>
		</div>
		
	</body>
	<!--jq调用-->
	<script src="js/jquery-1.11.0.js" type="text/javascript"></script>
	<script type="text/javascript">
		//导航当前项切换	
		$(".nav-item").click(function(){
			$(this).parent("li").siblings().children().removeClass("nav-active");		
			//点击对象的父级（li）的兄弟级（li）的子集（a）移除类
			$(this).addClass("nav-active");												
			//给点击对象添加类
		});
			//加载caida
	$("#menu").click(function(){
		var jq=jQuery.noConflict();
		console.log("222222222222222222222");
		window.location.href="<%=basePath%>menu/findMeishi"
	})
	</script>
</html>
