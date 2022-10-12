<%@page language="java"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
	<link rel="shortcut icon" href="/images/coco/favicon.png" />
	
<!-- <link rel="stylesheet" href="/css/coco/feather.css"> -->
<!-- <link rel="stylesheet" href="/css/coco/vendor.bundle.base.css"> -->
<!-- <link rel="stylesheet" href="/css/newhomepage/css/dataTables.bootstrap4.css"> -->

	
	
<	<link rel="stylesheet" href="/css/coco/hotelsstyle/style.css">
    	<link rel="stylesheet" href="/css/coco/hotelsstyle/kang5.css">
    	<link rel="stylesheet" href="/css/coco/hotelsstyle/tiny-slider.css">
	
  	<link rel="stylesheet" href="/css/coco/hotelsstyle/styles.css">
	
	<link rel="stylesheet" href="/css/newhomepage/css/kang.css">
	<link rel="stylesheet" href="/css/newhomepage/css/kang1.css">

	


    <link rel="stylesheet" href="/css/homepage/bootstrap.min.css">
    <link rel="stylesheet" href="/css/homepage/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/homepage/owl.theme.default.min.css">
    <link rel="stylesheet" href="/css/homepage/jquery.fancybox.min.css">
    <link rel="stylesheet" href="/css/homepage/style1.css">
    <link rel="stylesheet" href="/css/homepage/flaticon.css">
    <link rel="stylesheet" href="/css/homepage/daterangepicker.css">
    <link rel="stylesheet" href="/css/homepage/aos.css">
    <link rel="stylesheet" href="/css/homepage/style.css">
	
	    	<link rel="stylesheet" href="/css/coco/hotelsstyle/styles.css">
	

    	<link rel="stylesheet" href="/css/coco/hotelsstyle/kang2.css">
    	<link rel="stylesheet" href="/css/coco/hotelsstyle/kang6.css">
	
		<link rel="stylesheet" href="/css/coco/hotelsstyle/tiny-slider.css">
	
	
	
	<script src="https://kit.fontawesome.com/6c4c414686.js" crossorigin="anonymous"></script>	
	<script src="js/coco/hotelsstyle/vendor.bundle.base.js"></script>
       	<script src="js/coco/hotelsstyle/Chart.min.js"></script>
       	<script src="js/coco/hotelsstyle/jquery.dataTables.js"></script>
       	<script src="js/coco/hotelsstyle/dataTables.bootstrap4.js"></script>
       	<script src="js/coco/hotelsstyle/dataTables.select.min.js"></script>
	
	       	<script src="js/coco/hotelsstyle/dashboard.js"></script>
	
	
    	<script src="js/coco/hotelsstyle/jquery-3.4.1.min.js"></script>
       	<script src="js/coco/hotelsstyle/popper.min.js"></script>
       	<script src="js/coco/hotelsstyle/bootstrap.min.js"></script>
       	<script src="js/coco/hotelsstyle/owl.carousel.min.js"></script>
       	<script src="js/coco/hotelsstyle/jquery.animateNumber.min.js"></script>
       	<script src="js/coco/hotelsstyle/jquery.waypoints.min.js"></script>
       	<script src="js/coco/hotelsstyle/jquery.fancybox.min.js"></script>
       	<script src="js/coco/hotelsstyle/aos.js"></script>
       	<script src="js/coco/hotelsstyle/moment.min.js"></script>
       	<script src="js/coco/hotelsstyle/daterangepicker.js"></script>

       	<script src="js/coco/hotelsstyle/typed.js"></script>


	<script>
		$(function () {
			var slides = $('.slides'),
				images = slides.find('img');

			images.each(function (i) {
				$(this).attr('data-id', i + 1);
			})

			var typed = new Typed('.typed-words', {
				strings: ["San Francisco.", " Paris.", " New Zealand.", " Maui.", " London."],
				typeSpeed: 80,
				backSpeed: 80,
				backDelay: 4000,
				startDelay: 1000,
				loop: true,
				showCursor: true,
				preStringTyped: (arrayPos, self) => {
					arrayPos++;
					console.log(arrayPos);
					$('.slides img').removeClass('active');
					$('.slides img[data-id="' + arrayPos + '"]').addClass('active');
				}

			});
		})
	</script>
	<script src="js/coco/hotelsstyle/bootstrap.bundle.min.js"></script>
       	<script src="js/coco/hotelsstyle/tiny-slider.js"></script>
       	<script src="js/coco/hotelsstyle/h/aos.js"></script>
       	<script src="js/coco/hotelsstyle/navbar.js"></script>
       	<script src="js/coco/hotelsstyle/counter.js"></script>
       	<script src="js/coco/hotelsstyle/custom.js"></script>
       	<script src="js/coco/hotelsstyle/h/custom.js"></script>
	
	

	
	
	
	