<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="tw.cocokang.attraction.model.* , java.util.*, java.sql.*, javax.servlet.* , javax.naming.*, java.sql.*, javax.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   

<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>ChiTou後台管理系統-搜尋結果</title>
<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>
<h4 class="card-title text-primary">&nbsp;景點搜尋結果</h4>

	<div class="table-responsive">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>景點圖片:</th>
					<th>景點編號:</th>
					<th>方案編號:</th>
					<th>景點名稱:</th>
					<th>景點位置:</th>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;景點說明:</th>
					</tr>
				</thead>
					<c:forEach var="selectbyname" items="${attraction}">
						<tr>
						<td class="py-1"><img src="/images/coco/attractionpicture/${selectbyname.photo} "></td>
						<td>${selectbyname.attid}</td>
						<td>${selectbyname.hobbyclassification.preferid}</td>
						<td>${selectbyname.attName}</td>
						<td>${selectbyname.attLocation}</td>
						<td>${selectbyname.attDescription}</td>
					</tr>
				</c:forEach>
				</table>
				</div>
				<a href="listAttractions"><button class="btn btn-light">返回</button></a>   
</body>
</html>