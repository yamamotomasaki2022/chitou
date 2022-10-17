
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title><spring:message code="title.login.page" /></title>

<!-- plugins:css -->
<link rel="stylesheet" href="/css/coco/feather.css">
<link rel="stylesheet" href="/css/coco/themify-icons.css">
<link rel="stylesheet" href="/css/coco/vendor.bundle.base.css">
<link rel="stylesheet" href="/css/coco/materialdesignicons.min.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="/css/coco/vertical-layout-light/style.css">
<link rel="shortcut icon" href="/images/coco/favicon.png" />

<style type="text/css">
#auth_button {
	background-color: pink
}

.errormsg {
	color: red;
}
</style>

</head>

<body>

	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper d-flex align-items-center auth px-0">
				<div class="row w-100 mx-">
					<div class="col-lg-4 mx-auto">
						<div class="auth-form-light text-left py-5 px-4 px-sm-5">
							<div class="brand-logo">
								<!-- <img src="../../images/logo1.png" alt="logo"> -->
								<a class="navbar-brand brand-logo mr-5" href="home"><img
									src="/images/coco/logo3.png" class="mr-6" width="auto"
									height="auto" alt="logo" /><img src="/images/coco/logo2.png"
									class="mr-2" alt="logo" /></a>
							</div>
							<form class="pt-3" ACTION="" method="post"
								onsubmit="return validateForm()">
								<script src="https://www.google.come/recaptcha/api.js" async
									defer></script>
								<div class="form-group">
									<input type="text" class="form-control form-control-lg"
										id="username" placeholder="Username" name="username">
									<span class="errormsg">${errors.name}</span>
								</div>
								<div class="form-group">
									<input type="password" class="form-control form-control-lg"
										id="password" placeholder="Password" name="password">
									<span class="errormsg">${errors.pwd}</span>
								</div>

								<!-- 								<div class="g-recaptcha" -->
								<!-- 									data-sitekey="6LcI-2siAAAAAHuP2lvgTvgCDMK1zqeoog8wmoO1"> -->
								<!-- 								</div> -->

								<!-- 								谷歌驗證 -->
								<!-- 								<div class="g-recaptcha" id="rcaptcha" -->
								<!-- 									data-sitekey="6LcI-2siAAAAAHuP2lvgTvgCDMK1zqeoog8wmoO1"></div> -->
								<!-- 								<span id="captcha" style="color: red" /></span> -->
								<!-- this will show captcha errors -->

								<div class="mt-3">
									<button
										class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"
										type="submit" value="login">
										<spring:message code="button.login" />
									</button>
									<span class="errormsg">${errors.msg}</span>
								</div>

								<div></div>
								<div
									class="my-2 d-flex justify-content-between align-items-center">
									<div class="form-check">
										<label class="label text-muted"> <input
											type="checkbox" class="form-check-input"
											name="jacky-rememberme"> <spring:message
												code="label.login.header" />
										</label>
									</div>
									<a href="/toForgetPassword" class="auth-link .text-primary"><spring:message
											code="label.login.forgetpassword" /></a>
								</div>
								<div class="container">
									<div class="mb-2">
										<button type="button"
											class="btn btn-social-icon btn-outline-facebook">
											<i class="fa-brands fa-facebook-f"></i>
										</button>

										<!--          <button type="button" -->
										<!--           class="btn btn-social-icon btn-outline-google"> -->
										<!--           <i class="ti-google"></i> -->
										<!--          </button> -->



										<a href='/oauth2/authorization/google'>
											<button type="button"
												class="btn btn-social-icon btn-outline-google"
												style="float: right;">
												<i class="fa-brands fa-google"></i>
											</button>
										</a>



									</div>

								</div>
								<div class="mb-2">


									<!-- 									<button type="button" -->
									<!-- 										class="btn btn-social-icon btn-outline-google"> -->
									<!-- 										<i class="ti-google"></i> -->
									<!-- 									</button> -->



									<button type="button" class="btn btn-primary mr-2"
										id="fastinput" style="float: right">
										<spring:message code="button.fastlogin.Boss" />
									</button>

									<button type="button" class="btn btn-primary mr-2"
										id="fastinput2" style="float: left">
										<spring:message code="button.fastlogin.Admin" />
									</button>


									<div style="text-align: center">
										<button type="button" class="btn btn-primary mr-2"
											id="fastinput3" style="float: left">
											<spring:message code="button.fastlogin.Member" />
										</button>

									</div>

								</div>


								<div>
									<a href="toMemberRegisterPage"><button id="fastinput4"
											type="button" class="btn btn-primary mr-2"
											style="float: right">
											<spring:message code="button.register" />
										</button></a>
								</div>


								<!-- 								<div class="container"> -->
								<!-- 									<div class="mb-2"> -->
								<!-- 										<button type="button" -->
								<!-- 											class="btn btn-social-icon btn-outline-facebook"> -->
								<!-- 											<i class="fa-brands fa-facebook-f"></i> -->
								<!-- 										</button> -->

								<!-- 										         <button type="button" -->
								<!-- 										          class="btn btn-social-icon btn-outline-google"> -->
								<!-- 										          <i class="ti-google"></i> -->
								<!-- 										         </button> -->



								<!-- 										<a href='/oauth2/authorization/google'> -->
								<!-- 											<button type="button"  -->
								<!-- 												class="btn btn-social-icon btn-outline-google" -->
								<!-- 												style="float: right;"> -->
								<!-- 												<i class="fa-brands fa-google"></i> -->
								<!-- 											</button> -->
								<!-- 										</a> -->



								<!-- 									</div> -->

								<!-- 								</div> -->
						</div>


						<hr>
						</form>
						<div>

							<input id="tomember" type="button" class="btn btn-primary mr-2"
								value="<spring:message code="button.member"/>"
								style="float: left; background-color: #2AAC16">

							<!-- 								<form action="toAdminLoginPage"> -->
							<input id="toadmin" type="button" class="btn btn-primary mr-2"
								value="<spring:message code="button.admin"/>"
								style="float: right; background-color: #2AAC16">
							<!-- 								</form> -->
						</div>

						<br> <br> <br>
						<hr>


						<a href="/toAdminLoginPage?lang=zh" style="float: right"><button
								class="btn btn-primary mr-2">中文</button></a> <a
							href="/toAdminLoginPage?lang=en" style="float: right"><button
								class="btn btn-primary mr-2">English</button></a>


					</div>
				</div>
			</div>
			<!-- content-wrapper ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script src="/js/coco/vendor.bundle.base.js"></script>
	<script src="https://kit.fontawesome.com/6c4c414686.js"
		crossorigin="anonymous"></script>

	<!-- endinject -->
	<!-- Plugin js for this page -->
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="/js/coco/off-canvas.js"></script>
	<script src="/js/coco/hoverable-collapse.js"></script>
	<script src="/js/coco/template.js"></script>
	<script src="/js/coco/settings.js"></script>
	<script src="/js/coco/todolist.js"></script>
	<!-- endinject -->

	<script>
		$('#fastinput').click(function() {

			$('#username').val('boss')
			$('#password').val('123')

		})

		$('#fastinput2').click(function() {

			$('#username').val('admin')
			$('#password').val('123')

		})

		$('#fastinput3').click(function() {

			$('#username').val('jacky850926')
			$('#password').val('123')

		})

		// 		$('#fastinputtotal').on('click','#fastinput3',function() {

		// 			$('#username').val('jacky')
		// 			$('#password').val('123')

		// 		})
	</script>

	<script src='https://www.google.com/recaptcha/api.js'></script>
	<script>
		function get_action(form) {
			var v = grecaptcha.getResponse();
			if (v.length == 0) {
				document.getElementById('captcha').innerHTML = "You can't leave Captcha Code empty";
				return false;
			} else {
				document.getElementById('captcha').innerHTML = "Captcha completed";
				return true;
			}
		}
	</script>

	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script type="text/javascript">
		function validateForm() {
			if (grecaptcha.getResponse()) {
				return true;
			} else {
				Swal
						.fire('Careful!', 'please prove you are not robot',
								'error')
				return false;
			}
		}
	</script>

	<script>
		$(document).ready(function() {
			$('#fastinput3').css('display', 'none')
			$('#fastinput4').css('display', 'none')
		})

		$('#tomember').on('click', function() {

			// 		$('#fastinput').remove()
			// 		$('#fastinput2').remove()
			// 		$('#fastinputtotal').append('<button type="button" class="btn btn-primary mr-2" id="fastinput3">會員一鍵輸入 </button>')
			$('#fastinput').css('display', 'none')
			$('#fastinput2').css('display', 'none')
			$('#fastinput3').css('display', '')
			$('#fastinput4').css('display', '')
		})

		$('#toadmin').on('click', function() {
			// 		$('#fastinput3').remove()
			// 		$('#fastinputtotal').append('<button type="button" class="btn btn-primary mr-2" id="fastinput2"> 管理員一鍵輸入 </button>')
			// 		$('#fastinputtotal').append('<button type="button" class="btn btn-primary mr-2" id="fastinput"> 老闆一鍵輸入 </button>')
			$('#fastinput').css('display', '')
			$('#fastinput2').css('display', '')
			$('#fastinput3').css('display', 'none')
			$('#fastinput4').css('display', 'none')
		})
	</script>




</body>

</html>

