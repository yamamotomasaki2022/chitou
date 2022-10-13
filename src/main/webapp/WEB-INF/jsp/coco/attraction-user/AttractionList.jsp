<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChiTou-景點門票-景點總覽</title>
<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>

<!-- 分頁 -->
<link rel="stylesheet" type="text/css" href="css/coco/bobson/master.css">
<!--font-awesome.min.css -->
<link rel="stylesheet" href="css/coco/list/font-awesome.min.css">

<!--animate.css -->
<link rel="stylesheet" href="css/coco/list/animate.css">

<!--hover.css -->
<link rel="stylesheet" href="css/coco/list/hover-min.css">

<!--datepicker.css -->
<link rel="stylesheet" href="css/coco/list/datepicker.css">

<!--owl.carousel.css -->
<link rel="stylesheet" href="css/coco/list/owl.carousel.min.css">
<link rel="stylesheet" href="css/coco/list/owl.theme.default.min.css">

<!-- range css -->
<link rel="stylesheet" href="css/coco/list/jquery-ui.min.css">

<!--bootstrap.min.css -->
<link rel="stylesheet" href="css/coco/list/bootstrap.min.css">

<!-- bootsnav -->
<link rel="stylesheet" href="css/coco/list/bootsnav.css">

<!--style.css -->
<link rel="stylesheet" href="css/coco/list/style.css">

<!--responsive.css -->
<link rel="stylesheet" href="css/coco/list/responsive.css">

<!-- js -->
<script src="/js/coco/off-canvas.js"></script>


<script src="assets/js/jquery.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->

		<!--modernizr.min.js-->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>


		<!--bootstrap.min.js-->
		<script src="assets/js/bootstrap.min.js"></script>

		<!-- bootsnav js -->
		<script src="assets/js/bootsnav.js"></script>

		<!-- jquery.filterizr.min.js -->
		<script src="assets/js/jquery.filterizr.min.js"></script>

		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

		<!--jquery-ui.min.js-->
		<script src="assets/js/jquery-ui.min.js"></script>

		<!-- counter js -->
		<script src="assets/js/jquery.counterup.min.js"></script>
		<script src="assets/js/waypoints.min.js"></script>

		<!--owl.carousel.js-->
		<script src="assets/js/owl.carousel.min.js"></script>

		<!-- jquery.sticky.js -->
		<script src="assets/js/jquery.sticky.js"></script>

		<!--datepicker.js-->
		<script src="assets/js/datepicker.js"></script>

		<!--Custom JS-->
		<script src="assets/js/custom.js"></script>
</head>
<body>
<%-- 	<%@ include file="/WEB-INF/includes/coco/attraction/Header.jsp"%> --%>

	<!--about-us start -->
	<section id="home" class="about-us">
		<div class="container">
			<div class="about-us-content">
				<div class="row">
					<div class="col-sm-12">
						<div class="single-about-us">
							<div class="about-us-txt">
								<br>
								<h2>


								</h2>

							</div>
							<!--/.about-us-txt-->
						</div>
						<!--/.single-about-us-->
					</div>
					<!--/.col-->
					<div class="col-sm-0">
						<div class="single-about-us">

						</div>
						<!--/.single-about-us-->
					</div>
					<!--/.col-->
				</div>
				<!--/.row-->
			</div>
			<!--/.about-us-content-->
		</div>
		<!--/.container-->

	</section>
	<!--/.about-us-->
	<!--about-us end -->
	<!--travel-box start-->
	<section class="travel-box">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="single-travel-boxes">
						<div id="desc-tabs" class="desc-tabs">



							<!-- Tab panes -->
							<div class="tab-content">

								<div role="tabpanel" class="tab-pane active fade in" id="tours">
									<div class="tab-para">

										<div class="row">
											<div class="col-lg-12 col-md-4 col-sm-12">
												<div class="single-tab-select-box">

													<h2>搜尋景點</h2>

													<div class="custom-input-group">
														<form action="AttracionSearchName" method="get">
															<input type="text" name="keyword" class="form-control"
																placeholder="輸入您想查詢的景點">
															<button type="submit" class="appsLand-btn subscribe-btn">搜尋</button>
														</form>
														<div class="clearfix"></div>

													</div>



												</div>
												<!--/.single-tab-select-box-->
											</div>
											<!--/.col-->

										</div>
										<!--/.row-->


									</div>
									<!--/.tab-para-->

								</div>
								<!--/.tabpannel-->




							</div>
							<!--/.tab content-->
						</div>
						<!--/.desc-tabs-->
					</div>
					<!--/.single-travel-box-->
				</div>
				<!--/.col-->
			</div>
			<!--/.row-->
		</div>
		<!--/.container-->

	</section>
	<!--/.travel-box-->
	<!--travel-box end-->


	<!--packages start-->
	<section id="pack" class="packages">
		<div class="container">
<!-- 			<div class="gallary-header text-center"> -->
<!-- 				<h2> -->
<!-- 					special packages -->
<!-- 				</h2> -->
<!-- 				<p> -->
<!-- 					Duis aute irure dolor in velit esse cillum dolore eu fugiat nulla. -->
<!-- 				</p> -->
<!-- 			</div> -->
			<!--/.gallery-header-->
			<div class="packages-content">
				<div class="row">
					<c:forEach var="attraction" items="${AttractionList}">
						<div class="col-md-4 col-sm-6">
							<div class="single-package-item">
								<img src="/images/coco/newhomepage/image6.jpg" alt="package-place">
								<div class="single-package-item-txt">
									<h3>${attraction.attName}</h3>
									<div class="packages-para">
										<p>
												<i class="fa fa-angle-right"></i>${attraction.attLocation}
										</p>
										<p>
												<i class="fa fa-angle-right"></i>${attraction.attDescription.substring(3,22)}
										</p>
										<p>
											${attraction.attDescription.substring(22,35)+="......"}<a href="AttractionPage?attID=${attraction.attid}">詳細</a>
										</p>
										
									</div>
									<!--/.packages-review-->
									<div class="about-btn">
										<a href="AttractionPage?attID=${attraction.attid}">
										<button class="about-view packages-btn">
											詳細內文
										</button>
										</a>
									</div>
									<!--/.about-btn-->
								</div>
								<!--/.single-package-item-txt-->
							</div>
							<!--/.single-package-item-->
	
						</div>
					<!--/.col-->
					</c:forEach>

			<!--wrap clearfix-->

			<div class="pageBox">

				<ul class="clearfix">



					<li><a href="video_1.html" class="active">1</a></li>


					<li><a href="video_2.html">2</a></li>


					<li><a href="video_3.html">3</a></li>


					<li><a href="video_4.html">4</a></li>


					<li><a href="video_5.html">5</a></li>


					<li><a href="video_6.html">6</a></li>


					<li><a href="video_7.html">7</a></li>




					<li><a href="video_2.html" class="function">next</a></li>

					<li><a href="video_12.html" class="function">last</a></li>


				</ul>

			</div>



		</div>
	<%@ include file="/WEB-INF/includes/coco/attraction/Footer.jsp"%>

</body>
</html>