<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>忘記密碼頁面</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<%@ include
	file="/WEB-INF/includes/coco/attraction/AttractionsDescriptionCSS.jsp"%>

</head>
<body>


	<%@ include file="/WEB-INF/includes/coco/attraction/Header.jsp"%>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>


	<h1 id="fun">笑死，誰叫你忘記密碼，重辦！</h1>

	<form action="/sendVerificationMailFromForgetPassword">




		<div class="form-group">
			<label>請輸入您的郵箱</label> 
			<input type="text"
				class="form-control form-control-lg" id="email" placeholder="email"
				name="email">
		</div>



		<div class="mt-3" style="float:left">
			<button class="btn btn-inverse-primary btn-fw" id="availablecheck" type="button" value="login">檢查賬號是否可用</button>
		</div>

		<span id="infobox"></span>

<br>


		<div id="btn">
			<a href="/home"><button class="btn btn-inverse-primary btn-fw" type="button">返回主頁面</button></a>

		</div>


	</form>

	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script type="text/javascript">
		$('#availablecheck').on('click', function() {
			$.ajax({
				type : 'get',
				url : '/EmailCheckUp?email=' + $('#email').val(),
				success : function(data) {
					console.log(data)

					if (data == false) {
						console.log(1)
// 						$('#btn').prop('disabled', true)
				Swal.fire(
						  '錯誤!',
						  '請輸入有效格式',
						  'error'
						)
						

					} else {
						console.log(2)
// 						$('#btn').prop('disabled', null)
// 						$('#btn').append('<button type="submit">提交</button>')
						var button = ''
						button += 
							`
							<button class="btn btn-inverse-primary btn-fw" type="submit">提交</button>
							`
						$('#btn').append(button)
						

					}

				}

			})

		})
		
		
		setInterval(fundiv,400)
		function fundiv(){
			$('#fun').remove()
		}
		
	</script>




</body>
</html>