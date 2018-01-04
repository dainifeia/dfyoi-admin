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
<title>选择权限</title>
<%@ include file="/WEB-INF/include/sys/head.jsp" %>
</head>
<body>
	<ul id="tree" class="ztree"></ul>
	<script type="text/javascript">
		var setting = {callback:{onClick :onClick}};
		$(document).ready(function() {
			var l = layer.msg('正在加载数据', {
				  icon: 16,
				  shade: 0.5,
				  time: 0
				});
			$.post("<%=basePath%>sysDept/getList",{},function(zNodes){
				layer.close(l);
				$.fn.zTree.init($("#tree"), setting, eval(zNodes));
			})
		});
		function onClick(event, treeId, treeNode, clickFlag) {
			parent.selDeptCallBack(treeNode.sym,treeNode.name);
		}	
	</script>
</body>
</html>