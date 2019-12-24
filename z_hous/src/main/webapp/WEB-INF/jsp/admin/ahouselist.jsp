<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>房屋租赁系统</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/libs/modernizr.min.js"></script>

<style type="text/css">
</style>
</head>
<body>
	<div>
		<div class="result-title">
			<h1>房源列表</h1>
		</div>
		<form id="houseForm" name="houseForm" action="ahouselist"
			method=post>
			<div class="result-title">
				<div class="result-list"></div>
			</div>
			<div class="result-content">
				<table id=grid class="result-tab" width="100%">
					<tbody>
						<tr
							style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
							<td>房屋图片</td>
							<td>地址</td>
							<td>面积</td>
							<td>价格</td>
							<td>状态</td>
							<td>操作</td>
						</tr>
						<c:forEach items="${houselist}" var="house">
							<tr
								style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
								<td><img src="${house.img }"
									style="width: 150px; height: 100px;"></td>
								<td>${house.address}</td>
								<td>${house.area}</td>
								<td>${house.price}</td>
								<td>${house.status}</td>
								<td><a class="link-update"
									href="findid?id=${house.id}">修改</a> &nbsp;&nbsp; <input
									type="hidden" name="id" value="${house.id}" /> <a
									class="link-del" href="deletehouse?id=${house.id}"
									onclick="return window.confirm('确定删除吗？')">删除</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<tr>
				<span id=pagelink>
					<div
						style="LINE-HEIGHT: 20px; HEIGHT: 20px; TEXT-ALIGN: right; margin-top: 10px">
						共[<B>${p.total}</B>]条记录，共[<B>${p.pages}</B>]页 ,
						<c:if test="${ p.hasPreviousPage}">
						[<A href="javascript:to_page(${p.isFirstPage})">首页</A>] 
						</c:if>
						<c:if test="${ p.pageNum > 1 }">
													[<A href="javascript:to_page(${p.prePage})">前一页</A>]
												</c:if>
						<input type="hidden" name="page" id="page" value="" /> 第<B>${p.pageNum}</B>页

						<c:if test="${ p.pageNum < p.pages }">
													[<A href="javascript:to_page(${p.nextPage})">后一页</A>] 
												</c:if>
						<c:if test="${ p.hasNextPage}">
												[<A href="javascript:to_page(${p.pages})">尾页</A>] 
												</c:if>
												
					</div>
				</span>
			</tr>
		</form>
	</div>
	<script language=javascript>
		// 提交分页的查询的表单
		function to_page(page) {
			if (page) {
				$("#page").val(page);
			}
			document.houseForm.submit();
		}
	</script>
</body>
</html>