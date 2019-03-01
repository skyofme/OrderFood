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
		<meta charset="UTF-8">
		<title>美食系列</title>
		<base href="<%=basePath%>">
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<link rel="stylesheet" type="text/css" href="css/style1.css"/>
		<script src="js/jquery-1.11.0.js" type="text/javascript"></script>

	</head>
	<body>
	<div class="clearfix nav">
		<a class="logo" href="javascript:;"></a>
		<ul class="clearfix nav-wrap">
			<li><a class="nav-item" href="index.jsp">首页</a></li>
			<li><a class="nav-item" href="pinpai.jsp">品牌故事</a></li>
			<li><a class="nav-item  nav-active" id="menu">美食系列</a></li>
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
			<li class="bnav-item"><a href="">首页</a></li>
			<li class="bnav-item">&lt;</li>
			<li class="bnav-item"><a href="">美食系列</a></li>
			<li class="bnav-item">&lt;</li>
			<li class="bnav-item"><a href="javascript:;">全部菜品</a></li>
		</ul>
		<div class="clearfix table-wrap" id="tab-span">
			
			<span class="table-item table-active">全部菜品</span>
			<!-- 遍历菜单类型 -->
			<c:forEach items="${requestScope.foodkind}" var="foodkind">
					<td><span class="table-item" id="foodtype">${foodkind.fkName}</span></td>
			</c:forEach>
			
			<!-- 搜索框 -->
			<div class="search clearfix">
	<form  action="menu/searchfood" name="update" method="post"  accept-charset="utf-8"  onsubmit="document.charset='utf-8';">
				<input class="inp-txt" type="text" name="mName" id="foodname" value="输入关键字" 
				onfocus="if(this.value=='输入关键字'){this.value=''};this.style.color='black';"
				onblur="if(this.value==''||this.value=='输入关键字'){this.value='输入关键字';this.style.color='gray';}" />
				<input class="inp-btn" type="submit" name="" id="searchname" value="搜索" />
	</form>
			</div>
		</div>
		
		
		<div id="table-div">
			<div class="table-pic table-show clearfix">
			<!-- 主页查询所有美食 -->
			<!--form action="menu/findMeishiDetailByName/"+mid name="update" method="POST" accept-charset="utf-8"  onsubmit="document.charset='utf-8';">  -->
				<c:forEach items="${requestScope.menu}" var="menu">		
						<a onclick="c('${menu.mName}')" class="ms-wrap" style="margin-right:10px">	
							<img src="<%=basePath%>${menu.mPicture}" alt="" />
							<h2 id="subform" class="ms-tit">${menu.mName}</h2>
							<p class="ms-txt">价格：${menu.mPrice}元</p>
						 </a>
				</c:forEach>
			
			</div>
			
	
			<div class="table-pic clearfix">
			<!--  经典牛排-->
			<c:forEach items="${requestScope.menu1}" var="menu1">
				<a onclick="c('${menu1.mName}')" class="ms-wrap" style="margin-right:20px">
					<span class="ms-pic">
						<img src="<%=basePath%>${menu1.mPicture}" alt="" />
					</span>
					<h2 class="ms-tit">${menu1.mName}</h2>
					<p class="ms-txt">价格：${menu1.mPrice}元</p>
				</a>
				</c:forEach>
			</div>
		
			<div class="table-pic clearfix">
				<c:forEach items="${requestScope.menu2}" var="menu2" >
				<a onclick="c('${menu2.mName}')" class="ms-wrap" style="margin-right:20px">
					<span class="ms-pic">
						<img src="<%=basePath%>${menu2.mPicture}" alt="" />
					</span>
					<h2 class="ms-tit">${menu2.mName}</h2>
					<p class="ms-txt">价格：${menu2.mPrice}元</p>
				</a>
				</c:forEach>
			</div>
			<div class="table-pic clearfix">
				<c:forEach items="${requestScope.menu3}" var="menu3">
				<a onclick="c('${menu3.mName}')" class="ms-wrap" style="margin-right:20px">
					<span class="ms-pic">
						<img src="<%=basePath%>${menu3.mPicture}" alt="" />
					</span>
					<h2 class="ms-tit">${menu3.mName}</h2>
					<p class="ms-txt">价格：${menu3.mPrice}元</p>
				</a>
				</c:forEach>
			</div>
			<div class="table-pic clearfix">
				<c:forEach items="${requestScope.menu4}" var="menu4">
				<a onclick="c('${menu4.mName}')" class="ms-wrap" style="margin-right:20px">
					<span class="ms-pic">
						<img src="<%=basePath%>${menu4.mPicture}" alt="" />
					</span>
					<h2 class="ms-tit">${menu4.mName}</h2>
					<p class="ms-txt">价格：${menu4.mPrice}元</p>
				</a>
				</c:forEach>
			</div>
			<div class="table-pic clearfix">
				<c:forEach items="${requestScope.menu5}" var="menu5">
				<a onclick="c('${menu5.mName}')" class="ms-wrap" style="margin-right:20px">
					<span class="ms-pic">
						<img src="<%=basePath%>${menu5.mPicture}" alt="" />
					</span>
					<h2 class="ms-tit">${menu5.mName}</h2>
					<p class="ms-txt">价格：${menu5.mPrice}元</p>
				</a>
				</c:forEach>
			</div>
		
			<!--  ul class="ms-paging clearfix">
				<li><a href="javascript:;" class="pag-item">&lt;</a></li>
				<li><a href="javascript:;" class="pag-item pag-active">1</a></li>
				<li><a href="javascript:;" class="pag-item">2</a></li>
				<li><a href="javascript:;" class="pag-item">3</a></li>
				<li><a href="javascript:;" class="pag-item">4</a></li>
				<li><a href="javascript:;" class="pag-item">&gt;</a></li>
			</ul>-->
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
	
	<script src="<%=basePath%>js/jquery-1.11.0.js" type="text/javascript"></script>
	<script type="text/javascript">
		//加载caida
		//$("#menu").click(function(){
		//	var jq=jQuery.noConflict();
		//	console.log("222222222222222222222");
		//	window.location.href="////basePath%//>menu/findMeishi"
		//})
	
		//导航当前项切换	
		$(".nav-item").click(function(){
			var jq=jQuery.noConflict();
			$(this).parent("li").siblings().children().removeClass("nav-active");		
			//点击对象的父级（li）的兄弟级（li）的子集（a）移除类
			$(this).addClass("nav-active");												
			//给点击对象添加类
		})
		//美食系列当前项切换
		$(".table-item").click(function(){
			var jq=jQuery.noConflict();
			$(this).siblings().removeClass("table-active");
			$(this).addClass("table-active");	
		});
		
		//通过id获取当前对象的菜名，跳转到detail
		var fnid = $("#subform").text();
		function c(str){
			var fname = JSON.stringify(str);   //将获取到的值转为string类型   
		    console.log(fname); //string
			window.location.href="<%=basePath%>menu/findMeishiDetailByName/"+fname;
			
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
			//$(this).load("menu/findMeishiDetailByName/"+fid);
		
		//搜索美食（按名称）class=inp-txt
		function dosearch(){
			var searchName = $(".inp-txt").val();
			alert(searchName);
			$.ajax({
				type:"GET",
				url:"menu/searchFood",
				data:{"foodname":searchName},
				success:function(data){
					console.log(data);
					alert(data);
				}
			});
			
		}	
		
	    //美食系列table切换
	    var oSpan = document.getElementById("tab-span");
			var spans = oSpan.querySelectorAll("span");
			var oDiv  = document.getElementById("table-div");
			var divs = oDiv.querySelectorAll("div");
			var last=spans[0];
			for(var i=0;i<spans.length;i++){
					spans[i].index=i;  //给每一个按钮添加一个自定义属性，存储的是他们对应的索引值；
					spans[i].onclick=function(){
						divs[last.index].style.display="none"; //上一个对应的div，让他隐藏
						divs[this.index].style.display="block"; //当前点击按钮对应的div显示			
						last=this; 	//把上一次点击的对象更新成当前点击的对象
					};
				};
		
	
	</script>
</html>
