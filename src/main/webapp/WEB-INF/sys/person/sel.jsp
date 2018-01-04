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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>人员选择-页面</title>
<%@ include file="/WEB-INF/include/sys/head.jsp" %>
</head>
<body>
<div class="content-wrapper">
		<!-- Main content -->
		<section class="content container-fluid">
			
	<div style="padding: 5px; text-align: right">
		<button type="button" class="btn btn-primary"
			onclick="onShowAll()">显示全部</button>
	</div>
	<div class="row" style="margin:0 0;height:500px">
		<div class="col-md-2" style="border:1px solid #ddd;padding:0;height:100%">
		<ul id="tree" class="ztree"></ul>
		</div>
		<div class="col-md-10">
			<table id="grid"></table>
			<div id="gridPager"></div>
		</div>
	</div>
		</section>
		<!-- /.content -->
	</div>
	<script type="text/javascript">
		var deptId=0;
		function onClick(event, treeId, treeNode, clickFlag) {
			deptId=treeNode.sym;
			reloadGrid();
		}	
		function onShowAll()
		{
			deptId=0;
			reloadGrid();
		}
		var setting = {callback:{onClick :onClick}};
		$(function() {
			$.post("<%=basePath%>sysDept/getList",{},function(zNodes){
				
				$.fn.zTree.init($("#tree"), setting, eval(zNodes));
			})
			$("#grid").jqGrid(
							{
								url : '<%=basePath%>sysPerson/listPara',
								styleUI : 'Bootstrap',//设置jqgrid的全局样式为bootstrap样式 
								colModel : [
										{
											label : '姓名',
											name : 'name',
											width : 150
										},
										{
											label : '性别',
											name : 'sex',
											width : 75,
											formatter:function(value, options, row){
												if(value=="1")
												{
													return "男";
												}else{
													return "女";
												}
											}
										},
										{
											label : '身份证号',
											name : 'idCard',
											width : 100
										},{
											label : '单位',
											name : 'deptName',
											width : 100
										},{
											label : '单位ID',
											name : 'deptId',
											hidden:true
										},
										{
											label : '操作',
											name : 'id',
											width : 60,
											key : true,
											align: 'center',
											formatter: gridOperat
											
										}],
										rownumbers:true,
							            autowidth:true,
										viewrecords: true,
										rowNum:20,
								height : "380",
								mtype: 'POST',   
								datatype : "json",
								pager: "#gridPager"
			});
		});
		function gridOperat(value, options, row){
	    	var html="<a style=\"margin:0 2px\" href=\"javascript:onSel('"+row.id+"','"+row.name+"','"+row.deptId+"','"+row.deptName+"')\" title=\"\">选择</a>";
	        return html;
	    }
		function onSel(personId,personName,deptId,deptName)
		{
			parent.selPersonCallBack(personId,personName,deptId,deptName);
		}
		function reloadGrid()
		{
			var queryData={
				"deptId":deptId
			};
			$("#grid").jqGrid('setGridParam',{ 
                url:'<%=basePath%>sysPerson/listPara',
				treedatatype : 'json',
				postData: queryData
			}).trigger("reloadGrid");
		}
	</script>
</body>
</html>