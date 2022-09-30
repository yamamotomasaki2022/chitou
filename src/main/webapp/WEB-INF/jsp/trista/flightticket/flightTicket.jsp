<%@page import="org.springframework.context.annotation.Bean"%>
<%@page import="java.util.List"%>
<%@page import="tw.trista.flightticket.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>預訂機票</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link href="https://img.onl/DOO7l" rel="icon" type="image/png" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript"></script>
<style>







</style>

<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>

</head>

<body>


	<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>

	<fieldset>
		<h1 class="card-title text-primary">&nbsp;機票總覽</h1>
			<p class="card-description" href="ListFlightTicket">
		<a href="addFlightTicket">
			<button id="receive" type="button" class="btn btn-inverse-primary btn-fw">
				<i class="ti-plus"></i>&nbsp;新增機票
			</button>
		</a>
	</p>
			<form action="searchFlightTicket" method="post" enctype="multipart/form-data">
			<input type="text" name="search" class="form-control">
			<input type="submit" name="searchno" class="btn btn-info" value="搜尋">
			</form>
			
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
					
<!-- 					<th>購票須知:</th> -->
					<th>修改/刪除:</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="flightticket" items="${listFlightTicket}">
					<tr>
						<form action="updateFlightTicket" method="get">
							<td><c:out value="${flightticket.airline}" /></td>
							<td><c:out
									value="${flightticket.flightid}" /></td>
							<td><c:out value="${flightticket.originid}" /></td>
							<td><c:out value="${flightticket.departuretime}" /></td>
							<td><c:out value="${flightticket.destinationid}" /></td>
							<td><c:out value="${flightticket.arrivaltime}" /></td>
							<td><c:out value="${flightticket.classid}" /></td>
							<td><c:out value="${flightticket.fare}" /></td>

							
							

							<td>
							<input type="hidden" name="flightid"
								value="${flightticket.flightid}"> 
								<input type="hidden"
								name="originid"
								value="${flightticket.originid}">
								<input
								type="hidden" name="departuretime" value="${flightticket.departuretime}">
								<input type="hidden" name="destinationid"
								value="${flightticket.destinationid}"> 
								<input type="hidden"
								name="arrivaltime" value='${flightticket.arrivaltime}'>
								<input type="hidden" name="classid"
								value="${flightticket.classid}">
								<input type="hidden"
								name="fare"
								value="${flightticket.fare}">

								<button type="submit" name="update"
									class="btn btn-inverse-success btn-icon">
									<i class="ti-pencil-alt"></i>
								</button> &nbsp; &nbsp;
						</form>
						<!-- 刪除 -->
						<a href="deleteFlightTicket?flightid=${flightticket.flightid}"><button
								class="btn btn-inverse-danger btn-icon">
								<i class="ti-trash"></i>
							</button></a>
						</td>
				</c:forEach>
			</tbody>
		</table>



	<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>

	
	<script>
			function check(action) {
				let msg = '';
				if (action === '刪除') {
					return message('確定刪除嗎?');
				} else if (action === '修改') {
					return message('確定更新嗎?');
				} else {
					return true;
				}
			}

			function message(msg) {
				if (confirm(msg)) {
					return true
				} else {
					return false
				}
			}

		})
	</script>
</body>
</html>