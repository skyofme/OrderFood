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
<title>显示所有的学员信息</title>
</head>
<body style="margin-top:200px">
	<div class="row">
		<div class="col-md-12">
			<!-- Advanced Tables -->
			<div class="panel panel-default">
				<div class="panel-heading">修改员工信息表</div>
				<div class="panel-body">
					<div class="table-responsive">
						<form class="form-horizontal" action="emp/doeditEmp"
							name="add" method="post" target="_self">
							<div class="form-group">
								<label for="inputSid" class="col-sm-2 control-label">员工编号</label>
								<div class="col-sm-10">
									<input type="text" name="eId" class="form-control"
										id="inputSid" value="${emp.eId}" readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">员工姓名</label>
								<div class="col-sm-10">
									<input type="text" name="eName" class="form-control"
										id="inputName" placeholder="请输入姓名" value="${emp.eName}">
								</div>
							</div>
					
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">员工电话</label>
								<div class="col-sm-10">
									<input type="text" name="ePhone" class="form-control"
										id="inputName" placeholder="请输入电话号码" value="${emp.ePhone}">
								</div>
							</div>
							
							<div class="form-group">
								
								<label for="inputName" class="col-sm-2 control-label">选择角色</label>
								<div class="col-sm-10">
									<select class="form-control" name="role.rId" >
									<c:forEach items="${roles}" var="role">
									   	<c:choose>
												<c:when test="${emp.role.rId==role.rId }">
													<option value="${role.rId }" selected="selected">${role.rRole}</option>
												</c:when>
												<c:otherwise>
													<option value="${role.rId}">${role.rRole}</option>
												</c:otherwise>
										</c:choose>
									</c:forEach>
									</select>
											
								</div>
								
							</div>
							
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button class="btn btn-default" onclick="doadd()" >修改</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function doadd() {
			$("form[name=add]").submit(function() {
			})
		}
		
		var pname=$("#inputName").val();
		console.log("-------"+pname)
	</script>
</body>
</html>