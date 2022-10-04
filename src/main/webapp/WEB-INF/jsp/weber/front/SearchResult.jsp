<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%response.setContentType("text/html;charset=UTF-8");%>
<!DOCTYPE html>
<html>
  <head>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8" />
    <title>Chitou</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="/js/weber/daterangepicker/moment.min.js"></script>
	<script type="text/javascript" src="/js/weber/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/js/weber/daterangepicker/daterangepicker.css" />
	
<!-- 	<link rel="preconnect" href="https://fonts.googleapis.com"> -->
<!-- <link rel="preconnect" href="https://fonts.gstatic.com"> -->

<!-- <link rel="stylesheet" -->
<!-- 	href="/css/beforehomepage/fonts/icomoon/style.css"> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="/css/beforehomepage/fonts/flaticon/font/flaticon.css"> -->

<!-- <link rel="stylesheet" href="/css/beforehomepage/css/tiny-slider.css"> -->
<!-- <link rel="stylesheet" href="/css/beforehomepage/css/aos.css"> -->
<!-- <link rel="stylesheet" href="/css/beforehomepage/css/style.css"> -->
  </head>
<body>
<%@ include file="/WEB-INF/includes/Header.jsp"  %>
	<br>
	<div align="center">
	    <form>
	    前往
	    <select id="destination" name="destination">
	    </select>
	    入住日期
	    <input type="text" id="date" name="date">
	    <input type="hidden" id="dateStart" name="dateStart">
	    <input type="hidden" id="dateEnd" name="dateEnd">
	    人數
	    <input type="number" name="number" style="width:50px;">人
	    <button type="button" id="search">搜尋</button>
	    </form>
	</div>
	<br>
		<div class="container">
					<div class="row" id="searchResult">
						<c:forEach var="bean" items="${result}">
						<div class="col-md-4 col-sm-4 col-xs-12">
							<div class="single-awesome-project">
								<img src="images/weber/hotel/hotelNB${bean.hotelID}/photo1.jpg" alt="Image" class="img-fluid">

								<div class="project-dec-2">
									<div>
										<span class="d-block mb-2 text-black-50"><i
											class="fa-solid fa-location-dot"></i> ${bean.name}</span> <span
											class="city d-block mb-3">${bean.address}</span>
										<div class="specs d-flex mb-4">
											<span class="d-block d-flex align-items-center me-3">
												<span class="icon-bed me-2"></span> <span class="caption">
													平均房價:${bean.averagePrice}
												</span>
											</span>
										</div>

										<a href="/hotelPage?dateStart=${dateStart}&dateEnd=${dateEnd}&number=${number}&hotelID=${bean.hotelID}" class="btn btn-primary py-2 px-3"
											style="background-color: lightblue">詳細</a>
										<span style="color:blue">還剩${bean.amount}間房</span>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>
		</div>
	<script type="text/javascript" src="/js/weber/SearchResult.js"></script>
</body>
</html>