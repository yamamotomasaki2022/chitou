<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import= "tw.luana.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html> 
<head>

<title>景點</title>
<link href="https://img.onl/DOO7l" rel="icon" type="image/png" />

<%@ include file="../Luana_include/head.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/includes/Header.jsp"  %>

	<div>
		<%@ include file="../Luana_include/navbar.jsp"%>
		<div class='container'>
			<div class='card-header my-3'>Plans</div>
			<div class='row'>
			
			<c:forEach var="AttractionPlan" items="${planList}">
				
				<div class='col-md-3'>
					<div class="card" style="width: 18rem;">
						<img class="card-img-top" src="images/themePark.jpg" alt="Card image cap">
					
						
						<div class="card-body">
							<h5 class="card-title">${AttractionPlan.planname}</h5>
							<h6 class="category">${AttractionPlan.planfee}</h6>
							<h6 class="price"></h6>
							<div class="mt-3 d-flex justify-content-between">
								<div class="input-group mb-3">	
									<form  action="addToCart" method="post">
									 <div class="input-group-prepend">
										<input class="btn btn-primary" type="submit" name="addToCart" value="買">
									</div>
						  			<input type="text" name="quantity" value="1">
						   			<input type="hidden" name="attractionId" value="${AttractionPlan.attractionid}">
						   			<input type="hidden" name="planId" value="${AttractionPlan.planid}">
						   			<input type="hidden" name="planName" value="${AttractionPlan.planname}">
						   			<input type="hidden" name="planFee" value="${AttractionPlan.planfee}">
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</c:forEach>
			
			</div>

		</div>


	</div>
	<%@ include file="../Luana_include/footer.jsp"%>
</body>
</html>