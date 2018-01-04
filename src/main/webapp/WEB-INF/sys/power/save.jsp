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
				<label for="name" class="col-sm-2 control-label">名称</label>

				<div class="col-sm-10">
					<input type="email" class="form-control" id="name" name="name"
						value="${m.name}" placeholder="请输入功能名称,不可为空">
				</div>
			</div>
			<div class="form-group">
				<label for="sym" class="col-sm-2 control-label">代码</label>

				<div class="col-sm-4">
					<input type="text" class="form-control" id="sym"
						name="sym" value="${m.sym}"
						placeholder="请输入功能代码">
				</div>
				<label for="powerType" class="col-sm-2 control-label">功能类型</label>

				<div class="col-sm-4">
				<select class="form-control" id="powerType" name="powerType">
                    <option value="0" selected="selected">菜单</option>
                    <option value="1">操作</option>
                  </select>
					<%-- <input type="text" class="form-control" id="powerType"
						name="powerType" value="${m.powerType}" placeholder="请选择功能类型"> --%>
				</div>
			</div>
			<div class="form-group menuInfo">
				<label for="url" class="col-sm-2 control-label">地址</label>

				<div class="col-sm-10">
					<input type="text" class="form-control" id="url"
						name="url" value="${m.url}"
						placeholder="请输入地址">
				</div>
			</div>
			<div class="form-group menuInfo">
			
				<label for="icon" class="col-sm-2 control-label">图标</label>

				<div class="col-sm-4">
					
						<div class="input-group">
                <input type="text" class="form-control" id="icon"
						name="icon" value="${m.icon}" placeholder="请选择图标">
                <span class="input-group-addon" onclick="onSelIcon()"><i class="fa fa-image"></i></span>
              </div>
				</div>
				<label for="openType" class="col-sm-2 control-label">打开方式</label>

				<div class="col-sm-4">
					<select class="form-control" id="openType" name="openType">
                    <option value="0" selected="selected">框架内</option>
                    <option value="1">新窗口</option>
                  </select>
				</div>
			</div>
			<div class="form-group">
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
		$(function(){
			if("${m.id}"!="")
				{
					$("#powerType").val("${m.powerType}");
					$("#openType").val("${m.openType}");
					if("${m.powerType}"=="1")
					{
						$(".menuInfo").hide();
					}
					$("#stts").val("${m.stts}");
				}
			$("#powerType").on("change",function(){
				if($("#powerType").val()=="0"){
					$(".menuInfo").show();
				}else{
					$(".menuInfo").hide();
				}
			})
		})
		function onSelIcon()
		{
			parent.selIcon();
		}
		function selIconOk(icon)
		{
			$("#icon").val(icon);
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
				layer.msg("请输入功能名称", {
					  offset: 't',
					  anim: 6
					});
				return;
			}
			var sym = $("#sym").val();
			
				if(!isSym(sym))
				{
					layer.msg("代码格式错误", {
						  offset: 't',
						  anim: 6
					});
					return;
				}
			var formData = $("#mainForm").serializeArray();
			//异步提交数据
			$.post("<%=basePath%>sysPower/save", formData, function(data) {
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