<%@page import="com.etc.entity.OrderDetail"%>
<%@page import="com.etc.entity.Order"%>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'finall.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var clickCount = 0;//记录鼠标点击次数
			$("#btn").click(function(){
				var oid = $("#oid").text();
				var json = {"oid":oid};
				console.log(oid);
				clickCount++;
				var num = clickCount%2;
				//单次点击显示详情
				if(num==1){
				var html="";
				html += "<table>";
				html += 	"<tr>";
				html += 		"<th>菜名</th>";
				html += 		"<th>价格</th>";
				html += 		"<th>数量</th>";
				html += 		"<th>小计</th>";
				html += 	"</tr>";
				$.post("order/findorderbyoid",json,function(jsonArray){
				for(var i=0;i<jsonArray.length;i++){
	 			html += 	"<tr>";
				html += 		"<td>"+jsonArray[i].mName+"</td>";
				html += 		"<td>"+jsonArray[i].mPrice+"</td>";
				html += 		"<td>"+jsonArray[i].mCount+"</td>";
				html += 		"<td>"+jsonArray[i].mCount * jsonArray[i].mPrice+"</td>";
				html += 	"</tr><br>";
				}
				html += "<table>";
				$("#tbody1").show();
				$("#tbody1").html(html);				  
				});
				}
				//双次点击隐藏
				if(num==0){
					$("#tbody1").hide();
				}
				console.log(num);
			})
		});
	</script>
  </head>
  
  <body>
  <h3 align="center">订单列表</h3>
  	<table  align="center" border="4" class="table table-bordered">
  	<tr>
  		<th>订单序号</th>
  		<th>订单时间</th>
  		<th>订单状态</th>
  		<th>顾客姓名</th>
  		<th>数量</th>
  		<th>价格</th>
  	</tr>
  		<c:forEach items="${orders }" var="order">
  		  	<tr>
  		  	<td id="oid" name="oid">${order.oId }</td>
	 		<td>${order.oDate }</td>
	 		<td>${order.oState }</td>
	 		<td>${order.customer.cName }</td>
	 		<td>${order.nums }</td>	
	 		<td>${order.prices }</td>
	 		<td><button id="btn">查看详情</button></td>
	 		<tbody id="tbody1"></tbody>
	 		</tr>
  		</c:forEach>
  	</table>
  </body>
</html>
