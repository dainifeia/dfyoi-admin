<%@ page language="Java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>登陆</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="locallib/login/css/layout.css" rel="stylesheet" />
 
<link href="locallib/login/css/login.css" rel="stylesheet" />
<script src="jslib/jquery-3.2.1.min.js"
	type="text/javascript"></script>
<script src="jslib/layer/layer.js"
		type="text/javascript"></script>
<script type="text/javascript">
	function onLogin()
	{
		var u = $("#u").val();
		var p = $("#p").val();
		if(u==""||p=="")
		{
			layer.msg("请输入用户名密码");
			return;
		}
		var l = layer.msg('正在登录,请等待...', {
			  icon: 16,
			  shade: 0.5,
			  time: 0
			});
	$.post("Home/Login",{u:u,p:p},function(data){
		var r = eval('('+data+')');
		layer.close(l);
		if(r.success==true)
		{
			window.location.href="<%=basePath%>Home/WorkPlate";
		}else{
			layer.msg(r.msg);
		}
	})	
	}
	//回车事件绑定
        document.onkeydown = function (event) {
        var e = event || window.event;
        if (e && e.keyCode == 13) { //回车键的键值为13
            onLogin();
        }
    }; 
</script>
</head>
<body class="login-bg"  onload="document.getElementById('u').focus()">
	<div class="main ">
		<!--登录-->
		<div class="login-dom login-max">
			<div class="logo text-center">
				</a>
			</div>
			<div class="login container " id="login"> 
				<p class="text-center" style="font-size:28px;color:white">SSM通用后台管理系统</p>
				<br>
				<p class="text-center margin-small-top logo-color text-small">
					DFYOI-ADMIN</p>
				<form class="login-form" method="get" autocomplete="off">
					<div class="login-box border text-small" id="box">
						<div class="name border-bottom">
							<input type="text" placeholder="请输入账号/手机号/邮箱" id="u"
								name="u" datatype="*" nullmsg="请填写帐号信息" />
						</div>
						<div class="pwd">
							<input type="password" placeholder="请输入您的密码" datatype="*"
								id="p" name="p" nullmsg="请填写帐号密码" />
						</div>
					</div>
					<input type="button" onclick="onLogin()" class="btn text-center login-btn" value="立即登录" />
				</form>
				<!-- <div class="forget">

					<a href="#" class="forget-pwd text-small fl"> 忘记登录密码？</a><a
						href="#" class="forget-new text-small fr" id="forget-new">注册账号</a>
				</div> -->
			</div>
		</div>
		
		<div class="footer text-center text-small ie">
			Copyright 2017-2018 版权所有 ©shenhui_email@163.com <a href="#"
				target="_blank">邯ICP备16024545号-1</a>
		</div>
	</div>
</body>
</html>