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
<title>AdminLTE</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="jslib/AdminLTE/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="jslib/AdminLTE/dist/css/AdminLTE.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="jslib/AdminLTE/bower_components/font-awesome/css/font-awesome.min.css">
<link href="<%=basePath%>jslib/ZTree/css/zTreeStyle/zTreeStyle.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="jslib/AdminLTE/dist/css/skins/_all-skins.min.css">
<script src="<%=basePath%>jslib/jquery-3.2.1.min.js"
	type="text/javascript"></script>
<style type="text/css">
.ztree * {
	font-size: 10pt;
	font-family: "Microsoft Yahei", Verdana, Simsun, "Segoe UI Web Light",
		"Segoe UI Light", "Segoe UI Web Regular", "Segoe UI",
		"Segoe UI Symbol", "Helvetica Neue", Arial
}

.ztree li ul {
	margin: 0;
	padding: 0
}

.ztree li {
	line-height: 30px;
}

.ztree li a {
	/* width: 200px; */
	height: 30px;
	padding-top: 0px;
}

.ztree li a:hover {
	text-decoration: none;
	background-color: #E7E7E7;
	width: 100%;
}

.ztree li a span.button.switch {
	visibility: hidden
}

.ztree.showIcon li a span.button.switch {
	visibility: visible
}

.ztree li a.curSelectedNode {
	background-color: #D4D4D4;
	border: 0;
	height: 30px;
	width: 100%;
}

.ztree li span {
	line-height: 30px;
}

.ztree li span.button {
	margin-top: -7px;
}

.ztree li span.button.switch {
	width: 16px;
	height: 16px;
}

.ztree li a.level0 span {
	font-size: 150%;
	font-weight: bold;
}

.ztree li span.button {
	background-image: url("jslib/ZTree/left_menuForOutLook.png");
	*background-image: url("jslib/ZTree/left_menuForOutLook.gif")
}

.ztree li span.button.switch.level0 {
	width: 20px;
	height: 20px
}

.ztree li span.button.switch.level1 {
	width: 20px;
	height: 20px
}

.ztree li span.button.noline_open {
	background-position: 0 0;
}

.ztree li span.button.noline_close {
	background-position: -18px 0;
}

.ztree li span.button.noline_open.level0 {
	background-position: 0 -18px;
}

.ztree li span.button.noline_close.level0 {
	background-position: -18px -18px;
}
</style>
</head>
<body class="skin-blue-light">
	<header class="main-header"> <nav
		class="navbar navbar-static-top" style="margin-left:0px"> <a
		class="logo" style="width: auto"> <span class="logo-lg">北京盛世政通软件发展有限公司-文件管理系统</span>
	</a> <!-- <div class="navbar-custom-menu">
		<ul class="nav navbar-nav">
			<li><a style="height: 50px"><i
					class="glyphicon glyphicon-search"></i></a></li>
			<li><a style="height: 50px"><i
					class="glyphicon glyphicon-th-list"></i></a></li>
			<li><a style="height: 50px"><i
					class="glyphicon glyphicon-option-vertical"></i></a></li>
		</ul>
	</div> --> </nav> </header>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3"
				style="background: #fafafa; border-right: 1px solid #eee; height: 100%">
				<div id="treeFolder" class="ztree" style="width: 100%"></div>
			</div>
			<div class="col-sm-9" style="height: 100%">
				<table class="table" style="border: 1px solid #eee;">
					<caption>
						<div style="padding: 5px; text-align: left" class="form-inline">
							<div class="form-group">
								<label for="roleName">名称</label> <input
									class="form-control input-sm enterIndex" id="roleName"
									name="roleName" placeholder="请输入文件或文件夹名称" type="text"
									style="width: 500px">
							</div>
							<div class="form-group">
								<button type="button" class="btn btn-primary"
									onclick="onSearch()">查询</button>
								<button type="button" class="btn btn-primary"
									onclick="onSave(0,'Parent',0,0)">新建文件夹</button>
								<button type="button" class="btn btn-primary"
									onclick="onSave(0,'Parent',0,0)">上传文件</button>
							</div>
						</div>
					</caption>
					<thead>
						<tr>
							<th><a style="color: #2196f3">#</a></th>
							<th><a style="color: #2196f3">名称</a></th>
							<th><a style="color: #2196f3">创建日期</a></th>
							<th><a style="color: #2196f3">文件大小</a></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>Larry</td>
							<td>the Bird</td>
							<td>@twitter</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- Bootstrap 3.3.7 -->
	<script
		src="jslib/AdminLTE/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script
		src="jslib/AdminLTE/bower_components/fastclick/lib/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="jslib/AdminLTE/dist/js/adminlte.min.js"></script>
	<script
		src="jslib/AdminLTE/bower_components/bootstrap-treeview/js/bootstrap-treeview.js"></script>
	<script src="jslib/ZTree/js/jquery.ztree.core.js"></script>
	<script src="jslib/layer/layer.js"></script>
	<script type="text/javascript">
		var curMenu = null, zTree_Menu = null;
		var pid=0;
		var setting = {
			view : {
				showLine : false,
				showIcon : false,
				selectedMulti : false,
				dblClickExpand : false,
				addDiyDom : addDiyDom
			},
			data : {
				simpleData : {
					enable : false
				}
			},
			callback : {
				onClick :onClick
			}
		};
		function onClick(event, treeId, treeNode, clickFlag) {
			pid = treeNode.sym;
		}
		function beforeClick(treeId, treeNode) {
			if (treeNode.level == 0) {
				var zTree = $.fn.zTree.getZTreeObj("treeFolder");
				zTree.expandNode(treeNode);
				
				return false;
			}
			return true;
		}
		function addDiyDom(treeId, treeNode) {
			var spaceWidth = 5;
			var switchObj = $("#" + treeNode.tId + "_switch"), icoObj = $("#"
					+ treeNode.tId + "_ico");
			switchObj.remove();
			icoObj.before(switchObj);

			if (treeNode.level > 1) {
				var spaceStr = "<span style='display: inline-block;width:"
						+ (spaceWidth * treeNode.level) + "px'></span>";
				switchObj.before(spaceStr);
			}
		}
		
		$(function() {
			var treeObj = $("#treeFolder");
			$.post("<%=basePath%>sysFile/getList",{},function(zNodes){
				$.fn.zTree.init(treeObj, setting, eval(zNodes));
				zTree_Menu = $.fn.zTree.getZTreeObj("treeFolder");
				curMenu = zTree_Menu.getNodes()[0].children[0];
				zTree_Menu.selectNode(curMenu);
				treeObj.addClass("showIcon");
			})
		})
		//添加一级信息
		function onSave(id,opType,srgt,slevel)
		{
			layer.prompt({title: '请输入文件夹名称',},function(val, index){

			layer.close(index);
			//提交到后台新建文件夹
			//异步提交数据
			var formData={title:val,flag:1,id:0,pid:pid};
			$.post("<%=basePath%>sysFile/save", formData, function(data) {
					var r= eval('('+data+')');
					if(r.success==true)
					{
						parent.saveCallBack();
					}else{
						layer.alert(r.msg);
					}
				})
			});
		}
	</script>
</body>
</html>