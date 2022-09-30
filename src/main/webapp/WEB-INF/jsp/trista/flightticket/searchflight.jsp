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
<h4 class="card-title text-primary">&nbsp;航班搜尋結果</h4>

	<div class="table-responsive">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>航空公司:</th>
					<th>班機編號:</th>
					<th>出發機場:</th>
					<th>出發時間:</th>
					<th>降落機場:</th>
					<th>抵達時間:</th>
					<th>艙等:</th>
					<th>票價:</th>
					</tr>
				</thead>
					<c:forEach var="selectbyclassid" items="${selectbyclassid}">
						<tr>
							<td>${selectbyclassid.airline}</td>
							<td>${selectbyclassid.flightid}</td>
							<td>${selectbyclassid.originid}</td>
							<td>${selectbyclassid.departuretime}</td>
							<td>${selectbyclassid.destinationid}</td>
							<td>${selectbyclassid.arrivaltime}</td>
							<td>${selectbyclassid.classid}</td>
							<td>${selectbyclassid.fare}</td>
					</tr>
				</c:forEach>
				</table>
				</div>
				<a href="flightticket.main"><button class="btn btn-light">返回</button></a>   
</body>
</html>