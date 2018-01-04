<%@ page language="Java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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
<title>机构保存-页面</title>
<%@ include file="/WEB-INF/include/sys/head.jsp" %>
</head>
<body> 
<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
		<ol class="breadcrumb" style="margin-bottom:0"> 
			<li><a style="text-decoration: none;"> <i class="fa fa-dashboard"></i>&nbsp;&nbsp;网站管理</a></li>
			<li class="active">新闻添加|修改</li>
		</ol>
		</section>

		<!-- Main content -->
		<section class="content container-fluid">
		<br/>
	<form id="mainForm" class="form-horizontal" style="padding-right: 55px">
	<input type="hidden" value="${m.createUserName}" id="createUserName" name="createUserName" />
	<input type="hidden" value="${m.createDeptId}" id="createDeptId" name="createDeptId" />
	<input type="hidden" value="${m.createDeptName}" id="createDeptName" name="createDeptName" />
	<input type="hidden" value="${m.clickCount}" id="clickCount" name="clickCount" />
	<input type="hidden" value="${m.imgUrl}" id="imgUrl" name="imgUrl" />
	<input type="hidden" value="${m.imgPath}" id="imgPath" name="imgPath" />
		<input type="hidden" value="${m.sym}" id="sym" name="sym" />
	<input type="hidden" value="${m.id}" id="id" name="id" />
		<div class="box-body">
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">文章标题</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="title" name="title"
						value="${m.title}" placeholder="请输入文章标题">
				</div>
			</div>
			<div class="form-group">
				<label for="createPersonName" class="col-sm-2 control-label">创建人</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="createPersonName" name="createPersonName"
						value="" placeholder="请输入创建人">
				</div>
				
				<label for="publishDate" class="col-sm-2 control-label">发布时间</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="publishDate" name="publishDate"
					value="<fmt:formatDate value="${m.publishDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" placeholder="请选择发布时间">
				</div>
			</div>
			<div class="form-group">
				<label for="imgPath" class="col-sm-2 control-label">封面</label>
				<div class="col-sm-6">
					<input type="file" id="imgFile" name="imgFile" value=""/>
				</div>
				<div class="col-sm-4" style="text-align:left;display:none" id="divGroup">
					
					<button type="button" class="btn btn-success" onclick="previewImg()"><span class="glyphicon glyphicon-zoom-in"></span>&nbsp;&nbsp;预览</button>
					  <button type="button" class="btn btn-danger" onclick="removeImg()"><span class="glyphicon glyphicon-remove"></span>&nbsp;&nbsp;删除</button>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="content">内容</label>
				<div class="col-sm-10">
				 <script id="content" name="content" type="text/plain">
        			${m.content}
    			</script>
					
				</div>
			</div>
		</div>
	</form>
	<div class="form-group controls" style="text-align: center">
	<div class="row">
  <div class="col-xs-5">
   
  </div>
  <div class="col-xs-2">
    <button type="button" class="btn pad32 btn-primary btn-flat btn-block" 
			onclick="onSave()">保存</button>
  </div>
  <div class="col-xs-5">
     
  </div>
</div>
	</div>
	</section>
	</div>

	<script type="text/javascript">
	 var ue = UE.getEditor('content',{
		 initialFrameWidth:"100%", //初始化选项
		 initialFrameHeight:'300',
		 enterTag : 'br'
	 });
		$(function(){
			if("${m.id}"!=""){
				$("#createPersonName").val("${m.createPersonName}");
			}else{
				$("#createPersonName").val("${sessionScope.user.personName}");
			}
			if("${m.imgUrl}"!="")
			{
				$("#divGroup").show();
			}
			//自定义格式
			laydate.render({
			  elem: '#publishDate',
			  format: 'yyyy-MM-dd HH:mm:ss',
			  type: 'datetime'
			});
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
			    	      "src": "${m.imgUrl}", //原图地址
			    	      "thumb": "" //缩略图地址
			    	    }
			    	  ]
			    	}
			    ,anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机
			  });
		}
		function removeImg()
		{
			$("#imgUrl").val("");
			layer.msg("删除成功");
		}
		function onReset() {
			$("#mainForm").reset();
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
	                    url: '<%=basePath%>webNews/uploadFile', //用于文件上传的服务器端请求地址
	                    secureuri: false, //是否需要安全协议，一般设置为false
	                    fileElementId: 'imgFile', //文件上传域的ID
	                    dataType: 'json', //返回值类型 一般设置为json                
	                    success: function (data, status)  //服务器成功响应处理函数
	                    {
	                    	if(data.success==true)
	                    	{
	                       		$("#imgUrl").val(data.msg);
	                       		var formData = $("#mainForm").serializeArray();
	                			//异步提交数据
	                			$.post("<%=basePath%>webNews/save", formData, function(sdata) {
	                				var r= eval('('+sdata+')');
	                				if(r.success==true)
	                				{
	                					window.location.reload();
	                				}else{
	                					layer.alert(r.msg);
	                				}
	                			});
	                    	}else{
	                    		layer.msg(data.msg);
	                    	}
	                    },
	                    error: function (data, status, e)//服务器响应失败处理函数
	                    {
	                    	alert(e);
	                    }
	                }
	            )
	            return false;
	        }
		//异步提交保存信息
		function onSave()
		{
			var title = $("#title").val();
			if(title=="")
			{
				layer.msg("请输入文章标题", {
					  offset: 't',
					  anim: 6
					});
				return;
			}
			var file=$("#imgFile");

			 if($.trim(file.val())!=''){
					ajaxFileUpload();
          	 }else{
          		var formData = $("#mainForm").serializeArray();
	   			//异步提交数据
	   			$.post("webNews/save", formData, function(sdata) {
	   				var r= eval('('+sdata+')');
	   				if(r.success==true)
	   				{
	   					layer.msg("信息保存成功");
	   				}
	   			});
          	}
		}
	</script>
</body>
</html>