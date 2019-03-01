<%@page import="com.etc.entity.OrderDetail"%>
<%@page import="com.etc.entity.Order"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	function update(ele,oid){
		$.ajax({
			url:"order/updateOrderState",
			type:"post",
			data:{
				"oid" : oid
			},
			datatype:"json",
			success:function(){
				alert("修改成功");
				window.location.reload();
			}
		});
	
	
	}

	</script>
  </head>
  
  <body>
  	<table>
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
	 		<td><a href="javascript:void(0)" onclick="update(this,${order.oId })" id="btn">修改</a></td>
	 		</tr>
  		</c:forEach>
  	</table>
  </body>
</html>
