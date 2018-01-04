<%@ page language="Java" contentType="text/html; charset=UTF-8"
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
<title>AdminLTE 2 | Dashboard</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="jslib/AdminLTE/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="jslib/AdminLTE/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="jslib/AdminLTE/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="jslib/AdminLTE/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="jslib/AdminLTE/dist/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="jslib/AdminLTE/min/css/supershopui.common.min.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

<style type="text/css">
.sidebar-menu .active>a>.fa-angle-left, .sidebar-menu .active>a>.pull-right-container>.fa-angle-left
	{
	-webkit-transform: rotate(-90deg); */
	-ms-transform: rotate(-90deg);
	-o-transform: rotate(-90deg);
	/* transform: rotate(-90deg); */
}
</style>
</head>
<body class="sidebar-mini skin-blue-light">
	<div>
		<header class="main-header">
			<!-- Logo -->
			<a class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>初心</b></span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>不忘初心,方得始终</b></span>
			</a>

			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a class="sidebar-toggle" role="button"> <span class="sr-only">Toggle
						navigation</span>
				</a>
				<div class="collapse navbar-collapse pull-left" id="navbar-collapse">
					<ul class="nav navbar-nav" id="ulNav">
					</ul>
				</div>
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" aria-expanded="true"><i
								class="fa fa-user"></i>&nbsp;&nbsp;个人操作<span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu"
								style="border-color: darkgrey">
								<li><a href="#">修改密码</a></li>
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
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="jslib/AdminLTE/dist/img/user2-160x160.jpg"
							class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>${d}</p>
						<a><i class="fa fa-circle text-success"></i>${p}</a>
					</div>
				</div>

				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<div class="content-tabs">
				<button class="roll-nav roll-left tabLeft" onclick="scrollTabLeft()">
					<i class="fa fa-backward"></i>
				</button>
				<nav class="page-tabs menuTabs tab-ui-menu" id="tab-menu">
					<div class="page-tabs-content" style="margin-left: 0px;">
						<a href="javascript:void(0);" id="tab_tab_10008"
							data-id="tab_10008" class="menu_tab active">欢迎页</a>
					</div>
				</nav>
				<button class="roll-nav roll-right tabRight"
					onclick="scrollTabRight()">
					<i class="fa fa-forward" style="margin-left: 3px;"></i>
				</button>
				<div class="btn-group roll-nav roll-right">
					<button class="dropdown tabClose" data-toggle="dropdown">
						页签操作<i class="fa fa-caret-down" style="padding-left: 3px;"></i>
					</button>
					<ul class="dropdown-menu dropdown-menu-right"
						style="min-width: 128px;">
						<li><a class="tabReload" href="javascript:refreshTab();">刷新当前</a></li>
						<li><a class="tabCloseCurrent"
							href="javascript:closeCurrentTab();">关闭当前</a></li>
						<li><a class="tabCloseAll"
							href="javascript:closeOtherTabs(true);">全部关闭</a></li>
						<li><a class="tabCloseOther"
							href="javascript:closeOtherTabs();">除此之外全部关闭</a></li>
					</ul>
				</div>
				<button class="roll-nav roll-right fullscreen">
					<i class="fa fa-arrows-alt"></i>
				</button>
			</div>
			<div class="content-iframe " style="background-color: #ffffff;">
				<div class="tab-content " id="tab-content" style="">
					<div role="tabpanel" class="tab-pane active" id="tab_10008">
						<iframe src="" width="100%" height="100%" frameborder="no"
							border="0" marginwidth="0" marginheight="0" scrolling="yes"
							allowtransparency="yes" id="iframe_tab_10008" class="tab_iframe"
							style="height: 261px; width: 100%;"></iframe>
					</div>
				</div>
			</div>
		</div>
		<!-- /.content-wrapper -->
		<!-- <footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 2.4.0
			</div>
			<strong>Copyright &copy; 2014-2016 <a
				href="https://adminlte.io">Almsaeed Studio</a>.
			</strong> All rights reserved.
		</footer> -->
		<div id="aboutUs"
			style="display: none; padding: 20px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">
			公司名称：北京盛世政通软件发展有限公司
			<br>官方网站：www.bjsszt.cn
			<br>服务电话：400-900-5886
			<br>公司地址：北京市海淀区上地十街1号院6号楼4层449室
			
		</div>
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 3 -->
	<script src="jslib/AdminLTE/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script
		src="jslib/AdminLTE/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script
		src="jslib/AdminLTE/bower_components/fastclick/lib/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="jslib/AdminLTE/min/js/supershopui.common.js"></script>

	<script src="jslib/layer/layer.js"></script>
	<script type="text/javascript">
	function onAboutUs()
	{
		layer.open({
			  type: 1
			  ,title: false //不显示标题栏
			  ,closeBtn: false
			  ,area: '380px;'
			  ,shade: 0.8
			  ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
			  ,resize: false
			  ,btn: ['确定']
			  ,btnAlign: 'c'
			  ,moveType: 1 //拖拽模式，0或者1
			  ,content: $('#aboutUs')
			  
			});
	}
    $(function() {
        $(".sidebar-toggle").click(function() {
        	if($("body").hasClass("sidebar-collapse")){
        		$("body").removeClass("sidebar-collapse");
        	}else{
        		$("body").addClass("sidebar-collapse");
        	}
        });
        addTabs(({ id: '10008', title: '欢迎页', close: false, url: '../admin/dashboard.html' }));
        App.fixIframeCotent();
			if("${layout}"=="LEFT"){
				$.post("Home/getMenu", {}, function(menu) {
					$('.sidebar-menu').sidebarMenu({
						data : $.parseJSON(menu),
						param : {
							strUser : 'admin'
						}
					});
				})
	        }else if("${layout}"=="TOP"){
	        	$.post("Home/getMenu",{},function(menu){
	            	$.each($.parseJSON(menu),function(index,item){
	            		if (item.children && item.children.length > 0) {
	            			//有子节点
	            			var sym = item.id;
	            			menuJson[sym]=item.children;
	            			$("#ulNav").append("<li><a onclick=\"onSetChild('"+item.id+"')\">"+item.text+"</a></li>");
	            		}else{
	            			//没有子节点
	            			$("#ulNav").append("<li><a onclick=\"addTabs({id:'" + item.id + "',title:'" + item.text + "',close:true,url:'" + item.url + "'});\">"+item.text+"</a></li>");
	            		}
	            	})
	            	
	            })
	        }
		});
    var menuJson={};
    function onSetChild(sym)
    {
    	$('.sidebar-menu').sidebarMenu({ data: menuJson[sym], param: { strUser: 'admin' } });
    }
	</script>

</body>
</html>