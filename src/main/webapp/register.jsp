<%@ 
page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.etc.Util.MailUtil"%>
<%

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional/>
<html>
<head>
<base href="<%=basePath%>">

<title>注册</title><meta charset="UTF-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="css/register.css" />

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
  	function registCheck(){
  		var c_name = document.getElementById("c_name").value;
  		var c_pswd = document.getElementById("c_pswd").value;
  		var tc_pswd = document.getElementById("c_pswd2").value;
		var c_phone = document.getElementById("c_phone").value;
		var tEmail = document.getElementById("tEmail").value;


  		obj = document.getElementsByName("Read");
    	check_val = [];
    	for(k in obj){
        	if(obj[k].checked)
            	check_val.push(obj[k].value);
    	}

 		if(c_name==""||c_pswd==""||tc_pswd==""){
 			alert("请输入完整信息");
 			return false;
 		} else if (c_pswd != tc_pswd) {
 			alert("两次密码输入不一致");
 			return false;
 		} else if (c_pswd.length>16) {
 			alert("密码只能设置为8-16位！！");
 			return false;
 		}else if (c_pswd.length<8) {
 			alert("密码只能设置为8-16位！！");
 			return false;
 		}else if (c_name.length>11) {
 			alert("账号名长度不能大于11位！！");
 			return false;
 		}
 		
 		else if (c_phone.length <11 ) {
 			alert("输入手机号码有误！！！");
 			return false;
 		}else if (c_phone.length >11 ) {
 			alert("输入手机号码有误！！！");
 			return false;
 		}else if (parseInt(c_phone)!=c_phone) {
 			alert("输入手机号码有误！！！");
 			return false;
 		}else if(check_val!="read"){
 			alert("您未勾选《用户注册协议哟~》");
 			return false;
 		}
 		
 		//console.log(c_name);
 		
 		$.ajax({
				type:"GET",
				url:"customer/userTest?c_name="+c_name+"&tEmail="+tEmail,
				contentType:"application/josn;charset=UTF-8",
				//data:JSON.stringify(cname),
				dataType : "json",
				success : function(json) {//success就是回调函数，解析数据就是这
					console.log(json);
					if (json.cAddress=="true") {
						alert("账号已经被注册！！请重新输入！");
					}
					else if (json.cEmail=="true") {
						alert("邮箱验证码输入有误！请重新输入！");
					}
					else{ 
						document.getElementById("registForm").submit();
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
	function sendEmail() {
	
		var emailname =document.getElementById("c_email").value;
		
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

</head>

<body>
<div class='box5'>
    <a href=""><div id='div1'></div></a>
    <div class='box6'>欢迎注册</div>
    <div class='box7'>已有账号？ <a href="login.jsp">请登录</a></div>
    </div>
	<div class='box1'>
		<div class='box2'>
			<form id="registForm" action = "customer/registerCustomer" method = "post">
				<div class='box3' >
				<ul>
				 <li class=''>						
				   <input id='c_name' class='wh bord user' type="text"   placeholder='用户名' name="cName" onblur="checkUserName()" >
				   <span id="nameInfo" style="color: red;" ></span>
				 </li>
                 
				 <li class=''>
				   <input id='c_pswd' class='wh bord' type="password" placeholder='填写密码' name="cPswd" onblur="checkPassword()">
				   <span id="passwordInfo" style="color: red;"></span>
				 </li>
				
				 <li class=''>
				   <input id='c_pswd2' class='wh bord tu' type="password" placeholder='确定密码' name="Tc_pswd" onblur="checkRepassword()">
				   <span id="repasswordInfo" style="color: red;"></span>
				 </li>
				 
				 <li class=''>
				   <input id='c_phone' class='wh bord tel' type="text" placeholder='手机号' name="cPhone" onblur="checkTel()">
				   <span id="telInfo" style="color: red;"></span>
				 </li>
				 
				 <li class=''>
				   <input id='c_email' class='wh bord tel' type="text" placeholder='邮箱地址' name="cEmail" onblur="checkEmail()">
				   <span id="telInfo" style="color: red;"></span>
				 </li>
				 
				 <li class=''>
				   <button onclick="return sendEmail()">发送邮箱验证码</button>请输入邮箱验证码：<input id="tEmail" type="number" >
				   <span id="telInfo" style="color: red;"></span>
				 </li>
				  <li class=''>
				   <input id='c_address' class='wh bord addr' type="text" placeholder='居住地址' name="cAddress" onblur="checkAddr()">
				   <span id="addrInfo" style="color: red;"></span>
				 </li>	
				 
				 
				 <ul  >
                 <li style="float: left"  >
                  
                 </li>
                 <li style="float: left">
                  
                 </li>
                 <li style="float: left">
                   
                 </li>
                  
                 </ul>                
				 <li class='' text-decoration="none;" style="margin-top: 15px;margin-left: 10px;">
				 
					   <input id='checkbox' type="checkbox" value='read' name="Read"><p>阅读并同意</p>
					   <a href="#" >《用户注册协议》</a><a href="#" >《隐私政策》</a>
				 </li>	
				 
				 <li>
				 <input id='button' class='but' name="Butt" type='button' onclick="registCheck()">
				 </li>
				</ul>
				</div>
			</form>
		</div>
	</div>
</div>
<script src="js/rejs/jquery.js" type="text/javascript"></script>
<script src="js/rejs/sitedata_bas.js" type="text/javascript"></script>
<script src="js/rejs/register.js" type="text/javascript"></script>
<script src="js/rejs/regis.js" type="text/javascript"></script>
</body>
</html>
