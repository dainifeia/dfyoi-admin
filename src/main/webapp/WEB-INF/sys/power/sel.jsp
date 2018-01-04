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
		var setting = {check: {
			enable: true
		}};
		$(document).ready(function() {
			var l = layer.msg('正在加载数据', {
				  icon: 16,
				  shade: 0.5,
				  time: 0
				});
			$.post("<%=basePath%>sysPower/getList",{},function(zNodes){
				layer.close(l);
				$.fn.zTree.init($("#tree"), setting, eval(zNodes));
			})
		});
		function selPowerOk(e,treeId,treeNode){
            var treeObj=$.fn.zTree.getZTreeObj("tree");
            nodes=treeObj.getCheckedNodes(true);
            var arr = [];
            for(var i=0;i<nodes.length;i++){
	            arr.push(nodes[i].sym+"|"+nodes[i].name);
            }
            parent.selPowerOk(arr);
        }
	</script>
</body>
</html>