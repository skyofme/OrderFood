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
  	function updateCheck(){
  		
  		var cPswd = document.getElementById("cPswd").value;
  		var tcPswd = document.getElementById("tcPswd").value;
  		var cPhone = document.getElementById("cPhone").value;
		

		
 		if(cPswd==""||tcPswd==""){
 			alert("请输入完整信息");
 			return false;
 		} else if (cPswd != tcPswd) {
 			alert("两次密码输入不一致");
 			return false;
 		}else if (cPswd.length>16) {
 			alert("密码只能设置为8-16位！！");
 			return false;
 		}else if (cPswd.length<8) {
 			alert("密码只能设置为8-16位！！");
 			return false;
 		}else if (cPhone.length <11 ) {
 			alert("输入手机号码有误！！！");
 			return false;
 		}else if (cPhone.length >11 ) {
 			alert("输入手机号码有误！！！");
 			return false;
 		}else if (parseInt(cPhone)!=cPhone) {
 			alert("输入手机号码有误！！！");
 			return false;
 		}
 		else {
 			alert("信息已修改，请重新登录！");
 			document.getElementById("updateForm").submit();
 		}
		return false;
	}
</script>
<link href="css/showmessid.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body style="margin-top:200px">
	<div class="elelment">
	<h2>个人中心</h2>
	<div class="element-main" align="center" >
		
		<table  align="center" border="4" >
			<form id="updateForm" align="center" border="4" action="emp/updateEmp" method="post">
			<tr><td>新密码：</td><td><input type="password" id="cPswd" name="ePswd"></td></tr>
			<tr><td>确认密码：</td><td><input type="password" id="tcPswd" name="tePswd" value="请确认密码"></td></tr>
			<tr><td>电话号码:</td><td><input type="number" id="cPhone" name="ePhone"value="${emp.ePhone}"></td></tr>
			<tr><td align="center" colspan="2"><input type="submit" value="确认" onclick="return updateCheck()"></td></tr>
			</form>
		</table>
	</div>
</div>
<div class="copy-right">
			<p>© 2018 Personal Center. All rights reserved | Template by  <a href="http://localhost:8080/OrderFood/login.jsp" target="_blank">  OrderFood </a></p>
</div>
	
</body>


</html>