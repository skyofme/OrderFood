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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>个人中心</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function updateMess() {
		var tpswd = prompt("在这里输入您的密码才可以更改您的信息哦( • ̀ω•́ )✧","请输入密码");
		//var pswd =  document.getElementById("pswd").getAttribute("value");
		
		if(${employee.ePswd}!=tpswd){
			alert("密码错误");
			return false;
		}else{
			
			//转发请求，并将customer对象传递过去
			window.location.href="emp/updatememess.jsp";
	
			return true;
			}
					
	}
</script>
<link href="css/showmessid.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body style="margin-top:200px">
	<div class="elelment">
	<h2>个人中心</h2>
	<div class="element-main" align="center" >
		
	<% request.getSession().setAttribute("emp", request.getAttribute("employee"));
	 %>
	<table align="center" border="4">
		<tr>
			<td>员工账号名:</td><td id="eName">${employee.eName}</td>
		</tr><tr>
			<td>员工电话号码:</td><td id="ePhone">${employee.ePhone}</td>
		</tr><tr>
			<td>员工身份:</td><td id="role">${employee.role.rRole}</td>
		</tr><tr>
			<td>操作:</td><td ><button onclick="return updateMess()" >修改密码</button></td>
		</tr>
	</table>
	</div>
</div>
<div class="copy-right">
			<p>© 2018 Personal Center. All rights reserved | Template by  <a href="http://localhost:8080/OrderFood/login.jsp" target="_blank">  OrderFood </a></p>
</div>
	
</body>
</html>