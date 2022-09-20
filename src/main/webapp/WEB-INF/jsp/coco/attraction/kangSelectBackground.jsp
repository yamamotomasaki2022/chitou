<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="tw.coco.model.* , java.util.*, java.sql.*, javax.servlet.* , javax.naming.*, java.sql.*, javax.sql.*"%>
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
<title>搜尋結果頁面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link href="https://img.onl/DOO7l" rel="icon" type="image/png" />

</head>
<body BGCOLOR="#FDF5E6">
	<header> <nav class="navbar navbar-expand-md navbar-dark"
		style="background-color: lightblue">
	<div>
		<img src="images/chitou.png" /> <a
			href="http://localhost:8080/ChiTou/kang-DisplayUser.jsp"
			class="navbar-brand"> ChiTou </a>
	</div>

	<ul class="navbar-nav">
		<li><a href="http://localhost:8080/ChiTou/kang-Index.jsp"
			class="nav-link">景點</a></li>
	</ul>
	</nav> </header>
	<br>

	<div align="center">
		<h2>Search Result</h2>
		<table border="1" class="table table-bordered" cellpadding="5">
			<thead>
				<tr>
					<th>景點ID</th>
					<th>方案編號</th>
					<th>景點名稱</th>
					<th>景點位置</th>
					<th>景點說明</th>
					<th>購票須知:</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="selectbyname" items="${attraction}">
					<tr>
						<td>${selectbyname.attid}</td>
						<td>${selectbyname.hobbyclassification.preferid}</td>
						<td>${selectbyname.attName}</td>
						<td>${selectbyname.attLocation}</td>
						<td>${selectbyname.attDescription}</td>
						<td>${selectbyname.attNotice}</td>
					</tr>
				</c:forEach>
		</table>
	</div>
	
			<a href="listAttractions">
				<button class="btn btn-success">返回</button>
			</a>

</body>
</html>