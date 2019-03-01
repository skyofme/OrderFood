<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional/">
<html>
	<head>
		<meta charset="UTF-8">
		<title>购物车</title>
		<base href="<%=basePath%>">
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<link rel="stylesheet" type="text/css" href="css/style1.css"/>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css"/>
		<link rel="stylesheet" type="text/css" href="css/base.css">
		<link rel="stylesheet" type="text/css" href="css/index1.css">
		<link rel="stylesheet" type="text/css"  href="css/shopping-car.css">
		
	</head>
	
	<body>
		<div class="clearfix nav">
			<a class="logo" href="javascript:;"></a>
			<ul class="clearfix nav-wrap">
				<li><a class="nav-item" href="index.jsp">首页</a></li>
				<li><a class="nav-item" href="pinpai.jsp">品牌故事</a></li>
				<li><a class="nav-item" id="menu"">美食系列</a></li>
				<li><a class="nav-item nav-active" href="shoppingcar/findsp/<%=request.getSession().getAttribute("user")%>">购物车</a></li>
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
		<ul class="breadnav clearfix"  style="font-size: 20px">
			<li class="bnav-item"><a href="index.html">首页</a></li>
			<li class="bnav-item">&lt;</li>
			<li class="bnav-item"><a href="shoppingCar.jsp">购物车</a></li>
		</ul>
		<div class="newslist-wrap">
			<p class="newslist-tit">购物车</p>
		<div id="table-div">
			<div class="w ">
				<div class="shopping-car-part">

					<form action="shoppingcar/topay/<%=request.getSession().getAttribute("user")%>" method="post">
						<div class="type clearfix">
							<ul>
								<li class="type-li01"><input id="all-check" type="checkbox">&nbsp;&nbsp;&nbsp;全选
								</li>
								<li class="type-li02">商品名称</li>
								<li class="type-li03">单价(:元)</li>
								<li class="type-li04">数量(:份)</li>
								<li class="type-li05">小计(:元)</li>
								<li class="type-li06">操作</li>
							</ul>
						</div>
						<h2 id="msg"  hidden="true">${msg }</h2>
						<div class="good">
							<table>
								 <c:forEach items="${s}" var="s">
									<tr class="tr-pos">
										<td class="td1">
											<input type="checkbox" class="single-checkbox">
											<input type="hidden" value="${s.menu.mId}" name="id1" disabled="disabled">
											<input type="hidden" value="${s.cus.cId}" name="id2" disabled="disabled">
										</td>
										<td class="td2"><a href="menu/findMeishiDetailByName/${s.menu.mName}"><img src="${s.menu.mPicture}"  style="width:70px; height:70px"></a></td>
										<td class="shopping-brand">${s.menu.mName}</td>
										<td class="td4">  <span>￥ <span > ${s.menu.mPrice}</span></span></td>
										<td class="td5">
											<div class="amount">
												<button type="button"  class="shopping-car-dec">-</button>
												<input type="text" class="shopping-car-input" value="${s.mCount}">
												<button type="button"  class="shopping-car-inc">+</button>
											</div>
											<input type="hidden" value="num" name="num1" disabled="disabled"  >
										</td>
										<td class="td6">
										<span>￥  <span><fmt:formatNumber  value="${s.menu.mPrice*s.mCount}" type="number"></fmt:formatNumber></span></span>
										</td>
										<td class="td7"><a href="shoppingcar/del/${s.sId}" onClick="return confirm('真的要删掉宝贝吗?');">删除</a></td>
									</tr>
								</c:forEach>
							</table>

							<div class="buy-buy-buy">
								<div class="buy-buy">
									<div class="shopping-car-amount">
										已选择&nbsp;&nbsp;<span>0</span>&nbsp;&nbsp;件商品
									</div>
									<div class="shopping-car-money">
										总价：&nbsp;&nbsp;￥<span id="checknum">0</span>
									</div>
									<button type="submit" class="shopping-car-buy" onclick="return checknum()">去结算</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			</div>
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
					<p>版权所有：贵族食代牛排有限公司</p>
					<p>ICP备案号：京ICP备16047255号-3本站信息由会员自主添加，如信息涉及隐私等，网站不承担任何责任！</p>
				</div>
			</div>
		</div>
		
	</body>

	<!--jq调用-->
	<script src="js/jquery-1.11.0.js" type="text/javascript"></script>
	<script src="js/shopping-car.js" type="text/javascript"></script>
	<script type="text/javascript">
			//加载caida
			$("#menu").click(function(){
				var jq=jQuery.noConflict();
				console.log("222222222222222222222");
				window.location.href="<%=basePath%>menu/findMeishi"
			})
			var a=$("#msg").text();
			if(a!=""){
			alert(a);
			}
			
			function checknum(){
				var b=$("#checknum").text();
				if(b==0){
				alert("您还没有勾选哦");
				return false;
				}
				return true;
			}  
	</script>
	

</html>
