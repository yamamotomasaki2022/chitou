<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChiTou-景點門票-景點說明</title>
	<%@ include file="/WEB-INF/includes/coco/attraction/AttractionsDescriptionCSS.jsp"%>
<style>
.zoomImage{
    width:100%;
    height:0;
    padding-bottom: 100%;
    overflow:hidden;
    background-position: center center;
    background-repeat: no-repeat;
    -webkit-background-size:cover;
    -moz-background-size:cover;
    background-size:cover;
}
</style>
<%-- 	<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%> --%>
<!-- 	<script src="/js/coco/hoverable-collapse.js"></script> -->
<!-- <script src="/js/coco/template.js"></script> -->
</head>
<body class="body2">
	<%@ include file="/WEB-INF/includes/coco/attraction/Header.jsp"%>
	<!-- 封面滑動照片 -->
	<div class="container my-4">
		<div class="mb-4">
<!-- 			<div class="slideshow"> -->
				<img src="/images/coco/attractionpicture/${attraction.photo}" alt="" height="70%" width="70%" style="display:block;margin:auto;"/> 
<!-- 			</div> -->
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
										${plans.plandiscript}<br> <br>
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
							<h2 class="section-title text-center">推薦景點</h2>
						</div>
						<div class="owl-single owl-carousel no-nav">
							<div class="testimonial mx-auto">
								<figure class="img-wrap">
									<img src="images/coco/newhomepage/image4.jpg" alt="Image" class="img-fluid">
								</figure>
								<h3 class="name">遠雄海洋樂園</h3>
								<blockquote>
									<p>&ldquo;遠雄海洋公園座落於臺灣最美麗的東海岸風景區(花蓮縣壽豐鄉鹽寮村)，緊鄰著太平洋左岸，是台灣第一座最大最美且具國際水準的海洋休閒、旅遊及渡假的王國，總面積達51公頃，由遠雄企業團
									歷經10年籌劃、總投資額150億元，聘請世界61個專業規劃團隊，集合世界300位以上主題樂園專家規劃設計，獲得國際組織極高評價與肯定。&rdquo;</p>
								</blockquote>
							</div>

							<div class="testimonial mx-auto">
								<figure class="img-wrap">
									<img src="images/coco/newhomepage/image5.jpg" alt="Image" class="img-fluid">
								</figure>
								<h3 class="name">麗寶樂園</h3>
								<blockquote>
									<p>&ldquo;台中「麗寶樂園」有最廣為人知的探索樂園、刺激又好玩的水上樂園馬拉灣，加上麗寶OUTLET和國際認證的麗寶賽車場，還有各式主題表演和節慶活動
									，並可入住豪華五星級福容大飯店，精彩豐富的主題將整座園區規畫成全台最大的渡假區，一站就能滿足所有吃喝玩樂！&rdquo;</p>
								</blockquote>
							</div>

							<div class="testimonial mx-auto">
								<figure class="img-wrap">
									<img src="images/coco/newhomepage/image6.jpg" alt="Image" class="img-fluid">
								</figure>
								<h3 class="name">六福村樂園</h3>
								<blockquote>
									<p>&ldquo;由「美國大西部」、「南太平洋」、「阿拉伯皇宮」以及「非洲部落」等四大異國主題村所建構成，加上2012年推出「六福水樂園」，高達75公頃的廣闊遊樂場域，除了擁有30項以上廣受年輕人喜愛的驚險刺激遊樂設施以及適合親子同遊的野生動物園外，還有定時演出的音樂水舞秀、
									媲美迪士尼的大型花車遊行等各項精彩歌舞表演，六福村期望能帶給消費者更多身心靈上的感動與滿足。&rdquo;</p>
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
			
				<h4 class="title">｜地圖</h4>
				<br>

<iframe width="100%" 
    height="300" 
    frameborder="0"
    src="https://www.google.com/maps/embed/v1/place?key=AIzaSyD_ncUVLw0kJwbHqd4OTiualgb9dcHsJkw&amp;q=${attraction.attLocation}&amp;zoom=18&amp;language=zh-tw" 
 allowfullscreen="allowfullscreen" data-gtm-yt-inspected-79="true" style="border: 0px;"></iframe>

				<br>
								<h4 class="title">｜商品說明</h4>
				<br>
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

  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBCkWcfKD9e877LyMp6uSRygXFVyuiL4II&callback=initMap"></script>
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


    <script async
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBCkWcfKD9e877LyMp6uSRygXFVyuiL4II&libraries=places&callback=initMap&region=TW&language=zh-TW"></script>

</body>
</html>