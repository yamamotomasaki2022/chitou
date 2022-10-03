<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="getECPay" enctype="application/x-www-form-urlencoded" method="post">
	<input type="text" name="MerchantTradeNo">
	<input type="text" name="ItemName">
	<input type="text" name="TotalAmount">
	<input type="submit" name="提交">
</form>
</body>
</html>