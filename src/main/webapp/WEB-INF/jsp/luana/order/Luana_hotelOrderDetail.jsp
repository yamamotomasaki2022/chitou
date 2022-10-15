<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChiTou</title>
	<%@ include file="/WEB-INF/includes/coco/attraction/AttractionsDescriptionCSS.jsp"%>



</head>
<body class="body2">
	<%@ include file="/WEB-INF/includes/coco/attraction/Header.jsp"%>
	<!-- 封面滑動照片 -->
	<div class="container my-4">
		<div class="mb-4" style="height:100px">

		</div>

		<br>

		<div class="row justify-content-center">

			<div class="col-12" style="display:inline-block;float:left;">
			<table class="table table-light">
			<thead>
				<c:forEach var="order" items="${orderList}">
				<tr>
					<th scope="col">訂單編號：${order.orderid}</th>
					<th scope="col">訂單類別：${order.ordertype}</th>
					<th scope="col">下訂日：${order.orderdate}</th>
					<th scope="col">總金額：${order.totalprice} 元</th>
					<th scope="col">狀態：${order.orderstatus}</th>

				</tr>
				</c:forEach>
			</thead>
			<tbody>
	<c:forEach var="hOrder" items="${hOrderDetail}">
				
					<tr>
						<td><a href="/hotelPage?hotelID=${hOrder.hotelID}">${hOrder.hotelName} ${hOrder.roomName}</a></td>
						<td>入住日：${hOrder.checkInDate}</td>
						<td>退房日：${hOrder.checkOutDate}</td>
						<td>入住人數：${hOrder.numberOfPeople}</td>
						<td>是否加床：${hOrder.addBed}</td>
						
					</tr>
					
					<tr>
						<td>訂購人：${hOrder.booker}</td>
						<td>聯絡信箱：${hOrder.email}</td>
						<td>聯絡電話：${hOrder.phone}</td>
						<td></td>
						<td></td>
					</tr>
			</c:forEach>
			</tbody>	
		</table>
			</div>



		</div>
	</div>


	<div class="untree_co-section">
		<div class="container">
		</div>
		
	</div>
	<%@ include file="/WEB-INF/includes/coco/attraction/Footer.jsp"%>

	<div id="overlayer"></div>
	<div class="loader">
		<div class="spinner-border" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>


	<%@ include file="/WEB-INF/includes/coco/attraction/AttractionsDescriptionJS.jsp"%>



</body>
</html>