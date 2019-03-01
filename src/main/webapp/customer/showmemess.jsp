<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.etc.entity.Customer"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	//  basePath= http://localhost:8080/SSH_Demo01/
%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>个人中心</title>
<link href="css/ordershow.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="orderjs/jQuery1.7.js"></script>
<script type="text/javascript" src="orderjs/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="orderjs/jquery1.42.min.js"></script>
<script type="text/javascript" src="orderjs/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="orderjs/Validform_v5.3.2_min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var $tab_li = $('#tab ul li');
	$tab_li.hover(function(){
		$(this).addClass('selected').siblings().removeClass('selected');
		var index = $tab_li.index(this);
		$('div.tab_box > div').eq(index).show().siblings().hide();
	});	
});
</script>
<script type="text/javascript">
$(function(){
	$(".screenbg ul li").each(function(){
		$(this).css("opacity","0");
	});
	$(".screenbg ul li:first").css("opacity","1");
	var index = 0;
	var t;
	var li = $(".screenbg ul li");	
	var number = li.size();
	function change(index){
		li.css("visibility","visible");
		li.eq(index).siblings().animate({opacity:0},3000);
		li.eq(index).animate({opacity:1},3000);
	}
	function show(){
		index = index + 1;
		if(index<=number-1){
			change(index);
		}else{
			index = 0;
			change(index);
		}
	}
	t = setInterval(show,8000);
	//根据窗口宽度生成图片宽度
	var width = $(window).width();
	$(".screenbg ul img").css("width",width+"px");
});
</script>
</head>
<body style="margin-top:200px">
	<!--element start here-->
<div class="elelment">
	
	<div id="tab" class="table table-striped" br>
		<h2 align="center">个人中心</h2>
  		<table  align="center"  style="border:10px" class="table table-striped">
		<tr>
		<%
			request.getSession().setAttribute("cus", request.getAttribute("customer"));
		 %>
			<td>账号:</td><td id="cName">${customer.cName}</td>
		</tr><tr>
			<td>电话号码:</td><td id="cPhone">${customer.cPhone}</td>
		</tr><tr>
			<td>邮箱地址:</td><td id="cEmail">${customer.cEmail}</td>
		</tr><tr>
			<td>送餐地址:</td><td id="cAddress">${customer.cAddress}</td>
		</tr><tr>
			<td>操作:</td><td ><button onclick="return updateMess()">修改信息</button></td>
		</tr>
		
		</table>
	</div>
		
		
	
	<div class="screenbg">
  		<ul>
   		    <li><a href="javascript:;"><img src="orderimg/0.jpg"></a></li>
    		<li><a href="javascript:;"><img src="orderimg/1.jpg"></a></li>
    		<li><a href="javascript:;"><img src="orderimg/2.jpg"></a></li>
 		</ul>
</div>
</body>
<script type="text/javascript">
	function updateMess() {
		var tpswd = prompt("在这里输入您的密码才可以更改您的信息哦( • ̀ω•́ )✧","请输入密码");
		//var pswd =  document.getElementById("pswd").getAttribute("value");
		
		if(${customer.cPswd}!=tpswd){
			alert("密码错误");
			return false;
		}else{
			
			//转发请求，并将customer对象传递过去
			window.location.href="customer/updatememess.jsp";
			return true;
			}
					
	}
</script>
</html>