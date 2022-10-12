<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChiTou後台管理系統-管理員創建會員</title>
<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	function getTime() {
		var currentTime = new Date();
		return currentTime
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>
	
	<div class="col-md-6 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<h3 class="card-title text-primary">管理員創建會員</h3>
				<p class="card-description">請輸入要創建的會員資訊</p>
				<form class="forms-sample" ACTION="admininsertmember" method="post" id="form"
		enctype="multipart/form-data">
					<div class="form-group">
						<label>userID</label> <input type="text" id="username" class="form-control"
							name="username" autocomplete="off" placeholder="userID">
					</div>
					<div class="form-group">
						<label>Password</label> <input type="password"
							class="form-control" id="password" name="password"
							autocomplete="off" placeholder="Password">
					</div>
					<div class="form-group">
						<label>Photo</label>
						<div class="input-group col-xs-12">
						<img width="200px" height="200px" id="img1" alt="" src="/images/jacky/login/default1.png">
							<input id= "myfile" type="file" name="myFile"
								class="form-control file-upload-info" placeholder="Upload Image">
							<span class="input-group-append"></span>
						</div>
					</div>

					<div class="form-group">
						<label >email</label>
						<input class="form-control"
							type="text" id="email"
				name="email" autocomplete="off" placeholder="email">
					</div>
				
					<button type="submit" class="btn btn-primary mr-2" id="createmember" name="submit">提交</button>
					<a href="/manager/AdminHomePage"><button type="button" class="btn btn-light" value="返回">返回</button></a>
					<!-- herf=總攬連結 -->
				</form>
				
				
					<br>	
			
				<button id="fastinput" class="btn btn-primary mr-2" > 一鍵輸入</button>
				
				
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

<script>

$('#myfile').on('change', function(e){      
	  const file = this.files[0];//將上傳檔案轉換為base64字串
	      
	  const fr = new FileReader();//建立FileReader物件
	  fr.onload = function (e) {
	    $('#img1').attr('src', e.target.result);//读取的结果放入圖片
	  };
	      
	 // 使用 readAsDataURL 將圖片轉成 Base64
	  fr.readAsDataURL(file);
	});

</script>



<script>
//jQuery的寫法 ： https://www.minwt.com/webdesign-dev/js/21536.html
$(function() {
	$('#form').validate(
			{
				/* 常用檢測屬性
				required:必填
				noSpace:空白
				minlength:最小長度
				maxlength:最大長度
				email:信箱格式
				number:數字格式
				url:網址格式https://www.minwt.com
				 */
				onkeyup : function(element, event) {
					//去除左側空白
					var value = this.elementValue(element).replace(
							/^\s+/g, "");
					$(element).val(value);
				},
				rules : {
					username : {
						required : true
					},
					password : {
						required : true
					},
					email : {
						required : true,
						email : true
					}
				},

				messages : {

					username : {
						required : '必填'
					},
					password : {
						required : '必填'
					},

					email : {
						required : '必填',
						email : 'Email格式不正確'
					},
					url : '網址格式不正確'
				},
				submitHandler : function(form) {
					form.submit();
				}
			});
});

</script>


	<script>
		$('#fastinput').click(function() {

			$('#username').val('jacky')
			$('#password').val('123')
			$('#email').val('testout1234@gmail.com')

		})
	</script>
	
</body>
</html>