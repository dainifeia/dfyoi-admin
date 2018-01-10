<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Starter</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet"
	href="jslib/adminlte/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="jslib/adminlte/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="jslib/adminlte/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="jslib/adminlte/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
<link rel="stylesheet"
	href="jslib/adminlte/dist/css/skins/skin-blue.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="jslib/html5shiv/html5shiv.min.js"></script>
  <script src="jslib/respond/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="jslib/adminlte/bower_components/font-google/css.css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="skin-blue sidebar-mini sidebar-open">
	<div class="wrapper">

		<!-- Main Header -->
		<header class="main-header">

			<!-- Logo -->
			<a href="javascript:void(0)" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>初心</b></span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>不忘初心,方得始终</b></span>
			</a>

			<!-- Header Navbar -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="push-menu"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<!-- Navbar Right Menu -->
				<!-- <div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						Messages: style can be found in dropdown.less
						<li class="dropdown messages-menu">
							Menu toggle button <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="fa fa-envelope-o"></i> <span
								class="label label-success">4</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header">You have 4 messages</li>
								<li>
									inner menu: contains the messages
									<ul class="menu">
										<li>
											start message <a href="#">
												<div class="pull-left">
													User Image
													<img src="jslib/adminlte/dist/img/user2-160x160.jpg"
														class="img-circle" alt="User Image">
												</div> Message title and timestamp
												<h4>
													Support Team <small><i class="fa fa-clock-o"></i> 5
														mins</small>
												</h4> The message
												<p>Why not buy a new awesome theme?</p>
										</a>
										</li>
										end message
									</ul> /.menu
								</li>
								<li class="footer"><a href="#">See All Messages</a></li>
							</ul>
						</li>
						/.messages-menu

						Notifications Menu
						<li class="dropdown notifications-menu">
							Menu toggle button <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <span
								class="label label-warning">10</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header">You have 10 notifications</li>
								<li>
									Inner Menu: contains the notifications
									<ul class="menu">
										<li>
											start notification <a href="#"> <i
												class="fa fa-users text-aqua"></i> 5 new members joined
												today
										</a>
										</li>
										end notification
									</ul>
								</li>
								<li class="footer"><a href="#">View all</a></li>
							</ul>
						</li>
						Tasks Menu
						<li class="dropdown tasks-menu">
							Menu Toggle Button <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="fa fa-flag-o"></i> <span
								class="label label-danger">9</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header">You have 9 tasks</li>
								<li>
									Inner menu: contains the tasks
									<ul class="menu">
										<li>
											Task item <a href="#"> Task title and progress text
												<h3>
													Design some buttons <small class="pull-right">20%</small>
												</h3> The progress bar
												<div class="progress xs">
													Change the css width attribute to simulate progress
													<div class="progress-bar progress-bar-aqua"
														style="width: 20%" role="progressbar" aria-valuenow="20"
														aria-valuemin="0" aria-valuemax="100">
														<span class="sr-only">20% Complete</span>
													</div>
												</div>
										</a>
										</li>
										end task item
									</ul>
								</li>
								<li class="footer"><a href="#">View all tasks</a></li>
							</ul>
						</li>
						User Account Menu
						<li class="dropdown user user-menu">
							Menu Toggle Button <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> The user image in the navbar
								<img src="jslib/adminlte/dist/img/user2-160x160.jpg"
								class="user-image" alt="User Image"> hidden-xs hides the username on small devices so only the image appears.
								<span class="hidden-xs">Alexander Pierce</span>
						</a>
							<ul class="dropdown-menu">
								The user image in the menu
								<li class="user-header"><img
									src="jslib/adminlte/dist/img/user2-160x160.jpg"
									class="img-circle" alt="User Image">

									<p>
										Alexander Pierce - Web Developer <small>Member since
											Nov. 2012</small>
									</p></li>
								Menu Body
								<li class="user-body">
									<div class="row">
										<div class="col-xs-4 text-center">
											<a href="#">Followers</a>
										</div>
										<div class="col-xs-4 text-center">
											<a href="#">Sales</a>
										</div>
										<div class="col-xs-4 text-center">
											<a href="#">Friends</a>
										</div>
									</div> /.row
								</li>
								Menu Footer
								<li class="user-footer">
									<div class="pull-left">
										<a href="#" class="btn btn-default btn-flat">Profile</a>
									</div>
									<div class="pull-right">
										<a href="#" class="btn btn-default btn-flat">Sign out</a>
									</div>
								</li>
							</ul>
						</li>
						Control Sidebar Toggle Button
						<li><a href="#" data-toggle="control-sidebar"><i
								class="fa fa-gears"></i></a></li>
					</ul>
				</div> -->
				<div class="collapse navbar-collapse pull-left" id="navbar-collapse">
					<ul class="nav navbar-nav" id="ulNav">
					</ul>
				</div>
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav"> 
						<li><a id="nowTime"><span class="data">2017年12月19日</span>
								<span class="week">星期二</span> <span class="time">9:44:08</span></a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" aria-expanded="true"><i
								class="fa fa-user"></i>&nbsp;&nbsp;个人操作<span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu"
								style="border-color: darkgrey">
								<li><a href="javascript:onModifyPwd()">修改密码</a></li>
								<li><a href="Home/Logout">退出系统</a></li>
								<li class="divider" style="background-color: darkgrey"></li>
								<li><a href="javascript:onAboutUs()">关于我们</a></li>
							</ul></li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">

			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">

				<!-- Sidebar user panel (optional) -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="jslib/adminlte/dist/img/user2-160x160.jpg"
							class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>${d}</p>
						<a><i class="fa fa-circle text-success"></i>${p}</a>
					</div>
				</div>
				<!-- Sidebar Menu -->
				<ul class="sidebar-menu" data-widget="tree">

				</ul>
				<!-- /.sidebar-menu -->
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<iframe scrolling="no" frameborder="0"
				id="iframeCenter"></iframe>
			<!--
			<section class="content-header">
				<h1>
					Page Header <small>Optional description</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
					<li class="active">Here</li>
				</ol>
			</section>

			<section class="content container-fluid">

			</section>
			-->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<!-- 		<footer class="main-footer">
			<div class="pull-right hidden-xs">Anything you want</div>
			<strong>Copyright &copy; 2016 <a href="#">Company</a>.
			</strong> All rights reserved.
		</footer> -->

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li class="active"><a href="#control-sidebar-home-tab"
					data-toggle="tab"><i class="fa fa-home"></i></a></li>
				<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
						class="fa fa-gears"></i></a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane active" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:;"> <i
								class="menu-icon fa fa-birthday-cake bg-red"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

									<p>Will be 23 on April 24th</p>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

					<h3 class="control-sidebar-heading">Tasks Progress</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:;">
								<h4 class="control-sidebar-subheading">
									Custom Template Design <span class="pull-right-container">
										<span class="label label-danger pull-right">70%</span>
									</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger"
										style="width: 70%"></div>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

				</div>
				<!-- /.tab-pane -->
				<!-- Stats tab content -->
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
					Content</div>
				<!-- /.tab-pane -->
				<!-- Settings tab content -->
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Report panel
								usage <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Some information about this general settings option</p>
						</div>
						<!-- /.form-group -->
					</form>
				</div>
				<!-- /.tab-pane -->
			</div>
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
		<div id="aboutUs"
			style="display: none; padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">
			公司名称：北京XXXX软件发展有限公司 <br>官方网站：www.dfyoi.com <br>服务电话：400-500-6000
			<br>公司地址：北京市海淀区上地十街0号院1号楼1层101室

		</div>
		<div id="modifyPwd" style="margin-right: 30px; display: none">
			<form id="mainForm" class="form-horizontal"
				style="padding-right: 55px">
				<div class="box-body">
					<div class="form-group">
						<label for="oldPwd" class="col-sm-4 control-label">旧密码</label>

						<div class="col-sm-8">
							<input type="password" class="form-control" id="oldPwd"
								name="oldPwd" placeholder="请输入旧密码">
						</div>
					</div>
					<div class="form-group">
						<label for="newPwd" class="col-sm-4 control-label">新密码</label>

						<div class="col-sm-8">
							<input type="password" class="form-control" id="newPwd"
								name="newPwd" placeholder="请输入新密码">
						</div>
					</div>
					<div class="form-group">
						<label for="surePwd" class="col-sm-4 control-label">确认密码</label>
						<div class="col-sm-8">
							<input type="password" class="form-control" id="surePwd"
								name="surePwd" placeholder="请确认新密码">
						</div>
					</div>
				</div>
			</form>

		</div>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED JS SCRIPTS -->

	<!-- jQuery 3 -->
	<script src="jslib/jquery-3.2.1.min.js" type="text/javascript"></script>
	<!-- Bootstrap 3.3.7 -->
	<script
		src="jslib/adminlte/bower_components/bootstrap/dist/js/bootstrap.min.js"
		type="text/javascript"></script>

	<!-- AdminLTE App -->
	<script src="jslib/adminlte/dist/js/adminlte.min.js"
		type="text/javascript"></script>
	<script src="jslib/layer/layer.js"></script>
	<script src="locallib/comm.js" type="text/javascript"></script>

	<script type="text/javascript">
		//时间
		function date() {
			var d = new Date(), str = '';
			str += d.getFullYear() + '年'; //获取当前年份
			str += d.getMonth() + 1 + '月'; //获取当前月份（0——11）
			str += d.getDate() + '日';
			return str;
		}
		function week() {
			var arr = new Array("日", "一", "二", "三", "四", "五", "六");
			var week = new Date().getDay();
			return "星期" + arr[week];
		}

		function time() {
			var d = new Date();
			var hours = d.getHours();
			var minutes = d.getMinutes() > 9 ? d.getMinutes().toString() : '0'
					+ d.getMinutes();
			var seconds = d.getSeconds() > 9 ? d.getSeconds().toString() : '0'
					+ d.getSeconds();
			var str = hours + ':' + minutes + ':' + seconds;
			return str;
		}

		setInterval(function() {
			$("#nowTime").children(".data").html(date());
			$("#nowTime").children(".week").html(week());
			$("#nowTime").children(".time").html(time());
		}, 1000);
		$(function() {
			var height = $(document.body).height();
			var width = $(document.body).width();
			$("#iframeCenter").attr("height", height - 55).attr("width",
					"100%");
			if ("${layout}" == "LEFT") {
				$.post("Home/getMenu", {}, function(menu) {
					$('.sidebar-menu').sidebarMenu({
						data : $.parseJSON(menu),
						param : {
							strUser : 'admin'
						}
					});
				})
			} else if ("${layout}" == "TOP") {
				$.post("Home/getMenu", {}, function(menu) {
					$.each($.parseJSON(menu), function(index, item) {
						if (item.children && item.children.length > 0) {
							//有子节点
							var sym = item.id;
							menuJson[sym] = item.children;
							$("#ulNav")
									.append(
											"<li><a onclick=\"onSetChild('"
													+ item.id + "')\">"
													+ item.text + "</a></li>");
						} else {
							//没有子节点
							$("#ulNav").append(
									"<li><a onclick=\"addTabs({id:'" + item.id
											+ "',title:'" + item.text
											+ "',close:true,url:'" + item.url
											+ "'});\">" + item.text
											+ "</a></li>");
						}
					})

				})
			}
		})

		var menuJson = {};
		function onSetChild(sym) {
			$(".sidebar-menu").empty();
			$('.sidebar-menu').sidebarMenu({
				data : menuJson[sym],
				param : {
					strUser : 'admin'
				}
			});
		}

		function onAboutUs() {
			layer.open({
				type : 1,
				title : false //不显示标题栏
				,
				closeBtn : false,
				area : '380px;',
				shade : 0.8,
				id : 'LAY_AboutUs' //设定一个id，防止重复弹出
				,
				resize : false,
				btn : [ '确定' ],
				btnAlign : 'c',
				moveType : 1 //拖拽模式，0或者1
				,
				content : $('#aboutUs')

			});
		}
		function onModifyPwd() {
			layer.open({
				type : 1,
				title : "密码维护-${p}", //不显示标题栏
				closeBtn : false,
				area : '480px;',
				shade : 0.8,
				id : 'LAY_ModifyPwd', //设定一个id，防止重复弹出
				resize : false,
				btn : [ '修改', '取消' ],
				btnAlign : 'c',
				moveType : 1,//拖拽模式，0或者1
				content : $('#modifyPwd'),
				success : function(layero, index) {
					$("#oldPwd").focus();
				},
				btn1 : function(index, layero) {
					//修改按钮方法
					var oldPwd = $("#oldPwd").val();
					var newPwd = $("#newPwd").val();
					var surePwd = $("#surePwd").val();
					if (oldPwd == "") {
						layer.tips('请输入旧密码', '#oldPwd', {
							tips : [ 2, '#f39c12' ]
						});
						return;
					}
					if (newPwd == "") {
						layer.tips('请输入新密码', '#newPwd', {
							tips : [ 2, '#dd4b39' ]
						});
						return;
					}
					if (surePwd == "") {
						layer.tips('请确认密码', '#surePwd', {
							tips : [ 2, '#78BA32' ]
						});
						return;
					}
					if (!isPwd(newPwd)) {
						layer.msg("密码必须以字母开头，长度在6-12之间，只能包含字符、数字和下划线", {
							anim : 6
						});
						return;
					}
					if (newPwd != surePwd) {
						layer.msg("两次密码不一致", {
							anim : 6
						});
						return;
					}
					$.post("Home/ModifyPwd", {
						oldPwd : oldPwd,
						newPwd : newPwd
					}, function(result) {
						result = eval('(' + result + ')');
						if (result.success) {
							layer.alert("密码修改成功,请重新登录", {
								closeBtn : 0
							}, function() {
								window.location.assign("Home/Logout");
							});
						} else {
							layer.msg(result.msg);
						}
					})
				}
			});
		}
	</script>
</body>
</html>