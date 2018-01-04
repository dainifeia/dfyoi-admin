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
			<li class="active">角色管理</li>
		</ol>
		</section>

		<!-- Main content -->
		<section class="content container-fluid">
			<div style="padding: 5px; text-align: left" class="form-inline">
		<div class="form-group">
			<label for="roleName">角色名称</label> <input class="form-control input-sm enterIndex" id="roleName" name="roleName" placeholder="请输入角色名称" type="text">
		</div>
		<div class="form-group">
			<label for="roleSym">角色代码</label> <input class="form-control input-sm enterIndex" id="roleSym" name="roleSym" placeholder="请输入角色代码" type="text">
		</div>
		<div class="form-group">
			<button type="button" class="btn btn-primary"
				onclick="onSearch()">查询</button>
				<button type="button" class="btn btn-primary"
				onclick="onShowAll()">显示全部</button>
			<button type="button" class="btn btn-primary"
				onclick="onSave(0,'Parent',0,0)">添加角色</button>
		</div>
	</div>
	<div>
		<table id="grid"  class="jqgrid"></table>
		<div id="gridPager"></div>
	</div>
		</section>
		<!-- /.content -->
	</div>
	
	<script type="text/javascript">
		function onShowAll(){
			$("#roleName").val("");
			$("#roleSym").val("");
			reloadGrid();
		}
		function onSearch()
		{
			reloadGrid();
		}
		function onSave(id)
		{
			layer.open({
				  title:"角色信息保存",
				  type: 2,
				  area: ["768px", "380px"],
				  content: "<%=basePath%>sysRole/save?id="+id
			}); 
		}
		function onRemove(id,orderNumber)
		{
			layer.confirm('确定要删除吗？', {
				  btn: ['确定','取消'] //按钮
				}, function(){
				  //提交方法
				  var postData = {id:id,orderNumber:orderNumber};
				  $.post("<%=basePath%>sysRole/remove", postData, function(data) {
						var r= eval('('+data+')');
						layer.msg(r.msg);
						if(r.success==true)
						{
							reloadGrid();
						}
				  });
				});
		}
		function onMove(id,opType)
		{
			var postData = {id:id,opType:opType};
			
			$.post("<%=basePath%>sysRole/move", postData, function(data) {
			var r= eval('('+data+')');
			layer.msg(r.msg);
			if(r.success==true)
			{
				reloadGrid();
			}
	  	});
			
		}
		function onSetPower(id){
			window.location.href="<%=basePath%>sysRole/setPower?id="+id;
		}
		$(function() {
			$("#grid").jqGrid(
							{
								url : '<%=basePath%>sysRole/listPara',
								styleUI : 'Bootstrap',//设置jqgrid的全局样式为bootstrap样式 
								colModel : [
										{
											label : '角色名称',
											name : 'name',
											width : 150
										},
										{
											label : '角色代码',
											name : 'sym',
											width : 75
										},
										{
											label : '备注',
											name : 'descr',
											width : 100
										},{
											label : 'orderNumber',
											name : 'orderNumber',
											hidden:true
										},
										{
											label : '操作',
											name : 'id',
											width : 80,
											key : true,
											align: 'center',
											formatter: gridOperat
											
										}],
										height : window.top.$("#iframeCenter").height()-170,
										width:"100%",
										rownumbers:true,
							            autowidth:true,
										viewrecords: true,
										rowNum:20,
										sortname : 'orderNumber',
								        sortorder : "asc",
										mtype: 'POST',   
										datatype : "json",
										pager: "#gridPager"
			});
		});
		function gridOperat(value, options, row){
	    	var html="<a style=\"margin:0 2px\" href=\"javascript:onSave("+value+")\" title=\"\">修改</a>";
	    	html+="<a style=\"margin:0 2px\" href=\"javascript:onRemove("+value+","+row.orderNumber+")\" title=\"\">删除</a>";
	    	html+="<a style=\"margin:0 2px\" href=\"javascript:onMove("+value+",'MoveUp')\" title=\"\">上移</a>";
	    	html+="<a style=\"margin:0 2px\" href=\"javascript:onMove("+value+",'MoveDown')\" title=\"\">下移</a>";
	    	html+="<a style=\"margin:0 2px\" href=\"javascript:onSetPower("+value+")\" title=\"\">权限配置</a>";
	        return html;
	    }
		function reloadGrid()
		{
			var queryData={
					"roleName":$("#roleName").val(),
					"roleSym":$("#roleSym").val()
			};
			$("#grid").jqGrid('setGridParam',{ 
                url:'<%=basePath%>sysRole/listPara',
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