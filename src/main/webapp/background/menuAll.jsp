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
		<form>
			<div class="dropdown">
				<select class="form-control"  >
					<option  selected="selected" onclick="dopage('所有种类')">所有种类</option>
					<c:forEach items="${kinds}" var="kind">
						<c:choose>
							<c:when test="${kind.fkName eq type}">
								<option  selected="selected" onclick="dopage('${kind.fkName}')">${kind.fkName}</option>
							</c:when>
							<c:otherwise>
								 <option  onclick="dopage('${kind.fkName}')">${kind.fkName}</option>
							</c:otherwise>
						</c:choose>			
			        </c:forEach>
			      
				</select>
				
			</div>
		</form>
	</div>
									
	<div class="container">
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr class="row text-center bg-success">
					<td>菜品ID</td>
					<td >菜品种类</td>
					<td >菜品名字</td>
					<td >菜品价格</td>
					<td >菜品数量</td>
					 <c:if test="${role==1 }"> 
					<td >编辑</td>
					<td >删除</td>
					</c:if>
				</tr>
			</thead>
			<tbody id="table-tbody">
			<c:forEach items="${menus}" var="menu">
				<tr class="row text-center">
					<td class="col-md-2">${menu.mId}</td>
				    <td class="col-md-2">${menu.fk.fkName}</td>
					<td class="col-md-3">${menu.mName}</td>
					<td class="col-md-2">${menu.mPrice}</td>
					<td class="col-md-2">${menu.mNumber}</td>
		 <c:if test="${role==1 }"> 
	    <td><a href="javascript:void()" role="button" class="btn btn-primary btn-sm" onclick="doedit(this)"    >编辑</a></td>
		<td><a href="javascript:void()"   role="button" class="btn btn-primary btn-sm" onclick="dosellout(this)">下架</a></td>
		</c:if>			
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<nav aria-label="">
			<ul class="pager">
				<c:if test="${page.isFirstPage && page.pages>1}">
					<li><a href="javascript:void()" onclick="donextpage()">下一頁：第${page.nextPage}頁</a></li>
				</c:if>
				<c:if test="${page.isLastPage && page.pages>1}">
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
 		//console.log(${typeflag});
 		if(${typeflag}  ){
			$(".main").load("menu/menuAll/${page.prePage}/3/${type}");
		}
		else{
			$(".main").load("menu/menuAll/${page.prePage}/${page.pageSize}");
		}
	}
		
 //下一页跳转
 function donextpage() {
	 console.log(${typeflag});
	 //console.log(${type});
		if(${typeflag}){
		    console.log("进来了其他");
			$(".main").load("menu/menuAll/${page.nextPage}/3/${type}");
		}
		else{ 
			//console.log("进来了全部");
			$(".main").load("menu/menuAll/${page.nextPage}/${page.pageSize}");
		}
}
//编辑 
 function doedit(ele) {
 		console.log("---------")
 		var  mId=$(ele).parents("tr").find("td:eq(0)").text();
 		console.log("+++++++++"+mId);
 		var mid=Number(mId)
		$(".main").load("menu/doedit/"+mid);	
		} 
function dosellout(ele) {
		console.log("---------")
 		var  mId=$(ele).parents("tr").find("td:eq(0)").text();
 		console.log("+++++++++"+mId);
 		var mid=Number(mId);
	    var flag=confirm("是否删除？");
		if(flag){ 
			$(".main").load("menu/dosellout/"+mid);
				}
	}
//按类型查找
function dopage(type) {
	 console.log("dopage");	
		$(".main").load("menu/menuAll/1/3/"+type);
	} 

</script>
</html>