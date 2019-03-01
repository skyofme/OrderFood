<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional/">
<html>
	<head>
		<meta charset="UTF-8">
		<!-- 优先使用 IE 最新版本和 Chrome -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
		 <base href="<%=basePath%>">
		<title>首页</title>
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<link rel="stylesheet" type="text/css" href="css/style1.css"/>
		<script src="js/jquery-1.11.0.js" type="text/javascript"></script>
		<script type="text/javascript">
			console.log("------------");
			var id1= <%=request.getSession().getAttribute("user")%>
			var id=parseInt(id1);
			console.log(id);
		</script>
	</head>
	<body>
	  
		<div class="clearfix nav">
			<a class="logo" href="javascript:;"></a>
			<ul class="clearfix nav-wrap">
				<li><a class="nav-item nav-active" href="index.jsp">首页</a></li>
				<li><a class="nav-item" href="pinpai.jsp">品牌故事</a></li>
				<li><a class="nav-item" id="menu">美食系列</a></li>
				<li><a class="nav-item" id="shoppingcar"  href="shoppingcar/findsp/<%=request.getSession().getAttribute("user")%>">购物车</a></li>
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
		
		<div class="new-wrap">
			<p class="newfood-tit">新品推荐</p>
			<div class="newfood-box clearfix" id="newfood-table">
				<ul class="newfood-wrap clearfix newfood-show">
					<li class="newfood-item newfood-right newfood-li1">
						<a href="meishi-detail.jsp" class="newfood-p1">茶漱海鲜汤</a>
					</li>
					<li class="newfood-item newfood-right newfood-li2">
						<a href="meishi-detail.jsp" class="newfood-p2">玉米海螺沟</a>
					</li>
					<li class="newfood-item newfood-right newfood-li3">
						<a href="meishi-detail.jsp" class="newfood-p3">芝士蛋糕卷</a>
					</li>
					<li class="newfood-item newfood-li4">
						<a href="meishi-detail.jsp" class="newfood-p4">芝士大虾</a>
					</li>
					<li class="newfood-item newfood-right newfood-li5">
						<a href="meishi-detail.jsp" class="newfood-p5">西冷牛排</a>
					</li>
					<li class="newfood-item newfood-right newfood-li6">
						<a href="meishi-detail.jsp" class="newfood-p6">草莓布丁杯</a>
					</li>
					<li class="newfood-item newfood-right newfood-li7">
						<a href="meishi-detail.jsp" class="newfood-p7">黑椒牛排</a>
					</li>
					<li class="newfood-item newfood-li8">
						<a href="meishi-detail.jsp" class="newfood-p8">茶漱海鲜汤</a>
					</li>
				</ul>
				<ul class="newfood-wrap clearfix">
					<li class="newfood-item newfood-right newfood-li5">
						<a href="meishi-detail.jsp" class="newfood-p5">西冷牛排</a>
					</li>
					<li class="newfood-item newfood-right newfood-li6">
						<a href="meishi-detail.jsp" class="newfood-p6">草莓布丁杯</a>
					</li>
					<li class="newfood-item newfood-right newfood-li7">
						<a href="meishi-detail.jsp" class="newfood-p7">黑椒牛排</a>
					</li>
					<li class="newfood-item newfood-li8">
						<a href="meishi-detail.jsp" class="newfood-p8">茶漱海鲜汤</a>
					</li>
					<li class="newfood-item newfood-right newfood-li1">
						<a href="meishi-detail.jsp" class="newfood-p1">茶漱海鲜汤</a>
					</li>
					<li class="newfood-item newfood-right newfood-li2">
						<a href="meishi-detail.jsp" class="newfood-p2">玉米海螺沟</a>
					</li>
					<li class="newfood-item newfood-right newfood-li3">
						<a href="meishi-detail.jsp" class="newfood-p3">芝士蛋糕卷</a>
					</li>
					<li class="newfood-item newfood-li4">
						<a href="meishi-detail.jsp" class="newfood-p4">芝士大虾</a>
					</li>
				</ul>
				<ul class="newfood-wrap clearfix">
					<li class="newfood-item newfood-right newfood-li3">
						<a href="meishi-detail.jsp" class="newfood-p3">芝士蛋糕卷</a>
					</li>
					<li class="newfood-item newfood-li4">
						<a href="meishi-detail.jsp" class="newfood-p4">芝士大虾</a>
					</li>
					<li class="newfood-item newfood-right newfood-li1">
						<a href="meishi-detail.jsp" class="newfood-p1">茶漱海鲜汤</a>
					</li>
					<li class="newfood-item newfood-right newfood-li2">
						<a href="meishi-detail.jsp" class="newfood-p2">玉米海螺沟</a>
					</li>
					<li class="newfood-item newfood-right newfood-li7">
						<a href="meishi-detail.jsp" class="newfood-p7">黑椒牛排</a>
					</li>
					<li class="newfood-item newfood-right newfood-li5">
						<a href="meishi-detail.jsp" class="newfood-p5">西冷牛排</a>
					</li>
					<li class="newfood-item newfood-right newfood-li6">
						<a href="meishi-detail.jsp" class="newfood-p6">草莓布丁杯</a>
					</li>
					<li class="newfood-item newfood-li8">
						<a href="meishi-detail.jsp" class="newfood-p8">茶漱海鲜汤</a>
					</li>
				</ul>
			</div>
			<div class="clearfix" id="newfood-span">
				<span style="background: url(img/icon-2.png);"></span>
				<span></span>
				<span></span>
			</div>
		</div>
		
		<div class="news-wrap">
			<p class="news-tit">新闻资讯</p>
			<dl class="clearfix news-dl">
				<dt class="news-dt">
					<img src="img/pic2.jpg"/>
				</dt>
				<dd class="news-dd">
					<a href="news-con.html" class="news-link clearfix">
						<p class="link-tit">贵族食代牛排东莞厚街万达餐厅开业</p>
						<p class="link-time">2016-09-28</p>
					</a>
					<a href="news-con.html" class="news-link clearfix">
						<p class="link-tit">贵族食代牛排无锡大成巷餐厅开业</p>
						<p class="link-time">2016-09-23</p>
					</a>
					<a href="news-con.html" class="news-link clearfix">
						<p class="link-tit">贵族食代牛排武汉黄陂广场餐厅开业</p>
						<p class="link-time">2016-09-20</p>
					</a>
					<a href="news-con.html" class="news-link clearfix">
						<p class="link-tit">贵族食代牛排福州永嘉天地餐厅开业</p>
						<p class="link-time">2016-09-17</p>
					</a>
					<a href="news-con.html" class="news-link clearfix">
						<p class="link-tit">贵族食代牛排网络大学第一批“学霸”亮相</p>
						<p class="link-time">2016-09-14</p>
					</a>
					<a href="news-con.html" class="news-link clearfix">
						<p class="link-tit">华南市场2016半年度餐厅经理营运会召开</p>
						<p class="link-time">2016-09-05</p>
					</a>
					<a href="news-con.html" class="news-link clearfix">
						<p class="link-tit">浙江大区召开餐厅经理营运会议</p>
						<p class="link-time">2016-09-23</p>
					</a>
					<a href="news-con.html" class="news-link clearfix">
						<p class="link-tit">8月15日 贵族食代牛排武汉武商众圆餐厅开业</p>
						<p class="link-time">2016-09-15</p>
					</a>
				</dd>
			</dl>
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
			var jq=jQuery.noConflict();
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
		//加载caida
		<%-- $("#shoppingcar").click(function(){
			var jq=jQuery.noConflict();
			console.log("333333333333333333");
			window.location.href="<%=basePath%>shoppingcar/findsp/<%=request.getSession().getAttribute("user") %>"
		}) --%>
	   	  //新品推荐table切换
	    var nSpan = document.getElementById("newfood-span");
			var newspan = nSpan.querySelectorAll("span");
			var oUl  = document.getElementById("newfood-table");
			var uls = oUl.querySelectorAll("ul");
			var last=newspan[0];
			for(var i=0;i<newspan.length;i++){
					newspan[i].index=i;  //给每一个按钮添加一个自定义属性，存储的是他们对应的索引值；
					newspan[i].onclick=function(){
						last.style.background="url(img/icon.png)";  //把上一次点击对象的背景更换掉
						uls[last.index].style.display="none"; //上一个对应的div，让他隐藏
						this.style.background="url(img/icon-2.png)"; //给当前点击的按钮添加背景
						uls[this.index].style.display="block"; //当前点击按钮对应的div显示			
						last=this; 	//把上一次点击的对象更新成当前点击的对象
					};
				};
	
	</script>
	</script>
</html>
