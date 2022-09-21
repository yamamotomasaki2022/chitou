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
<title>新增航班確認</title>
</head>
<body>
<jsp:useBean id="insert_flight" class="tw.trista.flightticket.model" scope="session" />
<h2>
新增航班資料如下請確認
</h2>
<form action="FlightTicket.controller" method="post">
<table  cellspacing="2" cellpadding="1" border="1" width="100%">
<tr bgcolor="#FFFFE1">
    <td>航班編號:</td>
    <td><jsp:getProperty name="insert_flight" property="flightID" /></td>
</tr>
<tr bgcolor="#F2F4FB">
    <td>艙等:</td>
    <td><jsp:getProperty name="insert_flight" property="classID" /></td>
</tr>
<tr bgcolor="#FFFFE1">
    <td>去程日期:</td>
    <td><jsp:getProperty name="insert_flight" property="departureTime" /></td>
</tr>
<tr bgcolor="#F2F4FB">
    <td width="150">回程日期:</td>
    <td><jsp:getProperty name="insert_flight" property="arrivalTime" /></td>
</tr>
<tr bgcolor="#FFFFE1">
    <td>票價:</td>
    <td><jsp:getProperty name="insert_flight" property="fare" /></td>
</tr>
<tr bgcolor="#F2F4FB">
    <td>航空公司:</td>
    <td><jsp:getProperty name="insert_flight" property="airline" /></td>
</tr>
<tr bgcolor="#FFFFE1">
    <td>出發機場編號:</td>
    <td><jsp:getProperty name="insert_flight" property="originID" /></td>
</tr>
<tr bgcolor="#F2F4FB">
    <td>抵達機場編號:</td>
    <td><jsp:getProperty name="insert_flight" property="destinationID" /></td>
</tr>
</table>
<center>
<input type="submit" name="confirm" value="確認" >
</center>
</form>
</body>
</html>