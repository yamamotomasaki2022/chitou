<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix=”bean” uri=”http://struts.apache.org/tags-bean” %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<a href=”changelang.do?lang=zh”>中文</a>
&nbsp&nbsp&nbsp
<a href=”changelang.do?lang=en”>英文</a>

<form action=”login.do” method=”post”>
<bean:message key=”user.username”/>：<input type=”text” name=”username”><br>
<bean:message key=”user.password”/>：<input type=”password” name=”password”><br>
<input type=”submit” value=”<bean:message key=”user.button.login”/>”>
</form>

</body>
</html>