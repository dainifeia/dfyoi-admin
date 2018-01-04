<%@ page language="Java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title>机构保存-页面</title>
<%@ include file="/WEB-INF/include/sys/head.jsp" %>
</head>
<body>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
		<ol class="breadcrumb" style="margin-bottom:0"> 
			<li><a style="text-decoration: none;"> <i class="fa fa-dashboard"></i>&nbsp;&nbsp;系统管理&nbsp;&nbsp;/&nbsp;&nbsp;用户管理</a></li>
			<li class="active">用户添加|修改</li>
		</ol>
		</section>

		<!-- Main content -->
		<section class="content container-fluid">
		<br/>
	<form id="mainForm" class="form-horizontal" style="padding-right: 55px">
		<input type="hidden" value="${m.id}" id="id" name="id" /> <input
			type="hidden" value="${m.deptId}" id="deptId" name="deptId" /> <input
			type="hidden" value="${m.roleSym}" id="roleSym" name="roleSym" /> <input
			type="hidden" value="${m.roleName}" id="roleName" name="roleName" /> <input
			type="hidden" value="${m.personId}" id="personId" name="personId" />
		<div class="box-body">
			<div class="form-group">
				<label for="personName" class="col-sm-2 control-label">姓名</label>
				<div class="col-sm-4">
					<div class="input-group">
						<input type="text" class="form-control" id="personName"
							name="personName" value="${m.personName}" placeholder="请选择人员"  readonly="readonly" />
						<span class="input-group-addon" onclick="onSelPerson()"><i
							class="fa fa-search"></i></span>
					</div>
				</div>
				<label for="deptName" class="col-sm-2 control-label">机构</label>

				<div class="col-sm-4">
				<input type="text" class="form-control" id="deptName" name="deptName"
						value="${m.deptName}" placeholder="请输入所属机构" readonly="readonly" />
				</div>
			</div>
			<div class="form-group">
				<label for="userName" class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="userName"
						name="userName" value="${m.userName}" placeholder="请输入用户名" />
				</div>
				<label for="userPwd" class="col-sm-2 control-label">密码</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="userPwd"
						name="userPwd" value="${m.userPwd}" placeholder="请输入密码" />
				</div>
			</div>
			<div class="form-group">
				<label for="selRole" class="col-sm-2 control-label">角色</label>
				<div class="col-sm-4">
					<select id="selRole" class="form-control">
						<c:forEach var="item" items="${role}" varStatus="status">
							<option value="${item.sym}">${item.name}</option>
						</c:forEach>
					</select>
				</div>
				<label for="stts" class="col-sm-2 control-label">状态</label>
				<div class="col-sm-4">
					<select class="form-control" id="stts" name="stts">
						<option value="0" selected="selected">启用</option>
						<option value="1">禁用</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="descr">备注</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="descr" name="descr" rows=5>${m.descr}</textarea>
				</div>
			</div>
		</div>
	</form>
	<div class="form-group controls" style="text-align: center">
		<button type="button" class="btn pad32 btn-primary btn-flat"
			onclick="onSave()">保存</button>
		&nbsp;&nbsp;
		<button type="button" class="btn pad32 btn-default btn-flat"
			onclick="onCancel()">取消</button>
	</div>
	</section>
	</div>
	<script type="text/javascript">
		$(function(){
			if("${m.id}"!="")
			{
				$("#selRole").val("${m.roleSym}");
				$("#stts").val("${m.stts}");
			}
		})
		function onSelPerson()
		{
			var layerIcon=layer.open({
				  title:"人员选择",
				  type: 2,
				  area: ["99%", "99%"],
				  content: "<%=basePath%>sysPerson/sel"
			});
		}
		function selPersonCallBack(personId,personName,deptId,deptName)
		{
			$("#personId").val(personId);
			$("#personName").val(personName);
			$("#deptId").val(deptId);
			$("#deptName").val(deptName);
			layer.closeAll();
		}
		function onCancel() {
			window.history.go(-1);
		}
		//异步提交保存信息
		function onSave()
		{
			var name = $("#name").val();
			if(name=="")
			{
				layer.msg("请选择人员", {
					  offset: 't',
					  anim: 6
					});
				return;
			}
			
			var userName = $("#userName").val();
			if(userName=="")
			{
				layer.msg("请输入用户名", {
					  offset: 't',
					  anim: 6
					});
				return;
			}
			var userPwd = $("#userPwd").val();
			if(!isPwd(userPwd))
			{
				layer.msg("密码必须以字母开头，长度在6-12之间，只能包含字符、数字和下划线", {
					  offset: 't',
					  anim: 6
				});
				return;
			}
			$("#roleSym").val($("#selRole").val());
			$("#roleName").val($("#selRole").find("option:selected").text());
			var formData = $("#mainForm").serializeArray();
			//异步提交数据
			$.post("<%=basePath%>sysUser/save", formData, function(data) {
				var r = eval('(' + data + ')');
				if (r.success == true) {
					window.history.go(-1);
				} else {
					layer.alert(r.msg);
				}
			})
		}
	</script>
</body>
</html>