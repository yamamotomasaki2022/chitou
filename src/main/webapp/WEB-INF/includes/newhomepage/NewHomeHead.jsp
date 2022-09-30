<%@page language="java"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
	<link rel="shortcut icon" href="/images/coco/favicon.png" />
	
<link rel="stylesheet" href="/css/coco/feather.css">
<link rel="stylesheet" href="/css/coco/vendor.bundle.base.css">
<link rel="stylesheet" href="/css/newhomepage/css/dataTables.bootstrap4.css">
<link rel="stylesheet" href="/css/coco/themify-icons.css"> 
<link rel="stylesheet" type="text/css" href="/css/newhomepage/css/select.dataTables.min.css">
	<link rel="stylesheet" href="/css/coco/vertical-layout-light/style.css">

	
	
	
	
	<link rel="stylesheet" href="/css/newhomepage/css/style.css">
	<link rel="stylesheet" href="/css/newhomepage/css/kang5.css">
	<link rel="stylesheet" href="/css/newhomepage/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/newhomepage/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/css/newhomepage/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="/css/newhomepage/css/jquery.fancybox.min.css">
	<link rel="stylesheet" href="/css/newhomepage/css/fonts/style.css">
	
	<link rel="stylesheet" href="/css/newhomepage/css/flaticon.css">
	<link rel="stylesheet" href="/css/newhomepage/css/daterangepicker.css">
	<link rel="stylesheet" href="/css/newhomepage/css/aos.css">
	<link rel="stylesheet" href="/css/newhomepage/css/co/style.css">
	<link rel="stylesheet" href="/css/newhomepage/css/kang.css">
	<link rel="stylesheet" href="/css/newhomepage/css/kang1.css">
	<link rel="stylesheet" href="/css/newhomepage/css/kang2.css">
	<link rel="stylesheet" href="/css/newhomepage/css/kang3.css">
		


	<link rel="stylesheet" href="css/kang/fonts/icomoon/style.css">
	<link rel="stylesheet" href="css/kang/fonts/flaticon/font/flaticon.css">
	<link rel="stylesheet" href="css/kang/css/tiny-slider.css">
	
	
	<script src="https://kit.fontawesome.com/6c4c414686.js" crossorigin="anonymous"></script>
	<script src="/js/coco/vendor.bundle.base.js"></script>
	
	
	
	<script src="/css/newhomepage/css/js/Chart.min.js"></script>
	<script src="/css/newhomepage/css/js/jquery.dataTables.js"></script>
	<script src="/css/newhomepage/css/js/dataTables.bootstrap4.js"></script>
	<script src="/css/newhomepage/css/js/dataTables.select.min.js"></script>
	
<script src="/js/coco/off-canvas.js"></script>
<script src="/js/coco/hoverable-collapse.js"></script>
<script src="/js/coco/template.js"></script>
<script src="/js/coco/settings.js"></script>
<script src="/js/coco/todolist.js"></script>
	
	
	<script src="/css/newhomepage/css/js/dashboard.js"></script>
	
	<script src="/css/newhomepage/css/js/jquery-3.4.1.min.js"></script>
	<script src="/css/newhomepage/css/js/popper.min.js"></script>
	<script src="/css/newhomepage/css/js/bootstrap.min.js"></script>
	<script src="/css/newhomepage/css/js/owl.carousel.min.js"></script>
	<script src="/css/newhomepage/css/js/jquery.animateNumber.min.js"></script>
	<script src="/css/newhomepage/css/js/jquery.waypoints.min.js"></script>
	<script src="/css/newhomepage/css/js/jquery.fancybox.min.js"></script>
	<script src="/css/newhomepage/css/js/aos.js"></script>
	<script src="/css/newhomepage/css/js/moment.min.js"></script>
	<script src="/css/newhomepage/css/js/daterangepicker.js"></script>
	<script src="/css/newhomepage/css/js/typed.js"></script>


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
		<script src="/css/newhomepage/css/co/bootstrap.bundle.min.js"></script>
		<script src="/css/newhomepage/css/co/tiny-slider.js"></script>
		<script src="/css/newhomepage/css/co/aos.js"></script>
		<script src="/css/newhomepage/css/co/navbar.js"></script>
		<script src="/css/newhomepage/css/co/counter.js"></script>
		<script src="/css/newhomepage/css/co/custom.js"></script>
		
		<script src="/css/newhomepage/css/js/custom.js"></script>
	
	
