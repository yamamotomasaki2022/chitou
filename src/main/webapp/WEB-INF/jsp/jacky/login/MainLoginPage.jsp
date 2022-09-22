<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 登入頁面</title>
</head>
<body>

	<%@ include file="/WEB-INF/includes/Header.jsp"  %>
	
	<FORM ACTION=toMemberLoginPage method="post">
	
	<input class="btn" type="submit" name="memberlogin" value="會員">
	
	</FORM>
	<br>
	<hr>
	
	<FORM ACTION="toAdminLoginPage" method="post">
	<input class="btn" type="submit" name="adminlogin" value="管理員">
	</FORM>

</body>
</html>