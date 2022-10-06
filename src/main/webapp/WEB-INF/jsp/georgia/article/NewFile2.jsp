<%@page import="javax.management.MBeanAttributeInfo"%>
<%@page
	import="java.sql.Connection, java.util.*, javax.sql.*, javax.servlet.*,  javax.naming.*,java.io.*,java.sql.* ,tw.georgia.article.model.*,tw.georgia.article.controller.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
<head>
<!--<meta charset="UTF-8">-->
<title>Insert title here</title>
<link href="https://img.onl/DOO7l" rel="icon" type="image/png" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
</link>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
</link>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

<style>
#BackTop	{
				position:fixed;				
				bottom:140px;
				right:31px;
				}
#ToBottom	{
				position:fixed;				
				bottom:90px;
				right:31px;
				}
.jiantou	{
				width: 2.7rem;
				height: 2.7rem;
				color:rgb(75,73,172);
				}
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

table{
background-color: #FFFDD0;
border: 2px solid black;
}
</style>

<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>
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
<table style="width:100%;">
<tbody>
	<tr>
		<td style="width:16%;background-color: #fff;"><div></div></td>
		<td style="width:2%;background-color: #f0f;"><div></div></td>
		<td style="width:40%;background-color: #ff0;"><div></div></td>
		<td style="width:2%;background-color: #fff;"><div></div></td>
		<td style="width:40%;background-color: #f0f;">
			<div>
				<table>
					<tbody>
						<tr><td>1</td></tr>
						<tr><td>2</td></tr>
					</tbody>
				</table>
			</div>
		</td>
	</tr>
</tbody>
</table>

<svg type="button" id="BackTop" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-circle-fill jiantou" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 0 0 8a8 8 0 0 0 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
</svg>
<svg type="button" id="ToBottom" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-circle-fill jiantou" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z"/>
</svg>

<script>
$(function() {
$('#BackTop').click(function(){ 
	$('html,body').animate({scrollTop:0}, 200);
});
$('#ToBottom').click(function(){ 
	$('html,body').animate({scrollTop:document.body.scrollHeight}, 200);
});

$(".owl-carousel").owlCarousel({
	 //items:4,
	    loop:true,
	    margin:10,
	    autoplay:true,
	    autoplayTimeout:1500,
	    autoplayHoverPause:true,
	    autoWidth:true
	});
	
})
</script>
</body>
</html>