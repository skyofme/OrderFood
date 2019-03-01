<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional/">
<html>
<head>
	<base href="<%=basePath%>">
	<title>收银台</title>
	<meta charset="UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/common.css"/>
	<link rel="stylesheet" type="text/css" href="css/style1.css"/>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css"/>
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/index1.css">
	<link rel="stylesheet" type="text/css"  href="css/pay.css">
	<script type="text/javascript">
        function loginCheck(loginState){
            if( loginState!=null){
                return true;
            }
            else{
                alert("您还未登录哟");
                return false;
            }
        }

	</script>
</head>

<body>
<div class="w" style="width: 1510px;">
	<div class="pay-part">
		<div class="clearfix nav" style="width: 1380px;">
			<a class="logo" href="javascript:;"></a>
			<ul class="clearfix nav-wrap">
				<li><a class="nav-item" href="index.jsp">首页</a></li>
				<li><a class="nav-item" href="pinpai.jsp">品牌故事</a></li>
				<li><a class="nav-item" href="meishi.jsp">美食系列</a></li>
				<li><a class="nav-item" href="shoppingcar/findsp/<%=request.getSession().getAttribute("user")%>">购物车</a></li>
				<li><a class="nav-item nav-active" >收银台</a></li>
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
		<ul class="breadnav clearfix">
			<li class="bnav-item"><a href="index.jsp">首页</a></li>
			<li class="bnav-item">&lt;</li>
			<li class="bnav-item"><a href="shoppingCar.html">收银台</a></li>
		</ul>
		<br>
		<div class="confirm">
			<div class="good-pay-inf">
				<h1>确认订单信息</h1>

				<table>
					<tr>
					<td>商品</td>
					<td>价格(:元)</td>
					<td>数量(:份)</td>
					<td>小计(:元)</td>
					</tr>
					<c:forEach items="${myorder}" var="order">
					<tr>

						<td>${order.menu.mName }</td>
						<td>${order.menu.mPrice}</td>
						<td>${order.mCount }</td>
						<td><fmt:formatNumber  value="${(order.menu.mPrice)*(order.mCount)}" type="CURRENCY"></fmt:formatNumber></td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>

		<span class="buy-span1">需付款: <i><fmt:formatNumber  value="${totalprice}" type="CURRENCY"></fmt:formatNumber></i></span>
		
		<a href="shoppingcar/findsp/<%=request.getSession().getAttribute("user")%>" onClick="return confirm('确定不买了吗?');" style="width:300px;height:50px;display:inline-block; float:right; "><span class="buy-span4" style="width:200px;height:50px;margin-right:-400px">取消</span></a>
		<a href="alipay/goAlipay/${totalprice}/${oid}" onclick="return loginCheck('${name}');" style="width:300px;height:100px;display:inline-block; float:right;"><span class="buy-span4" style="width:200px;height:50px;margin-right:-400px">确认购买</span></a>
	</div>
</div>
<!--jq调用-->
	<script src="js/jquery-1.11.0.js" type="text/javascript"></script>
	<script type="text/javascript">
	
	</script>

</div>
</body>
</html>
