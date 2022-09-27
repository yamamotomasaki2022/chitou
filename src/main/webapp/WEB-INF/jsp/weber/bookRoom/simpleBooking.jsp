<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" ; charset="UTF-8">
<title>簡易預定飯店</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>
	<h3>這是簡易訂房系統</h3>
	<div>
		<form:form action="insertStyle" method="post" modelAttribute="style"
			enctype="multipart/form-data">
	        請輸入房型名稱:
	        <form:input type="text" path="name" name="name" id="name" />
			<br>
	        容納人數:
	        <form:input type="text" path="capacity" name="capacity"
				id="capacity" />
			<br>
	        價格:
	        <form:input type="text" path="price" name="price" id="price" />
			<br>
	        床位:
	        <form:input type="text" path="bed" name="bed" id="bed" />
			<br>
	        狀態:
	        <form:input type="text" path="status" name="status" id="status" />
			<br>
	        房間數量:
	        <input type="text" name="roomAmount">
			<br>
	    	照片:<br>
			<input id="upload" type="file" name="upload" accept="image/*"
				multiple="multiple">
			<br>
			<input type="submit" name="insert" value="加入一筆資料">
		</form:form>
		<div id="picPreview"></div>
		<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>
	</div>
		<script>
			
		</script>
</body>
</html>