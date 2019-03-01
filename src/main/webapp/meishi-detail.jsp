<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName

()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional/">
<html>
	<head>
		<meta charset="UTF-8">
		<base href="<%=basePath%>">
		<title>品牌故事</title>
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<link rel="stylesheet" type="text/css" href="css/style1.css"/>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css"/>
		<link rel="stylesheet" type="text/javascript" href="js/bootstrap.js"/>
		<link rel="stylesheet" type="text/javascript" href="js/bootstrap.min.js"/>
		<link rel="stylesheet" href="css/base.css">
		<link rel="stylesheet" href="css/good_center-detail.css">
		 <script src="js/jquery.js"  type="text/javascript"></script>
	   	<script src="js/requestAnimationFrame.js"  type="text/javascript"></script>
	   	<script src="js/jquery.fly.min.js"  type="text/javascript"></script>
		<script type="text/javascript" src="js/good_detail_center.js"></script>
	    <script type="text/javascript" src="js/magnifer.js"></script>
	   <script type="text/javascript">
			
		</script>
	    

	</head>
	<body>
		<div class="clearfix nav">
			<a class="logo" href="javascript:;"></a>
			<ul class="clearfix nav-wrap">
				<li><a class="nav-item" href="index.jsp">首页</a></li>
				<li><a class="nav-item" href="pinpai.jsp">品牌故事</a></li>
				<li><a class="nav-item nav-active" id="menu">美食系列

				</a></li>
				<li><a class="nav-item" href="shoppingcar/findsp/<%=request.getSession().getAttribute("user")%>">购物车</a></li>
				<li><a class="nav-item" href="showSelfOrder">我的订单

				</a></li>
				<c:if test="${!empty user}">
        		<li><a id="username" title="点我进入个人中心" href="customer/showme"><%=request.getSession().getAttribute("name") %></a></li>
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

		<ul class="breadnav clearfix" style="font-size: 18px">
			<li class="bnav-item">首页</li>
			<li class="bnav-item">&lt;</li>
			<li class="bnav-item">美食系列</li>
			<li class="bnav-item">&lt;</li>
			<li class="bnav-item"><a href="javascript:;" id="foodname">${menuDetail.mName}</a></li>
		</ul>
		<br>

		<div class="w detail-center">
			<div class="center-left" id="center-left">
				<div class="big" id="big">
					<img src="${menuDetail.mPicture}" id="center-img">
					<div class="mask" id="mask"></div>
				</div>
				<div id="big-div" class="big-div">
					<img src="${menuDetail.mPicture}" id="big-img">
				</div>
			</div>

			<div class="center-right">
			
		<!--  form action="menu/addToShopCar" name="" method="post" >-->
				<div class="center-right-left">		
						<div class="brand" style="font-size: 50px">
							<h1><strong>${menuDetail.mName}</strong></h1>
						</div><br>
					<div class="price" >
						<span class="span1" style="font-size: 25px">优惠价：￥</span><span class="span11" style="font-size: 25px"><i></i>${menuDetail.mPrice}</span><del><fmt:formatNumber  value="${menuDetail.mPrice*1.3}" type="number"></fmt:formatNumber></del><br><br>
						<span class="span2" style="font-size: 25px">折扣：</span><span class="span22" style="font-size: 25px">9.0折</span><br><br>
						<span class="span3" style="font-size: 25px">库存：</span><span class="span33"style="font-size: 25px" id="allnum">${menuDetail.mNumber}</span><br><br><br><br>
					</div>
					 <div class="shopping-car">
	                    <div class="amount">
	                        <button class="dec"  type="button">-</button><input id="num" type="text" class="input" name="buyNum" value="1"><button class="inc"  type="button">+</button>
	                    </div>
	                    <input id="input" class="add" type="submit" value="加入购物车" onclick="logincheck()">
	                   
	                </div>
				</div>


			</div>
		</div>
		</div>
		
	</body>
	<!--jq调用-->
	<script src="js/jquery-1.11.0.js" type="text/javascript"></script>

	<script type="text/javascript">
		$(".nav-item").click(function(){
			$(this).parent("li").siblings().children().removeClass("nav-active");		
			$(this).addClass("nav-active");						

						
		
		});
		//加载caida
		$("#menu").click(function(){
			var jq=jQuery.noConflict();
			console.log("222222222222222222222");
			window.location.href="<%=basePath%>menu/findMeishi"
		});
		//添加到购物车
	    function logincheck(){
				var amount = $(".input").val();
				var loginname = $("#username").text();
				var allnum = $("#allnum").text();
				if(loginname==null||loginname==""){
					alert("您还未登陆,请先登陆");
					window.location.href="login.jsp"
				}else{
					if(amount>allnum){
						alert("超过库存数，请重新输入")
					}else{
						var foodname = $("#foodname").text();			
						$.ajax({ 
							type:"POST",
							url:"menu/addToShopCar",
							data:{
								"buyNum":amount,
								"username":loginname,
								"foodname":foodname
							},success:function(data){
								alert("添加到购物车成功");
							}
						
						});
					}
					
				}
	}
		//var type = $("#foodtype").text();
		//console.log(type+"----------");
		//$.ajax({
		//	type:"GET",
		//	url:"menu/findMeishiByType",
		//	data:{"foodtypeName":type},
		//	success:function(data){
		//		console.log(data);
		//	}
		//});
	
		
	</script>
</html>
