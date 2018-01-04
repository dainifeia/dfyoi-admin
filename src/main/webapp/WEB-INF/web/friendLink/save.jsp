<%@ page language="Java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<%@ include file="/WEB-INF/include/sys/head.jsp"%>
</head>
<body>
	<div class="content-wrapper">
		<!-- Main content -->
		<section class="content container-fluid">
			<br />
			<form id="mainForm" class="form-horizontal"
				style="padding-right: 55px" enctype="multipart/form-data">
				<input type="hidden" value="${m.logo}" id="logo" name="logo" />
				<input type="hidden" value="${m.linkType}" id="linkType" name="linkType" /> 
				<input type="hidden" value="${m.id}" id="id" name="id" />
				<div class="box-body">
					<div class="form-group">
						<label for="title" class="col-sm-2 control-label">链接标题</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="title" name="title"
								value="${m.title}" placeholder="请输入链接标题">
						</div>
						<label for="sym" class="col-sm-2 control-label">链接代码</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="sym" name="sym"
								value="${m.sym}" placeholder="请输入链接代码">
						</div>
					</div>
					<div class="form-group">
						<label for="link" class="col-sm-2 control-label">链接地址</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="link" name="link"
								value="${m.link}" placeholder="请输入链接地址">
						</div>
					</div>
					<div class="form-group">
						<label for="linkType" class="col-sm-2 control-label">链接类型</label>
						<div class="col-sm-4">
							<label class="radio-inline"> <input type="radio"
								name="radLinkType" id="linkTypeWords" value="文字链接" checked>
								文字链接
							</label> <label class="radio-inline"> <input type="radio"
								name="radLinkType" id="linkTypeLogo" value="Logo链接">
								Logo链接
							</label>
						</div>
						<label for="link" class="col-sm-2 control-label">所属分类</label>
						<div class="col-sm-4"> 
							<select id="linkFlag" name="linkFlag" class="form-control">
								<c:forEach var="item" items="${linkFlagData}" varStatus="status">
									<option value="${item.value}">${item.text}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="imgPath" class="col-sm-2 control-label">logo</label>
						<div class="col-sm-6">
							<input type="file" id="imgFile" name="imgFile" value="" />
						</div>
						<div class="col-sm-4" style="text-align: left; display: none"
							id="divGroup">
							<div class="btn-group" role="group" aria-label="...">
								<button type="button" class="btn btn-success"
									onclick="previewImg()">
									<span class="glyphicon glyphicon-zoom-in"></span>&nbsp;&nbsp;预览
								</button>
								<button type="button" class="btn btn-danger"
									onclick="removeImg()">
									<span class="glyphicon glyphicon-remove"></span>&nbsp;&nbsp;删除
								</button>
							</div>
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
		</section>
	</div>

	<script type="text/javascript">
		$(function(){
			if("${m.id}"!=""){
				 $("input[name='radLinkType'][value='${m.linkType}']").attr("checked",true); 
				 $("#linkFlag").val("${m.linkFlag}");
			}
			if("${m.logo}"!="")
			{ 
				$("#divGroup").show();
			}
			 $("#imgFile").fileinput({
				 language: 'zh',
			        showUpload: false,
			        maxFileCount: 10,
			        showPreview:false
			 });
		})
		function previewImg()
		{
			layer.photos({
			    photos: {
			    	  "title": "封面预览", //相册标题
			    	  "id": 123, //相册id
			    	  "start": 0, //初始显示的图片序号，默认0
			    	  "data": [   //相册包含的图片，数组格式
			    	    {
			    	      "alt": "${m.title}",
			    	      "pid": 666, //图片id
			    	      "src": "${m.logo}", //原图地址
			    	      "thumb": "" //缩略图地址
			    	    }
			    	  ]
			    	}
			    ,anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机
			  });
		}
		function removeImg()
		{
			$("#logo").val("");
			layer.msg("删除成功");
		}
		function onCancel() {
			parent.layer.closeAll();
		}
		 function ajaxFileUpload() {
			 var l = layer.msg('正在上传文件,请等待...', {
				  icon: 16,
				  shade: 0.5,
				  time: 0
				});
	            $.ajaxFileUpload
	            (
	                {
	                    url: '<%=basePath%>webFriendLink/uploadFile', //用于文件上传的服务器端请求地址
	                    secureuri: false, //是否需要安全协议，一般设置为false
	                    fileElementId: 'imgFile', //文件上传域的ID
	                    dataType: 'json', //返回值类型 一般设置为json                
	                    success: function (data, status)  //服务器成功响应处理函数
	                    {
	                    	if(data.success==true)
	                    	{
	                       		$("#logo").val(data.msg);
	                       		var formData = $("#mainForm").serializeArray();
	                			//异步提交数据
	                			$.post("webFriendLink/save", formData,
								function(sdata) {
									var r = eval('(' + sdata + ')');
									if (r.success == true) {
										parent.saveCallBack();
									} else {
										layer.alert(r.msg);
									}
								});
					} else {
						layer.msg(data.msg);
					}
				},
				error : function(data, status, e)//服务器响应失败处理函数
				{
					alert(e);
				}
			})
			return false;
		}
		//异步提交保存信息
		function onSave() {
			var title = $("#title").val();
			if (title == "") {
				layer.msg("请输入链接标题", {
					offset : 't',
					anim : 6
				});
				return;
			}
			var file = $("#imgFile");
			$("#linkType").val($("input[name='radLinkType']:checked").val());
			if ($.trim(file.val()) != '') {
				ajaxFileUpload();
			} else {
				var formData = $("#mainForm").serializeArray();
				//异步提交数据
				$.post("webFriendLink/save", formData, function(sdata) {
					var r = eval('(' + sdata + ')');
					if (r.success == true) {
						parent.saveCallBack();
					} else {
						layer.alert(r.msg);
					}
				});
			}

		}
	</script>
</body>
</html>