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
  <img alt="" src="images/georgia/picture/chihuahua.jpg">
    <h4>3</h4>
  </div>
  <div class="item">
  <img alt="" src="images/georgia/picture/japan-3.jpg">
    <h4>4</h4>
  </div>
  <div class="item">
    <h4>5</h4>
  </div>
  <div class="item">
    <h4>6</h4>
  </div>
  <div class="item">
    <h4>7</h4>
  </div>
  <div class="item">
    <h4>8</h4>
  </div>
  <div class="item">
    <h4>9</h4>
  </div>
  <div class="item">
    <h4>10</h4>
  </div>
  <div class="item">
    <h4>11</h4>
  </div>
  <div class="item">
    <h4>12</h4>
  </div>
</div>


<script>
$(".owl-carousel").owlCarousel({
	  loop: true, // 循環播放
	  margin: 10, // 外距 10px
	  nav: true, // 顯示點點
	  responsive: {
	    0: {
	      items: 1 // 螢幕大小為 0~600 顯示 1 個項目
	    },
	    600: {
	      items: 3 // 螢幕大小為 600~1000 顯示 3 個項目
	    },
	    1000: {
	      items: 4 // 螢幕大小為 1000 以上 顯示 5 個項目
	    }
	  }
	});
</script>
</body>
</html>