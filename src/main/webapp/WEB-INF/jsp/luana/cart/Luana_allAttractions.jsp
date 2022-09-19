<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import= "tw.Luana.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html> 
<head>

<title>景點</title>
<link href="https://img.onl/DOO7l" rel="icon" type="image/png" />

<%@ include file="/Luana_include/head.jsp"%>
</head>
<body>
	<div>
		<%@ include file="/Luana_include/navbar.jsp"%>
		<div class='container'>
			<div class='card-header my-3'>Attractions</div>
			<div class='row'>
			
			<c:forEach var="attraction" items="${allAttractions}">
				
				<div class='col-md-3'>
					<div class="card" style="width: 18rem;">
						<img class="card-img-top" src="images/themePark.jpg" alt="Card image cap">
					
						
						<div class="card-body">
							<h5 class="card-title">${attraction.name}</h5>
							<h6 class="category">${attraction.location}</h6>
							<h6 class="price">${attraction.description}</h6>
							<div class="mt-3 d-flex justify-content-between">
						<form  action="showAttractionPlans" method="post">
						   <input type="hidden" name="attractionId" value="${attraction.attractionId}">
								<input class="btn btn-primary" type="submit" name="chooseAttraction" value="看方案">
								</form>
									
							</div>
						</div>
					</div>
				</div>
				
			</c:forEach>
			
			</div>

		</div>


	</div>
	<%@ include file="/Luana_include/footer.jsp"%>
</body>
</html>