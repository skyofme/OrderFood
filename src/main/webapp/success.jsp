<%@page import="com.etc.entity.OrderDetail"%>
<%@page import="com.etc.entity.Order"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
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
	
	<script type="text/javascript">
		function lookdetail(){
			var oid = ${"#oid"}.val();
			alter("sdsdasdsd"+oid);
		}
	</script>
  </head>
  
  <body>
  	<tr>
  		<th>订单序号</th>
  		<th>订单时间</th>
  		<th>订单状态</th>
  		<th>顾客姓名</th>
  		<th>数量</th>
  		<th>价格</th>
  		<div id="msg"></div>
  	</tr><br>
  	<c:forEach items="${orders } " var="order">
  			<td id="oid">${order.oId }</td>
	 		<td>${order.oDate }</td>
	 		<td>${order.oState }</td>
	 		<td>${order.Customer.cName }</td>
	 		<td>${order.Nums }</td>	
	 		<td>${order.Prices }</td><br>
	 		<button value="查看详情" onclick="lookdetail()"></button>
  	</c:forEach>
  </body>
</html>
