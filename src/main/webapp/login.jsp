<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional/">
<html>
<head>
	

	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>登录</title>
	<link rel="stylesheet" href="<%=basePath%>css/login.css"/>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<!-- 注意，验证码本身是不需要 jquery 库，此处使用 jquery 仅为了在 demo 使用，减少代码量 -->
	<script src="http://apps.bdimg.com/libs/jquery/1.9.1/jquery.js"></script>
	
	<!-- 引入 gt.js，既可以使用其中提供的 initGeetest 初始化函数 -->
	<script src="js/gt.js"></script>
	<script type="text/javascript">
		
		var handler1 = function (captchaObj) {
        $("#button").click(function (e) {
        
        	var user = document.getElementById("user").value;
            var password = document.getElementById("password").value;
          	// var choose = document.getElementById("login").value;
            var choose = document.getElementsByName("login");
            
            var choose1;
            
            for(var i = 0 ; i<choose.length ; i++){
            if(choose[i].checked){
            choose1=choose[i].value;
       		}
       		}

            if(user==""||password=="")
            {
                alert("请输入完整的用户名和密码信息");
                return false;
            }
        
        
        
        
            var result = captchaObj.getValidate();
            if (!result) {
            	
                alert("请滑动图片完成拼图！！！( • ̀ω•́ )✧");
                setTimeout(function () {
                    $("#notice1").hide();
                }, 2000);}
                else{
            //alert("验证成功，登录异步刷新！！！");
            $.ajax({
					type:"GET",
					url:"customer/userLogin?user="+user+"&password="+password+"&choose="+choose1,
					contentType:"application/josn;charset=UTF-8",
					//data:JSON.stringify(cname),
					dataType : "json",
					success : function(json) {
						console.log(json);
						if(json.cAddress=="false"){
							alert("用户名或密码错误，请重新登录");
						}
						else if(json.cAddress=="ririri"){
							alert("身份一个都不选，您可真是睿智！！！！！");
						}
						else  document.getElementById("loginForm").submit();
					},
					error : function() {
						console.log("fail");
					}
				});
            }
            
                e.preventDefault();
        });
        // 将验证码加到id为captcha的元素里，同时会有三个input的值用于表单提交
        captchaObj.appendTo("#captcha1");
        captchaObj.onReady(function () {
            $("#wait1").hide();
        });
        // 更多接口参考：http://www.geetest.com/install/sections/idx-client-sdk.html
    };
    $.ajax({
        url: "gt/register1?t=" + (new Date()).getTime(), // 加随机数防止缓存
        type: "get",
        dataType: "json",
        success: function (data) {
            // 调用 initGeetest 初始化参数
            // 参数1：配置参数
            // 参数2：回调，回调的第一个参数验证码对象，之后可以使用它调用相应的接口
            initGeetest({
                gt: data.gt,
                challenge: data.challenge,
                new_captcha: data.new_captcha, // 用于宕机时表示是新验证码的宕机
                offline: !data.success, // 表示用户后台检测极验服务器是否宕机，一般不需要关注
                product: "float", // 产品形式，包括：float，popup
                width: "100%"
                // 更多配置参数请参见：http://www.geetest.com/install/sections/idx-client-sdk.html#config
            }, handler1);
        }
    });
	
	</script>
</head>
<body>
<div class="box1">
	<div class='box2'>
		<form id="loginForm" action="testsuccess" method="post">
			<div class='box3'>
				<ul>
					<li class=''>
						<input id='user' name="user" class='wh bord user' type="text" placeholder='请输入账号' >
					</li>
					<li class=''>
						<input id='password' name="password" class='wh bord' type="password" placeholder='填写密码' >
					</li>
					<li class=''>
						<label><input id="choose" name="login" type="radio" value="custom" /><p>用户登录</p> </label>
						<label><input id="choose1" name="login" type="radio" value="emp" /><p>员工登录</p> </label>
					</li>
					
					<li class=''>
						<a href='register.jsp'>欢迎注册</a><a  href='login.jsp' onClick="return confirm('请联系客服！');">忘记密码？</a>
					</li>
					<br>
					<div>
       					 <label>完成验证：</label>
      						  <div id="captcha1">
          					  <p id="wait1" class="show">正在加载验证码......</p>
        						</div>
   					</div>
   					
   					
   					<br>
					<li>
						<input id="button" class="but"  type="submit" value="">
					</li>
				</ul>
				
			</div>
			
		</form>
		
		
	</div>
	
	
</div>


</body>
</html>
