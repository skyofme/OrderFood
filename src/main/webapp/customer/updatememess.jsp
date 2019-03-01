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
<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css"/>
<script type="text/javascript">
	function sendEmail() {
	
		var emailname =document.getElementById("cEmail").value;
		
		$.ajax({
				type:"GET",
				url:"customer/emailTest?emailname="+emailname,
				contentType:"application/josn;charset=UTF-8",
				//data:JSON.stringify(cname),
				dataType : "json",
				success : function(json) {//success就是回调函数，解析数据就是这
					
					if (json.cEmail=="false") {
						alert("邮件发送失败！！请输入正确的邮箱地址！");
					}
					if (json.cEmail=="true") {
						alert("邮件发送成功！！请到邮箱查看！");
					}
					
					
				},
				error : function() {
					console.log("fail");
				}
			});
		return false;
	}
</script>
<script type="text/javascript">
  	function updateCheck(){
  		
  		var cPswd = document.getElementById("cPswd").value;
  		var tcPswd = document.getElementById("tcPswd").value;
  		var cPhone = document.getElementById("cPhone").value;
		var cEmail = document.getElementById("cEmail").value;
		var tEmailTest = document.getElementById("tEmailTest").value;

		
 		if(cPswd==""||tcPswd==""||cEmail==""||tEmailTest==""){
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
 		}
 		else if (cPhone.length <11 ) {
 			alert("输入手机号码有误！！！");
 			return false;
 		}else if (cPhone.length >11 ) {
 			alert("输入手机号码有误！！！");
 			return false;
 		}else if (parseInt(cPhone)!=cPhone) {
 			alert("输入手机号码有误！！！");
 			return false;
 		}
 		$.ajax({
				type:"GET",
				url:"customer/emailTestYanzheng?tEmailTest="+tEmailTest,
				contentType:"application/josn;charset=UTF-8",
				//data:JSON.stringify(cname),
				dataType : "json",
				success : function(json) {//success就是回调函数，解析数据就是这
					
					if (json.cEmail=="true") {
						alert("邮箱验证码输入有误！请重新输入！");
					}
					else{ 
						alert("信息已修改，请重新登录！！( • ̀ω•́ )✧");
						document.getElementById("updateForm").submit();
					}
				},
				error : function() {
					console.log("fail");
				}
			});

		return false;
	}
</script>
<link href="css/showmessid.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body style="margin-top:200px">
	<div class="elelment">
	<h2>个人中心</h2>
	<div class="element-main" align="center" >
		<table  align="center" border="4" class="table table-striped">
			<form id="updateForm" align="center" border="4" action="customer/updateCustomer" method="post">
			<tr><td>新密码：</td><td><input type="password" id="cPswd" name="cPswd"></td></tr>
			<tr><td>确认密码：</td><td><input type="password" id="tcPswd" name="tcPswd" value="请确认密码"></td></tr>
			<tr><td>电话号码:</td><td><input type="number" id="cPhone" name="cPhone"value="${cus.cPhone}"></td></tr>
			<tr><td>邮箱地址:</td><td><input type="text" id="cEmail" name="cEmail" value="${cus.cEmail}"></td></tr>
			<tr><td><button onclick="return sendEmail()">发送验证码:</button></td><td><input type="number" id="tEmailTest" name="tEmailTest" value="输入收到的验证码"></td></tr>
			<tr><td>送餐地址:</td><td><input type="text" id="cAddress" name="cAddress" value="${cus.cAddress}"></td></tr>
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