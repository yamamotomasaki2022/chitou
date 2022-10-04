<%@page import="org.eclipse.jdt.internal.compiler.env.IBinaryAnnotation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import= "tw.luana.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>

<title>訂單結果</title>
<link href="https://img.onl/DOO7l" rel="icon" type="image/png" />

<%@ include file="../Luana_include/head.jsp" %>
</head>
<body>

	<%@ include file="/WEB-INF/includes/Header.jsp"  %>

<%@ include file="../Luana_include/navbar.jsp" %>   

<div class="container">
		<div class="card-header my-3">
		訂單詳細資料
		</div>
	
		<table class="table table-light">
			<thead>
				<c:forEach var="order" items="${orderList}">
				<tr>
					<th scope="col">訂單編號：${order.orderid}</th>
					<th scope="col">訂單類別：${order.ordertype}</th>
					<th scope="col">下訂日：${order.orderdate}</th>
					<th scope="col">總金額${order.totalprice}</th>
					<c:choose>
						<c:when test="${order.orderstatus == 1}"> 										
						<th scope="col">訂單狀態：處理中</th>
						</c:when>
						<c:when test="${order.orderstatus == 2}" > 										
						<th scope="col">訂單狀態：已完成</th>
						</c:when>
						<c:when test="${order.orderstatus == 3}" > 										
						<th scope="col">訂單狀態：已取消</th>>						
						</c:when>
					</c:choose>
				</tr>
				</c:forEach>
			</thead>
			<tbody>
	<c:forEach var="aOrder" items="${aOrderDetail}">
				
					<tr>
						
						<td>${aOrder.attractionname}</td>
						<td>${aOrder.planname}</td>
						<td>${aOrder.quantity}</td>
						<td>${aOrder.price}</td>
						
						
						
					</tr>
			</c:forEach>
			</tbody>	
		</table>
	</div>


<%@ include file="../Luana_include/footer.jsp" %>

   
</body>
</html>