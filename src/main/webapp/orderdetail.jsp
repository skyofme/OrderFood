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

		<meta charset="UTF-8">
		<title>我的订单</title>
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<link rel="stylesheet" type="text/css" href="css/style1.css"/>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css"/>
	</head>
  
  <body>
    <div class="clearfix nav">
		<a class="logo" href="javascript:;"></a>
		<ul class="clearfix nav-wrap" style="height:78px">
			<li><a class="nav-item" href="index.jsp">首页</a></li>
			<li><a class="nav-item" href="pinpai.jsp">品牌故事</a></li>
			<li><a class="nav-item" id="menu">美食系列</a></li>
			<li><a class="nav-item" href="shoppingcar/findsp/<%=request.getSession().getAttribute("user")%>">购物车</a></li>
			<li><a class="nav-item nav-active" href="showSelfOrder">我的订单</a></li>
				<c:if test="${!empty user}">
        		<li><a title="点我进入个人中心" href="customer/showme" style="font-color:yellow"><%=request.getSession().getAttribute("name") %></a></li>
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
			<li class="bnav-item">&lt;</li>
			<li class="bnav-item"><a href="myOrder.jsp">我的订单详情</a></li>
		</ul>
	<div class="newslist-wrap">
			<p class="newslist-tit">我的订单详情</p>
    <!--  -->
     <div class="w">
         <div class="check-deal">       
              <table align="center" border="0.5" class="table table-striped" style="width: 796px; ">
					<tr>
						<th></th>
						<th></th>
						<th  align="center">订单详情序号</th>
						
						<th  align="center">菜单</th>
						<th  align="center">订购数量</th>
					</tr>
					<c:forEach items="${orderDetail}" var="orderDetail">
						<tr>
						<th></th>
						<th></th>
						<td>${orderDetail.odId}</td>
					
						<td><a href="menu/findMeishiDetailByName/${orderDetail.menu.mName}">${orderDetail.menu.mName}</a></td>
						<td>${orderDetail.mCount}</td>
					</tr>
					</c:forEach>
				</table>
				<br>
				<br>
              <table align="right" class="table table-striped" style="width: 296px; margin-right:550px;border:5px;" >  
                <tr style="background-color: BEEDC7"> 
               	 <th></th>
				 <th></th>      
                 <th >菜品总和</th>
                 <th >订单总价</th>   
                </tr>
                  
       			<tr style="background-color: D6D5B7">
       			 <td></td>
				 <td></td>
         		<td class="center">${userOrder.nums}</td>
        		<td class="center">${userOrder.prices}</td>
       			</tr>
      			
              </table>
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
					<p>版权所有：贵族食代牛排有限公司  来源:<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
					<p>ICP备案号：京ICP备16047255号-3本站信息由会员自主添加，如信息涉及隐私等，网站不承担任何责任！</p>
				</div>
			</div>
		</div>
		</div>
  </body>
 
</html>
