<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChiTou</title>
	<%@ include file="/WEB-INF/includes/coco/attraction/AttractionsDescriptionCSS.jsp"%>

<style>
th,td{
text-align:center;
}
</style>

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
			<table class="table table-light table-hover">
			<thead>
				<tr>
					<th scope="col" style="text-align:center;">分類</th>
					<th scope="col">下定日</th>
					<th scope="col">訂單編號</th>
					<th scope="col">總金額</th>
					<th scope="col">訂單狀態</th>
					<th scope="col"></th>
				</tr>
			</thead>
	
			<tbody>
	<c:forEach var="order" items="${orders}">
				
					<tr>
						<td>${order.ordertype}</td>
						<td>${order.orderdate}</td>
						<td>${order.orderid}</td>
						<td>${order.totalprice}元</td>
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