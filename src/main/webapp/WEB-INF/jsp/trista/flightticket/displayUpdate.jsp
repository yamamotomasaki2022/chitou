<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改航班確認</title>
</head>
<body>

<h2>
修改航班資料如下請確認
</h2>
<form action="FlightTicket.controller" method="post">
<table  cellspacing="2" cellpadding="1" border="1" width="20%">
<tr bgcolor="#FFFFE1">
    <td>航班編號:</td>
    <td><jsp:getProperty name="update_flight" property="flightID" /></td>
</tr>
<tr bgcolor="#F2F4FB">
    <td>票價:</td>
    <td><jsp:getProperty name="update_flight" property="fare" /></td>
</tr>

</table>

<br>

<input type="submit" name="confirm" value="確認" >
<input type="button" name="rollback" value="回上一頁" >

</form>
</body>
</html>