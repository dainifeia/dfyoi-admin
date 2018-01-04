<%@ page language="Java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<br/>
	<form id="mainForm" class="form-horizontal" style="padding-right: 55px">
		<input type="hidden" value="${opType}" id="opType" name="opType" />
		<input type="hidden" value="${srgt}" id="srgt" name="srgt" />
		<input type="hidden" value="${slevel}" id="slevel" name="slevel" />
		
		<input type="hidden" value="${m.lft}" id="lft" name="lft" />
		<input type="hidden" value="${m.rgt}" id="rgt" name="rgt" />
		<input type="hidden" value="${m.level}" id="level" name="level" />
		<input type="hidden" value="${m.id}" id="id" name="id" />
		<div class="box-body">
			<div class="form-group">
				<label for="name" class="col-sm-2 control-label">机构名称</label>

				<div class="col-sm-10">
					<input type="email" class="form-control" id="name" name="name"
						value="${m.name}" placeholder="请输入机构名称,不可为空">
				</div>
			</div>
			<div class="form-group">
				<label for="contactPerson" class="col-sm-2 control-label">负责人</label>

				<div class="col-sm-4">
					<input type="text" class="form-control" id="contactPerson"
						name="contactPerson" value="${m.contactPerson}"
						placeholder="请输入机构负责人">
				</div>
				<label for="contactTel" class="col-sm-2 control-label">办公电话</label>

				<div class="col-sm-4">
					<input type="text" class="form-control" id="contactTel"
						name="contactTel" value="${m.contactTel}" placeholder="请输入机构办公电话">
				</div>
			</div>
			<div class="form-group">
				<label for="address" class="col-sm-2 control-label">地址</label>

				<div class="col-sm-10">
					<input type="text" class="form-control" id="address" name="address"
						value="${m.address}" placeholder="请输入机构所在位置">
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

	<script type="text/javascript">
		function onCancel() {
			parent.layer.closeAll();
		}
		//异步提交保存信息
		function onSave()
		{
			var name = $("#name").val();
			if(name=="")
			{
				layer.msg("请输入机构名称", {
					  offset: 't',
					  anim: 6
					});
				return;
			}
			var formData = $("#mainForm").serializeArray();
			//异步提交数据
			$.post("<%=basePath%>sysDept/save", formData, function(data) {
				var r= eval('('+data+')');
				if(r.success==true)
				{
					parent.saveCallBack();
				}else{
					layer.alert(r.msg);
				}
			})
		}
	</script>
</body>
</html>