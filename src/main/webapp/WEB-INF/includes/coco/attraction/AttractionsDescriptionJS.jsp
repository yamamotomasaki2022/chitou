<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--icon-->
	<script src="https://kit.fontawesome.com/6c4c414686.js" crossorigin="anonymous"></script>
	 <!--版型-->
 	<script src="${pageContext.request.contextPath}/js/coco/bootstrap/Chart.min.js"></script>
 	 <!--bootstrap-->
 	
 	
 	
 	
  <script src="${pageContext.request.contextPath}/js/coco/bootstrap/jquery-3.4.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/coco/bootstrap/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/coco/bootstrap/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/coco/bootstrap/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/coco/bootstrap/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/coco/bootstrap/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/coco/bootstrap/jquery.fancybox.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/coco/bootstrap/aos.js"></script>
  <script src="${pageContext.request.contextPath}/js/coco/bootstrap/moment.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/coco/bootstrap/daterangepicker.js"></script>

  <script src="${pageContext.request.contextPath}/js/coco/bootstrap/typed.js"></script>
  <!--整個js-->
  <script src="${pageContext.request.contextPath}/js/coco/bootstrap/custom.js"></script>
  <script>
    $('.slideshow').each(function () {

      let slideImgs = $(this).find('img'),
        slideImgsCount = slideImgs.length,
        currentIndex = 0;

      slideImgs.eq(currentIndex).fadeIn();

      setInterval(showNextSlide, 5000);

      function showNextSlide() {
        let nextIndex = (currentIndex + 1) % slideImgsCount;
        console.log(nextIndex)
        slideImgs.eq(currentIndex).fadeOut();
        slideImgs.eq(nextIndex).fadeIn();
        currentIndex = nextIndex;
      }
    })
  </script>
<!--   <script src="js/coco/bootstrap/bootstrap.bundle.min.js"></script> -->
