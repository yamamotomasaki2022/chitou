<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChiTou-創建會員</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<%@ include file="/WEB-INF/includes/jacky/Member/MemberCSSAndJS.jsp"%>
<script>
	function getTime() {
		var currentTime = new Date();
		return currentTime
	}
</script>
</head>
<body>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper d-flex align-items-center auth px-0">
				<div class="row w-100 mx-0">
					<div class="col-lg-10 mx-auto">
						<div class="auth-form-light text-left py-5 px-4 px-sm-5">
							<div class="brand-logo ">
								<img src="/images/coco/logo3.png" alt="logo"> <img
									src="/images/coco/logo2.png" alt="logo">
							</div>
							<h4 class="card-title text-primary">創建會員</h4>
							<h6 class="font-weight-light">請輸入您的個人資料</h6>
							<form class="pt-3" ACTION="MemberRegisterIntoDB" method="post"
								id="form" enctype="multipart/form-data">

								<div class="row">
									<div class="col-md-6">
										<div class="form-group row">
											<label class="col-sm-3 col-form-label">Username<code
													class="text-danger">*</code></label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="username" name="username"
													autocomplete="off" placeholder="Username" />
											</div>
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group row">
											<label class="col-sm-3 col-form-label">password<code
													class="text-danger">*</code></label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="password" name="password"
													autocomplete="off" placeholder="password" />
											</div>
										</div>
									</div>
								</div>


								<div class="row">
									<div class="col-md-6">
										<div class="form-group row">
											<label class="col-sm-3 col-form-label">email<code
													class="text-danger">*</code></label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="email" name="email"
													autocomplete="off" placeholder="email" />
											</div>
										</div>
									</div>


									<div class="col-md-6">
										<div class="form-group row">
											<label class="col-sm-3 col-form-label">Photo</label>
											<div class="col-sm-9">
											<img width="200px" height="200px" id="img1" alt="" src="images/jacky/login/default1.png">
												<input class="form-control" id="myfile" type="file"
													name="myFile" placeholder="Upload Image" />
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6">
										<div class="form-group row">
											<label class="col-sm-3 col-form-label">名字</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="name" name="name"
													autocomplete="off" placeholder="名字" />
											</div>
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group row">
											<label class="col-sm-3 col-form-label">電話</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="phone" name="phone"
													autocomplete="off" placeholder="電話" />
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6">
										<div class="form-group row">
											<label class="col-sm-3 col-form-label">地址</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="address" name="address"
													autocomplete="off" placeholder="地址" />
											</div>
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group row">
											<label class="col-sm-3 col-form-label">昵稱</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="nickname" name="nickname"
													autocomplete="off" placeholder="昵稱" />
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6">
										<div class="form-group row">
											<label class="col-sm-3 col-form-label">國家</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="nationality" name="nationality"
													autocomplete="off" placeholder="國家" />
											</div>
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group row">
											<label class="col-sm-3 col-form-label">生日</label>
											<div class="col-sm-9">
												<input type="date" class="form-control" id="birth" name="birth"
													autocomplete="off" placeholder="生日" />
											</div>
										</div>
									</div>
								</div>


								<div class="row">
									<div class="col-md-6">
										<div class="form-group row">
											<label class="col-sm-3 col-form-label">性別</label>
											<div class="col-sm-9">
												<select class="form-control" name="gender">
													<option value="male">男</option>
													<option value="female">女</option>
												</select>
											</div>
										</div>
									</div>

									
									
									
									
								</div>

<button type="submit" class="btn btn-primary mr-2" id="createmember" name="submit">提交</button>
					<a href="home"><button type="button" class="btn btn-light">返回</button></a> 
<button  type="button" class="btn btn-primary mr-2" id="fastinput" style="float:right;">一鍵輸入</button>
				<!-- herf=總攬連結 -->


							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

	<script>
		$('#myfile').on('change', function(e) {
			const file = this.files[0];//將上傳檔案轉換為base64字串

			const fr = new FileReader();//建立FileReader物件
			fr.onload = function(e) {
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
	
	
	$('#fastinput').click(function(){
		
		$('#username').val('jacky')
		$('#password').val('123')
		$('#email').val('learningma0926@gmail.com')
		$('#name').val('馬提莫')
		$('#phone').val('0909223123')
		$('#nationality').val('台灣')
		$('#address').val('大園區大勇路444號')
		$('#nickname').val('馬金剛')
		
		
	})
	
	
	

	</script>
</body>
</html>