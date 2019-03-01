<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	//  basePath= http://localhost:8080/SSH_Demo01/
%>
<!DOCTYPE html>
<html>

<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<title>"吃了没"后台管理系统</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>css/font-awesome.css" />
<link rel="stylesheet" href="<%=basePath%>css/index.css" />
<link rel="stylesheet" href="<%=basePath%>css/mm-vertical.css" />

<link rel="stylesheet" href="<%=basePath%>css/component1.css" />

<style>
html {
	height: 100%;
}

body {
	height: 100%;
}

.container-fluid {
	height: auto;
}



</style>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/metisMenu.js"></script>

<script src="<%=basePath%>js/classie.js"></script>
<script src="<%=basePath%>js/modalEffects.js"></script>
</head>
<body onload="init1()">
	<%
		Object o = (Object) request.getAttribute("init1");
		if (o != null) {
	%>
	${init1 }
	<%
		}
		request.removeAttribute("init1");
	%>
	<div style="height: 100%; background-color: #3E3E3E;">
		<div class="container-fluid">
			<!--顶部导航-->
			<nav class="nav-top">
				<div class="navbar-header">
					<a class="navbar-brand" href="background/index.jsp"><strong><i
							class="icon fa fa-plane"></i> "饿了没"后台管理</strong></a>
							<div style="text-align:right;width: 1880px;">
        					<c:if test="${role!=''}">
        						<%=request.getSession().getAttribute("name") %>
        						<a href="emp/showme">个人中心</a>
        						<a href="removeuser">退出</a>
        					</c:if>
        					</div>
					<div id="sideNav" href="index.jsp">
						<i class="fa fa-bars icon"></i>
					</div>
				</div>

			</nav>
		<!--左侧导航-->
		<nav class="nav-left sidebar-nav">
			<ul class="metismenu" id="menu">
					
				<!-- 菜单管理员拥有的界面 ：查看菜单，修改菜单   根据data-uri进行跳转-->
					<li><a href="javascript:void(0);" class="has-arrow" aria-expanded="false"
					data-uri="none"><i class="fa fa-android"></i>菜单管理</a>
					<ul aria-expanded="false">
						<li><a href="javascript:void(0);" aria-expanded="false" aria-disabled="true"
						data-uri="menu/menuAll/1/3"  id="allmenu"><i class="fa fa-qrcode" ></i>查看菜单 </a></li> 
					</ul>
					 <c:if test="${role==1 }"> 
					<ul aria-expanded="false">
						<li><a href="javascript:void(0);" aria-expanded="false" aria-disabled="true"
						data-uri="menu/preaddmenu"  id="addmenu"><i class="fa fa-qrcode" ></i>添加菜品 </a></li> 
					</ul>
					</c:if>
					</li>
					
					<c:if test="${role!='1'}">
				<!-- 前台服务人员、厨房后台管理人员、总经理查看已付款的订单  根据data-uri进行跳转-->
					<li><a class="has-arrow" href="javascript:void(0);" aria-expanded="false"
					data-uri="none"><i class="fa fa-qrcode"></i>订单管理</a>
					<ul aria-expanded="false">
						<!-- 厨房管理人员查看到的订单 -->
						<c:if test="${role =='3' }">
							<li><a href="javascript:void(0);" aria-expanded="false" aria-disabled="true"
							data-uri="order/updateorder"><i class="fa fa-qrcode"></i>查看订单</a></li>
						</c:if>
						<!-- 前台服务人员、总经理查看到的订单 -->
						<c:if test="${role =='4'||role =='2'}">
							<li><a href="javascript:void(0);" aria-expanded="false" aria-disabled="true"
							data-uri="order/findorder"><i class="fa fa-qrcode"></i>查看订单</a></li>
						</c:if>

						
					</ul>
					</li>
					</c:if>
				<c:if test="${role=='4'}">
				<!-- 总经理查看日志   根据data-uri进行跳转 -->
				<li class="active"><a href="javascript:void(0);" aria-expanded="false"
					data-uri="log/logAll/1/3"><i class="fa fa-android"></i>查看员工日志</a></li>
				<!-- 总经理进行员工管理   根据data-uri进行跳转-->
				<li><a href="javascript:void(0);" class="has-arrow" aria-expanded="false"
					data-uri="none"><i class="fa fa-android"></i>员工管理</a>
					<ul aria-expanded="false">
						<li><a href="javascript:void(0);" aria-expanded="false" aria-disabled="true"
						data-uri="emp/empAll/1/3"   id="allemp"><i class="fa fa-qrcode" ></i>查询所有员工 </a></li>
					</ul></li>
				</c:if>
				<c:if test="${role!='2'}">
				<!-- 所有人查看自己的日志   根据data-uri进行跳转 -->
				<li class="active"><a href="javascript:void(0);" aria-expanded="false"
					data-uri="log/logbyid/${user}/1/3"><i class="fa fa-android"></i>查看自己日志</a></li>
			    </c:if>
			</ul>
		</nav>
		
		<!-- 主体-->
		<div class="main"></div>
		</div></div>
</body>
<script>
	
	$(".main").load("<%=basePath%>background/fullcalendar.jsp");
	//load(url,data,function(response,status,xhr))
	//$(".main").load("pageAllstuAction.action",{start:"1",pageSize:${tagpageSize}.val()});
	//一级菜单主体内容修改
	$(".nav-left .metismenu>li").click(function() {
		var $uri = $(this).find("a").data("uri");
		if ($uri != "none") {//没有二级菜单
			$(".main").html(""); //情况div.main 内容
			$(".main").load($uri);
		}
	});
	//二级菜单主体内容修改
	$(".nav-left .metismenu>li ul li").click(function() {
		var $uri = $(this).find("a").data("uri");
		$(".main").html("");
		if ($uri != "none") {//uri有跳转
			$(".main").load($uri);
		}
	});
	$("#menu").metisMenu();
	console.log("+++++"+${role =='2' });
</script>
<script src="<%=basePath%>js/jquery-2.1.1.min.js"></script>
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<script  src="<%=basePath%>js/metisMenu.js"></script>
</html>

