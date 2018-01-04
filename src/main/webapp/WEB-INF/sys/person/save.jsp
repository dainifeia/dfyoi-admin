<%@ page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title>人员保存-页面</title>
<%@ include file="/WEB-INF/include/sys/head.jsp" %>
</head>
<body>
<br/>
	<form id="mainForm" class="form-horizontal" style="padding-right: 55px">
		<input type="hidden" value="${m.deptId}" id="deptId" name="deptId" />
		<input type="hidden" value="${m.id}" id="id" name="id" /> <input
			type="hidden" value="${m.post}" id="post" name="post" />
		<div class="box-body">
			<div class="form-group">
				<label for="name" class="col-sm-2 control-label">姓名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="name" name="name"
						value="${m.name}" placeholder="请输入姓名,不可为空">
				</div>
				<label for="deptName" class="col-sm-2 control-label">机构</label>

				<div class="col-sm-4">
					<div class="input-group">
						<input type="text" class="form-control" id="deptName"
							name="deptName" value="${m.deptName}" placeholder="请选择机构" readonly="readonly">
						<span class="input-group-addon" onclick="onSelIcon()"><i
							class="fa fa-search"></i></span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="sex" class="col-sm-2 control-label">性别</label>
				<div class="col-sm-4">
					<select class="form-control" id="sex" name="sex">
						<option value="1" selected="selected">男</option>
						<option value="0">女</option>
					</select>
				</div>
				<label for="dob" class="col-sm-2 control-label">出生日期</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="dob" name="dob"
						value="<fmt:formatDate value="${m.dob}" pattern="yyyy-MM-dd"/>" placeholder="请选择出生日期">
				</div>
			</div>
			<div class="form-group">
				<label for="educational" class="col-sm-2 control-label">学历</label>
				<div class="col-sm-4">
					<select class="form-control" id="educational" name="educational">
						<option value="高中及以下" selected="selected">高中及以下</option>
						<option value="专科">专科</option>
						<option value="本科">本科</option>
						<option value="硕士">硕士</option>
						<option value="博士">博士</option>
						<option value="博士后">博士后</option>
					</select>
				</div>
				<label for="nation" class="col-sm-2 control-label">职务</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="nation" name="nation"
						value="${m.nation}" placeholder="请输入职务">
				</div>
			</div>
			<div class="form-group">
				<label for="mobile" class="col-sm-2 control-label">手机</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="mobile" name="mobile"
						value="${m.mobile}" placeholder="请输入手机号码">
				</div>
				<label for="idCard" class="col-sm-2 control-label">身份证号</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="idCard" name="idCard"
						value="${m.idCard}" placeholder="请输入身份证号码">
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-sm-2 control-label">邮箱</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="email" name="email"
						value="${m.email}" placeholder="请输入邮箱地址">
				</div>
				<label for="zipCode" class="col-sm-2 control-label">邮编</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="zipCode" name="zipCode"
						value="${m.zipCode}" placeholder="请输入邮编">
				</div>
			</div>
			<div class="form-group">
				<label for="address" class="col-sm-2 control-label">地址</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="address" name="address"
						value="${m.address}" placeholder="请输入地址">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="descr">备注</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="descr" name="descr" rows=3>${m.descr}</textarea>
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

	<!-- Bootstrap 3.3.7 -->
	<script
		src="jslib/AdminLTE/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script
		src="jslib/AdminLTE/bower_components/fastclick/lib/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="jslib/AdminLTE/dist/js/adminlte.min.js"></script>
	<script src="jslib/layer/layer.js"></script>
	<script src="jslib/comm.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			if("${m.id}"!="")
			{
				$("#sex").val("${m.sex}");
				$("#educational").val("${m.educational}");
			}
			//自定义格式
			laydate.render({
			  elem: '#dob',
			  format: 'yyyy-MM-dd'
			});
		})
		function onSelIcon()
		{
			var layerIcon=layer.open({
				  title:"图标选择",
				  type: 2,
				  area: ["360px", "450px"],
				  content: "<%=basePath%>sysDept/sel"
			});
		}
		function selDeptCallBack(deptId,deptName)
		{
			$("#deptId").val(deptId);
			$("#deptName").val(deptName);
			layer.closeAll();
		}
		function onCancel() {
			parent.layer.closeAll();
		}
		//异步提交保存信息
		function onSave()
		{
			var name = $("#name").val();
			if(name=="")
			{
				layer.msg("请输入姓名", {
					  offset: 't',
					  anim: 6
					});
				return;
			}
			var deptName = $("#deptName").val();
			if(deptName=="")
			{
				layer.msg("请选择所属机构", {
					  offset: 't',
					  anim: 6
					});
				return;
			}
			var formData = $("#mainForm").serializeArray();
			//异步提交数据
			$.post("<%=basePath%>sysPerson/save", formData, function(data) {
				var r = eval('(' + data + ')');
				if (r.success == true) {
					parent.saveCallBack();
				} else {
					layer.alert(r.msg);
				}
			})
		}
	</script>
</body>
</html>