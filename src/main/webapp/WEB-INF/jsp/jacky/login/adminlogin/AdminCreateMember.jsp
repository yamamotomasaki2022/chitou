<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>

<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8" />
<TITLE>管理員創建會員</TITLE>
<link href="https://img.onl/DOO7l" rel="icon" type="image/png" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
form label {
	display: inline-block;
	width: 100px;
}

form div {
	margin-bottom: 10px;
}

.error {
	color: red;
	margin-left: 5px;
}

label.error {
	display: inline;
}
</style>

<script>
	function getTime() {
		var currentTime = new Date();
		return currentTime
	}
</script>

	<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>


</head>

<body>

<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>

	<H1>管理員創建會員</H1>

	<h5>jQuery 驗證其中幾個欄目</h5>
	<FORM ACTION="admininsertmember" method="post" id="form" enctype="multipart/form-data"  >
		<!--  ><div><input type="hidden" name="memberid" value="1"></div> -->

		<div>
			<label> userID</label> <br> </a><input type="text" id="username"
				name="username" autocomplete="off" size="10">
		</div>

		<div>
			<label for=""> password</label> <br> </a><input type="text"
				id="password" name="password" autocomplete="off" size="10">
		</div>

		<p>
			Photo:<br /> 
			<img id="img1" alt="" src=""><br>
			<input  id= "myfile" type="file" name="myFile" />
			
		</p>


		<div>
			<label for=""> email</label> <br> </a><input type="text" id="email"
				name="email" autocomplete="off" size="10">
		</div>


		<hr>


		<INPUT TYPE="submit" id="createmember" name="submit" value="提交">

	</form>
	<br>
	<FORM ACTION="AdminHomePage" method="post">
		<button onclick="">返回</button>
	</form>


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


<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>


</body>
</html>