
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login</title>

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
									<span>${errors.name}</span>
								</div>
								<div class="form-group">
									<input type="password" class="form-control form-control-lg"
										id="password" placeholder="Password" name="password">
									<span>${errors.pwd}</span>
								</div>

								<!-- 								<div class="g-recaptcha" -->
								<!-- 									data-sitekey="6LcI-2siAAAAAHuP2lvgTvgCDMK1zqeoog8wmoO1"> -->
								<!-- 								</div> -->

								<!-- 谷歌驗證 -->
<!-- 								<div class="g-recaptcha" id="rcaptcha" -->
<!-- 									data-sitekey="6LcI-2siAAAAAHuP2lvgTvgCDMK1zqeoog8wmoO1"></div> -->
<!-- 								<span id="captcha" style="color: red" /></span> -->
								<!-- this will show captcha errors -->

								<div class="mt-3">
									<button
										class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"
										type="submit" value="login">登入</button>
									<span>${errors.msg}</span>
								</div>

								<div></div>
								<div
									class="my-2 d-flex justify-content-between align-items-center">
									<div class="form-check">
										<label class="form-check-label text-muted"> <input
											type="checkbox" class="form-check-input"
											name="jacky-rememberme"> 記住我的認證
										</label>
									</div>
									<a href="/toForgetPassword" class="auth-link .text-primary">忘記密碼</a>
								</div>
								<div class="mb-2">
									<button type="button"
										class="btn btn-social-icon btn-outline-facebook">
										<i class="ti-facebook"></i>
									</button>

									<!-- 									<button type="button" -->
									<!-- 										class="btn btn-social-icon btn-outline-google"> -->
									<!-- 										<i class="ti-google"></i> -->
									<!-- 									</button> -->


									<a href='/oauth2/authorization/google'>
										<button type="button"
											class="btn btn-social-icon btn-outline-google">
											<i class="ti-google"></i>
										</button>
									</a>



								</div>


								<hr>
							</form>
							<div>

								<input id="tomember" type="button" class="btn btn-primary mr-2"
									value="會員" style="float: left; background-color: #2AAC16">

								<!-- 								<form action="toAdminLoginPage"> -->
								<input id="toadmin" type="button" class="btn btn-primary mr-2"
									value="管理員" style="float: right; background-color: #2AAC16">
								<!-- 								</form> -->
							</div>

							<br> <br> <br>

							<div id="fastinputtotal">

								<!-- 								<form action="toMemberRegisterPage"> -->
								<!-- 									<input type="submit" class="btn btn-primary mr-2" value="注冊" -->
								<!-- 										style=""background-color:#2AAC16"> -->

								<!-- 								</form> -->


								<button type="button" class="btn btn-primary mr-2"
									id="fastinput" style="float: right">老闆一鍵登入</button>

								<button type="button" class="btn btn-primary mr-2"
									id="fastinput2" style="float: left">管理員一鍵登入</button>

								<div style="text-align: center">
									<button type="button" class="btn btn-primary mr-2"
										id="fastinput3" style="float: left">會員一鍵登入</button>

								</div>

							</div>


							<div>
								<a href="toMemberRegisterPage"><button id="fastinput4"
										type="button" class="btn btn-primary mr-2"
										style="float: right">注冊</button></a>
							</div>


						</div>
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

			$('#username').val('jacky')
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

