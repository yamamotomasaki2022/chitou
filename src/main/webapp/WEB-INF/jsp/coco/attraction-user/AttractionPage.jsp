<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChiTou-景點門票-景點說明</title>
	<%@ include file="/WEB-INF/includes/coco/attraction/AttractionsDescriptionCSS.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/includes/coco/attraction/Header.jsp"%>
	<!-- 封面滑動照片 -->
	<div class="container my-4">
		<div class="mb-4">
			<div class="slideshow">
				<img src="https://picsum.photos/900/400?random=1" alt="" /> 
			</div>
		</div>

		<br>

		<div class="row justify-content-center">

			<div class="col-lg-6">
				<h3 class="mb-0">${attraction.attName}</h3>
				<br>


				<h4 class="title">｜方案選擇</h4>
				<br>
				<div class="custom-block" data-aos="fade-up">
					<div class="custom-accordion" id="accordion_1">
							<%  int i = 0; 
							String[] index ={"One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen"};
							%>
						<c:forEach var="plans" items="${attraction.pricingplans}">
							<div class="accordion-item">
								<h2 class="mb-0">
									<button class="btn btn-link" type="button"
										data-toggle="collapse" data-target="#collapse<%= index[i] %>"
										aria-expanded="true" aria-controls="collapse<%= index[i] %>">${plans.planname}</button>
								</h2>
	
								<div id="collapse<%= index[i] %>" class="collapse"
									aria-labelledby="heading<%= index[i] %>" data-parent="#accordion_1">
									<div class="accordion-body">
										${plans.plandiscript}<br> ・ 費用不包含:交通費、其他個人消費 <br>
										<div style="float: left;">
											<h3>&nbsp;&nbsp;NT$ ${plans.planfee}</h3>
										</div>
										<form>
											<input type="hidden" id="attractionID" name="attractionID" value="${attraction.attid}">
											<input type="hidden" id="planID" name="planID" value="${plans.planid}">
											<button type="button" style="float: right;"
												class="btn btn-primary text-white py-2 px-2 addToCart">加入購物車</button> <br>
										</form>
									</div>
								</div>
							</div>
							<% i++; %>
						</c:forEach>
					</div>
				</div>
			</div>


			<div class="col-lg-4">
				<div class="custom-block" data-aos="fade-up">
					<div class="custom-accordion" id="accordion_1"></div>

					<div class="custom-block" data-aos="fade-up" data-aos-delay="100">
						<div class="text-center">
							<h2 class="section-title text-center">附近景點</h2>
						</div>
						<div class="owl-single owl-carousel no-nav">
							<div class="testimonial mx-auto">
								<figure class="img-wrap">
									<img src="images/person_2.jpg" alt="Image" class="img-fluid">
								</figure>
								<h3 class="name">Adam Aderson</h3>
								<blockquote>
									<p>&ldquo;There live the blind texts. Separated they live
										in Bookmarksgrove right at the coast of the Semantics, a large
										language ocean.&rdquo;</p>
								</blockquote>
							</div>

							<div class="testimonial mx-auto">
								<figure class="img-wrap">
									<img src="images/person_3.jpg" alt="Image" class="img-fluid">
								</figure>
								<h3 class="name">Lukas Devlin</h3>
								<blockquote>
									<p>&ldquo;There live the blind texts. Separated they live
										in Bookmarksgrove right at the coast of the Semantics, a large
										language ocean.&rdquo;</p>
								</blockquote>
							</div>

							<div class="testimonial mx-auto">
								<figure class="img-wrap">
									<img src="images/person_4.jpg" alt="Image" class="img-fluid">
								</figure>
								<h3 class="name">Kayla Bryant</h3>
								<blockquote>
									<p>&ldquo;There live the blind texts. Separated they live
										in Bookmarksgrove right at the coast of the Semantics, a large
										language ocean.&rdquo;</p>
								</blockquote>
							</div>

						</div>
					</div>

				</div>
			</div>
		</div>
	</div>


	<div class="untree_co-section">
		<div class="container">
			<!-- <div class="row justify-content-center mb-5"> -->
			<div class="col-md- text">
				${attraction.attDescription}
			</div>
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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
$('.addToCart').on('click',function(e){
	console.log(e.target.closest('form'))
	var form = new FormData(e.target.closest('form'));
	var attraction = 'attractionId=' + form.get('attractionID');
    var plan = 'planId=' + form.get('planID');
    $.ajax({
		type:"get",
		url:"addToCart?" + attraction + "&" + plan,
		contentType:"application/json",
		success:function(data){
			console.log(data)
			if(data == true){
				Swal.fire({
					  position: 'top-end',
					  toast: true,
					  title: '成功加入購物車!',
					})
			}else{
				Swal.fire({
					  position: 'top-end',
					  toast: true,
					  title: '尚未登入!',
					  confirmButtonText:'<i class="fa fa-thumbs-up"></i>馬上登入',
					  showCancelButton: true,
				}).then((result) => {
					if (result.isConfirmed) {
						location.href='toAdminLoginPage'
					}
				})
			}
		}
	});
})
</script>


</body>
</html>