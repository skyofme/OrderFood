<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
<title>Insert title here</title>
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
<script src="<%=basePath%>js/jquery-2.1.1.min.js"></script>
<script src="<%=basePath%>js/bootstrap.min.js"></script>
</head>
<body>
	<div class="table-top"></div>
	<div class="container" style="margin-bottom: 20px;">
	
	</div>

	<div class="container">
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr class="row text-center bg-success">
					<td>员工ID</td>
					<td>员工姓名</td>
					<td>员工电话</td>
					<td>员工角色</td>
					<td>编辑</td>
				</tr>
			</thead>
			<tbody id="table-tbody">
			<c:forEach items="${emps}" var="emp">
				<tr class="row text-center">
					<td class="col-md-2">${emp.eId}</td>
				    <td class="col-md-2">${emp.eName}</td>
					<td class="col-md-3">${emp.ePhone}</td>
					<td class="col-md-2">${emp.role.rRole}</td>
					
	    <td><a href="javascript:void()" role="button" class="btn btn-primary btn-sm"  onclick="doedit(this)">编辑</a></td>
					
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<nav aria-label="">
			<ul class="pager">
				<c:if test="${page.isFirstPage }">
					<li><a href="javascript:void()" onclick="donextpage()">下一頁：第${page.nextPage}頁</a></li>
				</c:if>
				<c:if test="${page.isLastPage}">
					<li><a href="javascript:void()" onclick="doprepage()">上一頁：第${page.prePage}頁</a></li>
				</c:if>
				<c:if test="${page.isFirstPage==false}">
				<c:if test="${page.isLastPage==false}">
				<li><a href="javascript:void()" onclick="doprepage()">上一頁：第${page.prePage}頁</a></li>
				<li><a href="javascript:void()" onclick="donextpage()">下一頁：第${page.nextPage}頁</a></li>
				</c:if>
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
		$(".main").load("emp/empAll/${page.prePage}/${page.pageSize}");	}
 //下一页跳转
 function donextpage() {
		$(".main").load("emp/empAll/${page.nextPage}/${page.pageSize}");	}
//下一页跳转 
 function doedit(elem) {
 		console.log("---------")
 		var eId=$(elem).parents("tr").find("td:eq(0)").text();
 		console.log("+++++++++"+eId);
 		var eid=Number(eId)
 		console.log("+++++++++"+eid);
		$(".main").load("emp/doedit/"+eid);	
		} 
		

</script>
</html>