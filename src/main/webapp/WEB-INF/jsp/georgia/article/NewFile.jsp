<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
</link>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
</link>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

<style>
.owl-theme .item {
  height: 15rem;
  background: #ffa;
  <!--padding: 1rem;-->
}

.owl-carousel .item h4 {
  color: #fff;
  font-weight: 400;
  font-size: 1.4375rem;
  margin-top: 0rem;
}

img{
height:15rem;
}
</style>
</head>
<body>
<div class="owl-carousel owl-theme">
  <div class="item">
  <img alt="" src="images/georgia/picture/japan-1.jpg">
    <h4>1</h4>
  </div>
  <div class="item">
  <img alt="" src="images/georgia/picture/japan-2.jpg">
    <h4>2</h4>
  </div>
  <div class="item">
  <img alt="" src="images/georgia/picture/japan-3.jpg">
    <h4>3</h4>
  </div>
  <div class="item">
  <img alt="" src="images/georgia/picture/chihuahua.jpg">
    <h4>4</h4>
  </div>
  <div class="item">
  <img alt="" src="images/georgia/picture/usa-3.jpg">
    <h4>5</h4>
  </div>
  <div class="item">
  <img alt="" src="images/georgia/picture/usa-2.jpg">
    <h4>6</h4>
  </div>
  <div class="item">
  <img alt="" src="images/georgia/picture/usa-1.jpg">
    <h4>7</h4>
  </div>
  <div class="item">
  <img alt="" src="images/georgia/picture/dog-1.jpg">
    <h4>8</h4>
  </div>
  <div class="item">
  <img alt="" src="images/georgia/picture/cat2.jpg">
    <h4>9</h4>
  </div>
  <div class="item">
  <img alt="" src="images/georgia/picture/PZk9iuah.jpg">
    <h4>10</h4>
  </div>
  <div class="item">
  <img alt="" src="images/georgia/picture/354617.jpg">
    <h4>11</h4>
  </div>
  <div class="item">
  <img alt="" src="images/georgia/picture/20161028204251-a3e603f2.jpg">
    <h4>12</h4>
  </div>
</div>


<script>
$(".owl-carousel").owlCarousel({
	 //items:4,
	    loop:true,
	    margin:10,
	    autoplay:true,
	    autoplayTimeout:1000,
	    autoplayHoverPause:true,
	    autoWidth:true
	});
</script>
</body>
</html>