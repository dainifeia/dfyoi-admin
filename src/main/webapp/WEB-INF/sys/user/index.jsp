<%@ page language="Java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>机构列表-页面</title>
<%@ include file="/WEB-INF/include/sys/head.jsp" %>
</head>
<body>
<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
		<ol class="breadcrumb" style="margin-bottom:0"> 
			<li><a style="text-decoration: none;"> <i class="fa fa-dashboard"></i>&nbsp;&nbsp;系统管理</a></li>
			<li class="active">用户管理</li>
		</ol>
		</section>

		<!-- Main content -->
		<section class="content container-fluid">
			
	<div style="padding: 5px; text-align: left" class="form-inline">
		<div class="form-group">
			<label for="personName">姓名</label> <input class="form-control input-sm enterIndex" id="personName" name="personName" placeholder="请输入人员姓名" type="text">
		</div>
		<div class="form-group">
			<label for="userName">用户名</label> <input class="form-control input-sm enterIndex" id="userName" name="userName" placeholder="请输入用户名" type="text">
		</div>
		<div class="form-group">
			<button type="button" class="btn btn-primary"
				onclick="onSearch()">查询</button>
			<button type="button" class="btn btn-primary"
				onclick="onShowAll()">显示全部</button>
			<button type="button" class="btn btn-primary"
				onclick="onSave(0)">添加用户</button>
		</div>
	</div>
	<div class="row" style="margin:0 0;" id="divDept">
		<div class="col-md-2" style="border:1px solid #ddd;padding:0;height:100%">
		<div style="padding:5px 3px;border-bottom:1px solid #ddd;font-size:15px;font-weight:bold;background-color:#ecf0f5">&nbsp;<i class="fa fa-server"></i>&nbsp;机构列表</div>
		<ul id="tree" class="ztree"></ul>
		</div>
		<div class="col-md-10">
			<table id="grid"  class="jqgrid"></table>
			<div id="gridPager"></div>
		</div>
	</div>
		</section>
		<!-- /.content -->
	</div>
	<script type="text/javascript">
	var deptId=0;
		function onSave(id)
		{
			window.location.href="<%=basePath%>sysUser/save?id="+id;
		}
		function onRemove(id)
		{
			layer.confirm('确定要删除吗？', {
				  btn: ['确定','取消'] //按钮
				}, function(){
				  //提交方法
				  var postData = {id:id};
				  $.post("<%=basePath%>sysUser/remove", postData, function(data) {
						var r= eval('('+data+')');
						layer.msg(r.msg);
						if(r.success==true)
						{
							reloadGrid();
						}
				  });
				}); 
		}
		function onResetPwd(id)
		{
			layer.confirm('重置后密码将设为(123456),重置后请及时登录系统修改自己的密码？', {
				  btn: ['确定','取消'] //按钮
				}, function(){
				  //提交方法
				  var postData = {id:id};
				  $.post("sysUser/ResetPwd", postData, function(data) {
						var r= eval('('+data+')');
						layer.msg(r.msg); 
						if(r.success==true)
						{
							reloadGrid();
						}
				  });
				}); 
		}
		
		function onClick(event, treeId, treeNode, clickFlag) {
			deptId=treeNode.sym;
			reloadGrid();
		}	
		function onSearch()
		{
			reloadGrid();
		}
		function onShowAll()
		{
			deptId=0;
			$("#personName").val("");
			$("#userName").val("");
			reloadGrid();
		}
		var setting = {callback:{onClick :onClick}};
		$(function() {
			$("#divDept").height(window.top.$("#iframeCenter").height());
			$.post("<%=basePath%>sysDept/getList",{},function(zNodes){
				
				$.fn.zTree.init($("#tree"), setting, eval(zNodes));
			})
			$("#grid").jqGrid(
							{
								url : '<%=basePath%>sysUser/listPara',
								styleUI : 'Bootstrap',//设置jqgrid的全局样式为bootstrap样式 
								colModel : [
										{
											label : '姓名',
											name : 'personName',
											width : 150
										},
										{
											label : '用户名',
											name : 'userName',
											width : 75
										},
										{
											label : '角色',
											name : 'roleName',
											width : 100
										},{
											label : '单位',
											name : 'deptName',
											width : 100
										},
										{
											label : '操作',
											name : 'id',
											width : 60,
											key : true,
											align: 'center',
											formatter: gridOperat
											
										}],
										height : window.top.$("#iframeCenter").height()-170,
										rownumbers:true,
							            autowidth:true,
										viewrecords: true,
										rowNum:20,
										mtype: 'POST',   
										width:"100%",
										datatype : "json",
										pager: "#gridPager"
			});
		});
		function gridOperat(value, options, row){
	    	var html="<a style=\"margin:0 2px\" href=\"javascript:onSave("+value+")\" title=\"\">修改</a>";
	    	html+="<a style=\"margin:0 2px\" href=\"javascript:onRemove("+value+")\" title=\"\">删除</a>";
	    	html+="<a style=\"margin:0 2px\" href=\"javascript:onResetPwd("+value+")\" title=\"\">重置密码</a>";
	        return html;
	    }
		function reloadGrid()
		{
			var queryData={
				"deptId":deptId,
				"userName":$("#userName").val(),
				"personName":$("#personName").val()
			};
			$("#grid").jqGrid('setGridParam',{ 
                url:'<%=basePath%>sysUser/listPara',
				treedatatype : 'json',
				postData: queryData
			}).trigger("reloadGrid");
		}
		function saveCallBack() {
			layer.closeAll();
			reloadGrid();
		}
	</script>
</body>
</html>