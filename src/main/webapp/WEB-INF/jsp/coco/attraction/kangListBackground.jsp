<%@page import="java.util.List"%>
<%@page import="tw.cocokang.attraction.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>景點後台管理系統</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://img.onl/DOO7l" rel="icon" type="image/png" />
</head>
<body>
	<header> <nav class="navbar navbar-expand-md navbar-dark"
		style="background-color: lightblue">
	<div>
		<img src="images/chitou.png" /> <a
			href="http://localhost:8080/HibernateChiTou/Kang-list.jsp"
			class="navbar-brand"> ChiTou </a>
	</div>

	<ul class="navbar-nav">
		<li><a href="http://localhost:8080/HibernateChiTou/Kang-list.jsp"
			class="nav-link">景點</a></li>
	</ul>
	</nav> </header>
	<br>
	<div class="row">
		<div class="container">
			<br>
			<h3 class="text-center">
				<b>景點項目</b>
			</h3>
			<hr>
			<a href="addAttraction">
				<button class="btn btn-success">新增景點</button>
			</a>
			
			<form action="searchAttraction" method="post" enctype="multipart/form-data">
			<input type="text" name="search"> <input type="submit"
				name="searchno" value="搜尋">
				
				
			<form method="post" action="searchAttraction">
		
			<br>
			<table border="1" class="table table-bordered">
				<thead>
					<tr>
						<th>景點ID</th>
						<th>方案編號</th>
						<th>景點名稱</th>
						<th>景點位置</th>
						<th>景點說明</th>
						<th>購票須知:</th>
						<th></th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="attraction" items="${listAttraction}">
						<tr>
							<form action="updateAttraction" method="get">
								<td><c:out value="${attraction.attid}" /></td>
								<td><c:out
										value="${attraction.hobbyclassification.preferid}" /></td>
								<td><c:out value="${attraction.attName}" /></td>
								<td><c:out value="${attraction.attLocation}" /></td>
								<td><c:out value="${attraction.attDescription}.substring(0,5)" /></td>
								<td><c:out value="${attraction.attNotice}" /></td>


								<td><input type="hidden" name="attid"
									value="${attraction.attid}"> <input type="hidden"
									name="hobbyclassification"
									value="${attraction.hobbyclassification.preferid}"> <input
									type="hidden" name="attName" value="${attraction.attName}">
									<input type="hidden" name="attLocation"
									value="${attraction.attLocation}"> <input type="hidden"
									name="attDescription" value="${attraction.attDescription}">
									<input type="hidden" name="attNotice"
									value="${attraction.attNotice}">

									<button type="submit" name="update" class="btn btn-success">編輯</button>
							</form>


							<a href="deleteAttraction?attid=${attraction.attid}">刪除</a>
							<!-- <button type="submit" name="delete" class="btn btn-success">刪除</button>-->
							</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://kit.fontawesome.com/6c4c414686.js"
		crossorigin="anonymous"></script>
</body>
</html>
</body>
</html>

