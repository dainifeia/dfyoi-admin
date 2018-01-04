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
			<li class="active">功能权限管理</li>
		</ol>
		</section>

		<!-- Main content -->
		<section class="content container-fluid">
			<div style="padding: 3px; text-align: right">
				<ol style="top:0;display:inline-block;list-style: none;float:right;position:absolute;right:0;margin:3px 0">
	        		<li style="float:left;margin:0 3px"><button type="button" class="btn btn-primary"
				onclick="onSave(0,'Parent',0,0)">添加功能</button></li>
	      		</ol>
			</div>
	<div>
		<table id="treeGrid"  class="jqgrid"></table>
	</div>
		</section>
		<!-- /.content -->
	</div>
	<script type="text/javascript">
		var iframeWin,layerIcon;
		function selIcon()
		{
			layerIcon=layer.open({
				  title:"图标选择",
				  type: 2,
				  area: ["999px", "500px"],
				  content: "<%=basePath%>Home/SelIcon"
			});
		}
		function onSave(id,opType,rgt,slevel,exid)
		{
			$("#treeGrid").jqGrid('setSelection',exid);
			$(".jqgrid").attr("data-exid",exid);
			layer.open({
				  id:"ifrmSavePower",
				  title:"功能信息保存",
				  type: 2,
				  area: ["768px", "450px"],
				  content: "<%=basePath%>sysPower/save?id="+id+"&opType="+opType+"&srgt="+rgt+"&slevel="+slevel,
				  success: function(layero, index){
					    var body = layer.getChildFrame('body', index);
					    iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
					  }
			}); 
		}
		function onRemove(id,lft,rgt)
		{
			$("#treeGrid").jqGrid('setSelection',id);
			$("#treeGrid").attr("data-exid",id);
			layer.confirm('确定要删除吗(包含所属功能)？', {
				  btn: ['确定','取消'] //按钮
				}, function(){
				  //提交方法
				  var postData = {id:id,lft:lft,rgt:rgt};
				  $.post("<%=basePath%>sysPower/remove", postData, function(data) {
						var r= eval('('+data+')');
						layer.msg(r.msg);
						if(r.success==true)
						{
							reloadTree();
						}
				  });
				});
		}
		function onMove(id,opType)
		{
			$("#treeGrid").jqGrid('setSelection',id);
			$(".jqgrid").attr("data-exid",id);
			var postData = {id:id,opType:opType};
			
			$.post("<%=basePath%>sysPower/move", postData, function(data) {
			var r= eval('('+data+')');
			layer.msg(r.msg);
			if(r.success==true)
			{
				reloadTree();
			}
	  	});
			
		}
		$(function() {
			$("#treeGrid").jqGrid(
							{
								url : '<%=basePath%>sysPower/listAll',
								styleUI : 'Bootstrap',//设置jqgrid的全局样式为bootstrap样式 
								colModel : [
										{
											label : '名称',
											name : 'name',
											width : 45
										},
										{
											label : '代码',
											name : 'sym',
											width : 75
										},
										{
											label : '类型',
											name : 'powerType',
											width : 100,
											formatter:function(value, options, row){
												if(value=="1")
												{
													return "操作";
												}else{
													return "菜单";
												}
											}
										},
										{
											label : '打开方式',
											name : 'openType',
											width : 100,
											formatter:function(value, options, row){
												if(value=="1")
												{
													return "新窗口";
												}else{
													return "框架内";
												}
											}
										},
										{
											label : '操作',
											name : 'id',
											width : 80,
											key : true,
											align: 'center',
											formatter: gridOperat
											
										}],
								height : window.top.$("#iframeCenter").height()-90,
								mtype: 'POST',
								treeGridModel:"nested",
								loadonce:true,
								treeGrid: true, 
								width:"100%",
								ExpandColumn:"name",
								autowidth : true,
								pager: "false",   
								gridComplete : treeExpand,
								ExpandColClick : true,
								datatype : "json"
			});
		});
		function gridOperat(value, options, row){
	    	var html="<a style=\"margin:0 2px\" href=\"javascript:onSave("+value+",'',0,0,"+value+")\" title=\"\">修改</a>";
	    	html+="<a style=\"margin:0 2px\" href=\"javascript:onRemove("+value+","+row.lft+","+row.rgt+")\" title=\"\">删除</a>";
	    	/* html+="<a style=\"margin:0 2px\" href=\"javascript:onSave("+value+")\" title=\"\">添加同级</a>"; */
	    	html+="<a style=\"margin:0 2px\" href=\"javascript:onSave(0,'Child',"+row.rgt+","+row.level+","+value+")\" title=\"\">添加下级</a>";
	    	html+="<a style=\"margin:0 2px\" href=\"javascript:onMove("+value+",'MoveUp')\" title=\"\">上移</a>";
	    	html+="<a style=\"margin:0 2px\" href=\"javascript:onMove("+value+",'MoveDown')\" title=\"\">下移</a>";
	        return html;
	    }
		function reloadTree()
		{
			$("#treeGrid").jqGrid('setGridParam',{ 
                url:'<%=basePath%>sysPower/listAll',
				treedatatype : 'json'
			}).trigger("reloadGrid");
			//$("#treeGrid").trigger("reloadGrid");
		}
		function saveCallBack() {
			layer.closeAll();
			reloadTree();
		}
		function selIconCallBack(icon)
		{
			iframeWin.selIconOk(icon);
			layer.close(layerIcon);
		}
	</script>
</body>
</html>

