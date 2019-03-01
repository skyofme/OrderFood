<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>显示所有的日志信息</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>css/component1.css">
<style>
* {
	margin: 0;
	padding: 0;
}

tbody tr {
	font: normal 15px "microsoft yahei";
}

.table1 {
	border: 2px solid #ccc;
}

.table-top {
	height: 20px;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<!-- Advanced Tables -->
			<div class="panel panel-default">
				<div class="panel-heading">员工日志表</div>
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover">
							<tr>
								<th>日志时间</th>
								<th>员工角色</th>
								<th>员工姓名</th>
								<th>员工具体工作</th>								
								
							</tr>
							<c:forEach items="${list}" var="log">
							
								<tr>
									<td>${log.lDate}</td>	
									<td>${log.emp.role.rRole}</td>
									<td>${log.emp.eName}</td>
									<td>${log.lContent}</td>
															
								</tr>
							</c:forEach>
						
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>

	<nav aria-label="">
			<ul class="pager">
				<c:if test="${page.isFirstPage && page.pages>1}">
				<li><a href="javascript:void()" onclick="donextpage()">下一頁：第${page.nextPage}頁</a></li>
				</c:if>
				<c:if test="${page.isLastPage && page.pages>1}" >
					<li><a href="javascript:void()" onclick="doprepage()">上一頁：第${page.prePage}頁</a></li>
				</c:if>
				<c:if test="${page.isFirstPage==false}">
				<c:if test="${page.isLastPage==false}">
				<li><a href="javascript:void()" onclick="doprepage()">上一頁：第${page.prePage}頁</a></li>
				<li><a href="javascript:void()" onclick="donextpage()">下一頁：第${page.nextPage}頁</a></li>
				</c:if>
				</c:if>
				<c:if test="${page.isFirstPage && page.isLastPage}">
				<li>这已经是最后一页啦</li>
				</c:if>
				
				
			</ul>
		</nav>
		<p> 共${page.pages }页</p>
	</div>

	
</body>
<script src="<%=basePath%>js/classie.js"></script>
<script src="<%=basePath%>js/modalEffects.js"></script>
 <script>
 //上一页跳转
 function doprepage() {
 		console.log(${page.prePage});
		$(".main").load("log/logbyid/${user}/${page.prePage}/${page.pageSize}");	}
 //下一页跳转
 function donextpage() {
		$(".main").load("log/logbyid/${user}/${page.nextPage}/${page.pageSize}");	}

</script>
</html>