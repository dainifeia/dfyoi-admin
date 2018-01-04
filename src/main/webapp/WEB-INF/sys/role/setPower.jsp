<%@ page language="Java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>权限选择-页面</title>
<%@ include file="/WEB-INF/include/sys/head.jsp" %>
</head>
<body>
<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
		<ol class="breadcrumb" style="margin-bottom:0"> 
			<li><a style="text-decoration: none;"> <i class="fa fa-dashboard"></i>&nbsp;&nbsp;系统管理/&nbsp;&nbsp;/&nbsp;&nbsp;角色管理&nbsp;&nbsp;/&nbsp;&nbsp;权限配置</a></li>
			<li class="active">选择权限</li>
		</ol>
		</section>

		<!-- Main content -->
		<section class="content container-fluid">
			<div class="content">
		<!-- Content Header (Page header) -->
		<section class="content-header">
		<h2>
			${m.name}<small>&nbsp;-&nbsp;权限配置</small>
		</h2> 
		<ol style="top:0;display:inline-block;list-style: none;float:right;position:absolute;right:0;margin:3px 0">
        <li style="float:left;margin:0 3px"><button type="button" class="btn btn-block btn-primary" onclick="onSetPower()">选择</button></li>
        <li style="float:left;margin:0 3px"><button type="button" class="btn btn-block btn-primary" onclick="onSave()">保存</button></li>
        <li style="float:left;margin:0 3px"><button type="button" class="btn btn-block btn-primary" onclick="onBack()">返回</button></li>
      </ol>
	</section>
		
	<div style="margin:15px 15px" id="divPower">
		<c:forEach var="item" items="${list}" varStatus="status">
			<div id="div${item.powerSym}" data-sym="${item.powerSym}" data-name="${item.powerName}" class="btn-group power"><button type="button" class="btn btn-default">${item.powerName}</button><button onclick="removePower('${item.powerSym}')" class="btn btn-default" type="button" style="margin-right:3px">&times;</button></div>
		</c:forEach>
	</div>
	</div>
		</section>
		<!-- /.content -->
	</div>
	
	<script type="text/javascript">
	function onSetPower()
	{
		layer.open({
			  title:"权限选择",
			  type: 2,
			  area: ["328px", "480px"],
			  btn: ['确认', '取消'],
			  btnAlign: 'c',
			  moveType: 1, //拖拽模式，0或者1
			  content: "<%=basePath%>sysPower/sel",
			  success: function(layero){
				    var btn = layero.find('.layui-layer-btn');
				    btn.find('.layui-layer-btn0').on("click",function(){
				    	var form = $(layero).find("iframe")[0].contentWindow;
				    	form.selPowerOk();
				    })
				  }
		}); 
	}
	function onBack(){
		window.history.go(-1);
	}
	
	function selPowerOk(arr)
	{
		$("#divPower").html("");
		for(var i=0;i<arr.length;i++)
		{
			var str = arr[i];
			var strarr = str.split('|');
			$("#divPower").append("<div id=\"div"+strarr[0]+"\" data-sym=\""+strarr[0]+"\" data-name=\""+strarr[1]+"\" class=\"btn-group power\"><button type=\"button\" class=\"btn btn-default\">"+strarr[1]+"</button><button onclick=\"removePower('"+strarr[0]+"')\" class=\"btn btn-default\" type=\"button\" style=\"margin-right:3px\">&times;</button></div>");	
		}
	}
	function removePower(sym){
		$("#div"+sym).remove();
	}
	function onSave(){
		var l = layer.msg('正在提交数据', {
			  icon: 16,
			  shade: 0.5,
			  time: 0
			});
		//获取所有的节点信息
		var symStr="";
		var nameStr="";
		
		$(".power").each(function(){
			var sym = $(this).attr("data-sym");
			var name = $(this).attr("data-name");
			symStr+=sym + "|";
			nameStr+=name + "|";
		})
		$.post("sysRole/setPower",{roleSym:"${m.sym}",roleName:"${m.name}",symStr:symStr,nameStr:nameStr},function(data){
			var r= eval('('+data+')');
			layer.close(l);
			if(r.success==true)
			{
				 window.history.go(-1);
			}else{
				layer.msg(r.msg);
			}
		})
	}
	</script>
</body>
</html>