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
<link href="jslib/superui/content/ui/css/login.css" rel="stylesheet"/>
</head>
<body class="login-bg">
    <div class="main ">
        <!--登录-->
        <div class="login-dom login-max">
            <div class="logo text-center">
                <a href="#">
                    <img src="content/ui/img/logo.png" width="180px" height="180px" />
                </a>
            </div>
            <div class="login container " id="login">
                <p class="text-big text-center logo-color">
                    同一个账号，连接一切
                </p>

                <p class="text-center margin-small-top logo-color text-small">
                  SuperUI框架
                </p>
                <form class="login-form" action="/admin/index_iframe.html" method="get" autocomplete="off">
                    <div class="login-box border text-small" id="box">
                        <div class="name border-bottom">
                            <input type="text" placeholder="手机/邮箱/账号（随便填）" id="username" name="username" datatype="*" nullmsg="请填写帐号信息" />
                        </div>
                        <div class="pwd">
                            <input type="password" placeholder="密码（随便填）" datatype="*" id="password" name="password" nullmsg="请填写帐号密码" />
                        </div>
                    </div>
                    <input type="submit" class="btn text-center login-btn" value="立即登录" />
                </form>
                <div class="forget">
                   
                    <a href="#" class="forget-pwd text-small fl"> 忘记登录密码？</a><a href="#" class="forget-new text-small fr" id="forget-new">注册账号</a>
                </div>
            </div>
        </div>
        <div class="footer text-center text-small ie">
            Copyright 2013-2016 版权所有 ©tzhsweet 2015-2018      <a href="#" target="_blank">粤ICP备16024545号-1</a>
            <span class="margin-left margin-right">|</span>
            <script src="#" language="JavaScript"></script>
        </div>
        <div class="popupDom">
            <div class="popup text-default">
            </div>
        </div>
    </div>
</body>
</html>