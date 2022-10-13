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
		<div class="card-header my-3">All Orders 
		</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Category</th>
					<th scope="col">Date</th>
					<th scope="col">Number</th>
					<th scope="col">Price</th>
					<th scope="col">Status</th>
					<th scope="col"></th>
					<th scope="col"></th>
					<th scope="col"></th>
				</tr>
			</thead>
	
			<tbody>
	<c:forEach var="order" items="${orders}">
				
					<tr>
						<td>${order.ordertype}</td>
						<td>${order.orderdate}</td>
						<td>${order.orderid}</td>
						<td>${order.totalprice}</td>
						<td>狀態：${order.orderstatus}</td>
	
					 	<td>
							<form action="orderDetail" method="post">							
								<input type="hidden" name="orderid" value="${order.orderid}"/>
								<input type="hidden" name="ordertype" value="${order.ordertype}"/>
								<input class="btn btn-sm btn-primary" type="submit" value="詳細">
							</form>
						</td>
					
					</tr>
			</c:forEach>
			</tbody>	
		</table>
	</div>


<%@ include file="../Luana_include/footer.jsp" %>

   
</body>
</html>