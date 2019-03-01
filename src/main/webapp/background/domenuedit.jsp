<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	//  basePath= http://localhost:8080/SSH_Demo01/
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>修改菜單</title>
</head>
<body style="margin-top:200px">
	<div class="row">
		<div class="col-md-12">
			<!-- Advanced Tables -->
			<div class="panel panel-default">
				<div class="panel-heading">修改菜單</div>
				<div class="panel-body">
					<div class="table-responsive">
						<form class="form-horizontal" action="menu/editsuc"
							name="update" method="post" target="_self" accept-charset="utf-8"  onsubmit="document.charset='utf-8';" enctype="multipart/form-data">
							<div class="form-group">
								<label for="inputSid" class="col-sm-2 control-label">菜品编号</label>
								<div class="col-sm-10">
									<input type="text" name="mId" class="form-control"
										id="mId" value="${menu.mId}" readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">菜品種類</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"   name="fk.fkName"
									id="fk.fkName" placeholder="请输入菜品种类" value="${menu.fk.fkName}" >
								</div>
							</div>
							
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">菜品名字</label>
								<div class="col-sm-10">
									<input type="text" name="mName" class="form-control"
										id="mName" placeholder="请输入菜品名字" value="${menu.mName}">
								</div>
							</div>
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">菜品价格</label>
								<div class="col-sm-10">
									<input type="text" name="mPrice" class="form-control"
										id="mPrice" placeholder="请输入菜品价格" value="${menu.mPrice}" >
								</div>
							</div>
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">菜品数量</label>
								<div class="col-sm-10">
									<input type="text" name="mNumber" class="form-control"
										id="mNumber" placeholder="请输入菜品数量" value="${menu.mNumber}">
								</div>
							</div>
							
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">菜品预览</label>
								<div class="col-sm-10">
									<input hidden id="orignalPicture" name="mPicture" value="${menu.mPicture}">	
									<img id="OldmPicture" name="OldmPicture" class="img-responsive"
									src="${pageContext.request.contextPath }/${menu.mPicture}"  alt="菜品预览" />
									<!-- src="${pageContext.request.contextPath }\upload\2018\8\food20180808095204596.jpg"  alt="菜品预览" /> -->
								</div>
							</div>
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">修改预览</label>
								<div class="col-sm-10">
									<input type="file" name="file" class="form-control"
										id="NewmPicture"  value="上传一张新的图片吧~">
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button class="btn btn-default" onclick="doeditsuc()" >修改</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function doeditsuc() {
			$("form[name=update]").submit(function() {
			})
		}
		var pname=$("#mName").val();
		console.log("-------"+pname)
	</script>
</body>
</html>