<%@page import="org.eclipse.jdt.internal.compiler.env.IBinaryAnnotation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import= "tw.Luana.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>

<title>訂單結果</title>
<link href="https://img.onl/DOO7l" rel="icon" type="image/png" />

<%@ include file="/Luana_include/head.jsp" %>
</head>
<body>
<%@ include file="/Luana_include/navbar.jsp" %>   

<div class="container">
		<div class="card-header my-3">All Orders 
		<a class="btn btn-sm btn-primary" href="OrdersManu?orders=1"> Refresh</a>
		</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Number</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Status</th>
					<th scope="col">Update</th>
					<th scope="col"></th>
					<th scope="col"></th>
				</tr>
			</thead>
	
			<tbody>
	<c:forEach var="order" items="${orders}">
				
					<tr>
						<td>${order.orderdate}</td>
						<td>${order.attractionName}</td>
						<td>${order.planName}</td>
						<td>${order.quantity}</td>
						<td>${order.planFee}</td>
						<c:choose>
						<c:when test="${order.orderstatus == 1}"> 										
						<td>處理中</td>
						</c:when>
						<c:when test="${order.orderstatus == 2}" > 										
						<td>已完成</td>
						</c:when>
						<c:when test="${order.orderstatus == 3}" > 										
						<td>已取消</td>						
						</c:when>
						</c:choose>
						
						
						<form action="orderStatus" method="post">							
						<td>
						<select class="custom-select" name="orderStatus" >	
							  <option value="1">處理中</option>
							  <option value="2">已完成</option>
							  <option value="3">已取消</option>
						</select>
						<input type="hidden" name="orderId" value="${order.orderId}" >
						</td>
						<td><input class="btn btn-sm btn-primary" type="submit" name="orderStatus" value="Update">
						</td>
						<td>
						<input class="btn btn-sm btn-danger" type="submit" name="deleteOrder" value="Delete"></td>
						</td>
						</form>
					</tr>
			</c:forEach>
			</tbody>	
		</table>
	</div>


<%@ include file="/Luana_include/footer.jsp" %>

   
</body>
</html>