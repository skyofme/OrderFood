<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional/">
<html>
<head>
	<base href="<%=basePath%>">

		<meta charset="UTF-8">
		<title>我的订单</title>
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<link rel="stylesheet" type="text/css" href="css/style1.css"/>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css"/>
	</head>
	<body>
	<div class="main">
	<div class="clearfix nav">
		<a class="logo" href="javascript:;"></a>
		<ul class="clearfix nav-wrap" style="height:78px">
			<li><a class="nav-item" href="index.jsp">首页</a></li>
			<li><a class="nav-item" href="pinpai.jsp">品牌故事</a></li>
			<li><a class="nav-item" id="menu">美食系列</a></li>
			<li><a class="nav-item" href="shoppingcar/findsp/<%=request.getSession().getAttribute("user")%>">购物车</a></li>
			<li><a class="nav-item nav-active" href="showSelfOrder">我的订单</a></li>
				<c:if test="${!empty user}">
        		<li><a  title="点我进入个人中心" href="customer/showme"><%=request.getSession().getAttribute("name") %></a></li>
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
			<li class="bnav-item"><a href="myOrder.jsp">我的订单</a></li>
		</ul>
		<div class="newslist-wrap">
			<p class="newslist-tit">我的订单</p>
			<div id="table-div" align="center">
				<table align="center"  class="table table-striped" style="width: 796px; " >
					<tr>
						<th></th>
						<th></th>						
						<th>订单号</th>
						<th>时间</th>
						<th>状态</th>
						<th>查看</th>
					</tr>
					<c:forEach items="${orders}" var="order">
						
						<tr>
						<th></th>
						<th></th>
						
						<td>${order.oId}</td>
						<td><fmt:formatDate value="${order.oDate }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
						<td>${order.oState}</td>
						<td><a href="orderDetailshow?oId=${order.oId}">订单详情</a></td>
					</tr>
					</c:forEach>
				</table>
			</div>

			<nav aria-label="">
			<ul class="pager">
				<c:if test="${page.pageNum>1&&page.pageNum<=page.pages}">
					<li><a href="" onclick="return doprepage()">上一頁：第${page.prePage}頁</a></li>
				</c:if>
				<c:if test="${page.pageNum>0&&page.pageNum<page.pages}">
					<li><a href="" onclick="return donextpage()">下一頁：第${page.nextPage}頁</a></li>
				</c:if>
			</ul>
		</nav>
		
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
		
	
	<!--jq调用-->
	<script src="js/jquery-1.11.0.js" type="text/javascript"></script>
	<script type="text/javascript">
		//加载caida
		$("#menu").click(function(){
			var jq=jQuery.noConflict();
			console.log("222222222222222222222");
			window.location.href="<%=basePath%>menu/findMeishi"
		})
		//导航当前项切换	
		$(".nav-item").click(function(){
			$(this).parent("li").siblings().children().removeClass("nav-active");		
			//点击对象的父级（li）的兄弟级（li）的子集（a）移除类
			$(this).addClass("nav-active");												
			//给点击对象添加类
		});
	</script>
	
	 <script>
 //上一页跳转
 function doprepage() {
 		var data = "";
 		$.ajaxSetup ({ cache: false });
		$(".main").load("showSelfOrder?page=${page.prePage}&pageSize=${page.pageSize}",data,function(result){
			$result = $(result); 
         	$result.find("script").appendTo('.main');
		});
		return false;
			}
 //下一页跳转
 function donextpage() {
 		var data = "";
 		$.ajaxSetup ({ cache: false });
		$(".main").load("showSelfOrder?page=${page.nextPage}&pageSize=${page.pageSize}",data,function(result){
			$result = $(result); 
         	$result.find("script").appendTo('.main');
		});
		return false;
			}
			
</script>

</div>
</body>
</html>
