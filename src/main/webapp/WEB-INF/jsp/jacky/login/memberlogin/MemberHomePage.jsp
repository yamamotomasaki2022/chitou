<%@page import="tw.jacky.login.model.MemberDetailInfo"%>
<%@page import="tw.jacky.login.model.MemberBasicInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChiTou-會員主頁</title>
<%@ include file="/WEB-INF/includes/jacky/Member/MemberCSSAndJS.jsp"%>
<style type="text/css">
/* .tupian{ border:1px solid #000; width:300px; height:100px}  */
/* .tupian img{width:300px; height:400px}  */
.zoomImage {
	width: 50%;
	height: 0;
	padding-bottom: 50%;
	overflow: hidden;
	background-position: center center;
	background-repeat: no-repeat;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	background-size: cover;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper d-flex align-items-center auth px-0">
				<div class="row w-100 mx-0">
					<div class="col-lg-10 mx-auto">
						<div class="auth-form-light text-left py-5 px-4 px-sm-5">
							<h4 class="card-title text-primary">${memberbasicinfo.username}的個人資料</h4>

							<form action="/uvmember/MemberModifyMemberDetail" method="post"
								enctype="multipart/form-data">
								<div class="row">

									<div class="col-md-6">


										<!-- 										<div class="zoomImage" -->
										<%-- 											style="background-image:url(${memberbasicinfo.photo})"> --%>
										<!-- 										</div> -->
										<div>

											<image id="img1" width="300px" height="300px"
												src="/${memberbasicinfo.photo}" alt="selfie"">
										</div>

										<br> <a href="/uvmember/MemberModifyPassword"><button
												type="button" class="btn btn-light btn-sm">更改密碼</button></a> <a
											href="/uvmember/MemberVerifyEmail"><button type="button"
												class="btn btn-light btn-sm">驗證信箱</button></a>
										<button type="button" id="modify" class="btn btn-light btn-sm">一鍵修改</button>
										<div id="changepic" class="form-group" style="display: none">

											<div class="form-group row">
												<img id="img1" alt="" src=""> <input id="myfile"
													type="file" name="myFile"
													class="form-control file-upload-info"
													placeholder="Upload Image"> <span
													class="input-group-append"></span>
											</div>
										</div>
										</a>
									</div>

									<div class="col-md-6">
										<div class="form-group row">
											<div>
												<input type="hidden" name="memberid"
													value="${memberbasicinfo.memberid}" class="form-control">

											</div>


											<label class="col-sm-3 col-form-label">名字</label>
											<div class="col-sm-9">
												<input id="name" type="text" class="form-control"
													placeholder="name" name="name"
													value="${memberdetailinfo.name}" disabled />
											</div>

											<label class="col-sm-3 col-form-label">email</label>
											<div class="col-sm-9">
												<input id="email" type="text" class="form-control"
													name="email" placeholder="email"
													value="${memberbasicinfo.email}" disabled />
											</div>

											<label class="col-sm-3 col-form-label">電話</label>
											<div class="col-sm-9">
												<input id="phone" type="text" class="form-control"
													name="phone" placeholder="電話"
													value="${memberdetailinfo.phone}" disabled />
											</div>

											<label class="col-sm-3 col-form-label">昵稱</label>
											<div class="col-sm-9">
												<input id="nickname" type="text" class="form-control"
													name="nickname" placeholder="昵稱"
													value="${memberdetailinfo.nickname}" disabled />
											</div>


											<label class="col-sm-3 col-form-label">國家</label>
											<div class="col-sm-9">
												<input id="nationality" type="text" class="form-control"
													name="nationality" placeholder="國家"
													value="${memberdetailinfo.nationality}" disabled />
											</div>


											<label class="col-sm-3 col-form-label">地址</label>
											<div class="col-sm-9">
												<input id="address" type="text" class="form-control"
													name="address" placeholder="地址"
													value="${memberdetailinfo.address}" disabled />
											</div>

											<label class="col-sm-3 col-form-label">生日</label>
											<div class="col-sm-9">
												<input id="birth" type="date" class="form-control"
													name="birth" placeholder="生日"
													value="${memberdetailinfo.birth}" disabled />

											</div>

											<label class="col-sm-3 col-form-label">性別</label>
											<div class="col-sm-9">
												<select id="gender" class="form-control" name="gender"
													disabled>
													<option value="${memberdetailinfo.gender}">${memberdetailinfo.gender}</option>
													<option value="女">女</option>
													<option value="男">男</option>
												</select>
											</div>



										</div>
									</div>
								</div>
								<!-- 								<a href="listAttractions"><button class="btn btn-light" -->
								<!-- 										style="float: right;">更改</button></a> -->
								<div id="modifybtn" style="display: none">
									<button type="submit" class="btn btn-primary mr-2"
										name="submit" style="float: right">更改</button>
								</div>


								<a href="/home"><button type="button"
										class="btn btn-light btn-sm">返回主頁</button></a>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$('#modify').on('click', function() {
			$('#name').prop('disabled', false)
			$('#email').prop('disabled', false)
			$('#phone').prop('disabled', false)
			$('#nickname').prop('disabled', false)
			$('#nationality').prop('disabled', false)
			$('#birth').prop('disabled', false)
			$('#gender').prop('disabled', false)
			$('#address').prop('disabled', false)
			$('#changepic').css('display', '')
			$('#modifybtn').css('display', '')
		})
	</script>

	<script>
		$('#myfile').on('change', function(e) {
			const file = this.files[0];//將上傳檔案轉換為base64字串

			const fr = new FileReader();//建立FileReader物件
			fr.onload = function(e) {
				$('#img1').attr('src', e.target.result);//读取的结果放入圖片
				console.log(e.target.result);
			};

			// 使用 readAsDataURL 將圖片轉成 Base64
			fr.readAsDataURL(file);
		});
	</script>


	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	<script>
		var op_status = ${operation_Status}

		if (op_status == 1) {
			Swal.fire('已驗證過了!不需要重新驗證', '會員', 'error')
		}
	</script>

</body>
</html>