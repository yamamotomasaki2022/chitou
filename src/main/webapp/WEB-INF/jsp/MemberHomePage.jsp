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
.zoomImage{
    width:50%;
    height:0;
    padding-bottom: 50%;
    overflow:hidden;
    background-position: center center;
    background-repeat: no-repeat;
    -webkit-background-size:cover;
    -moz-background-size:cover;
    background-size:cover;
}
</style>

</head>
<body>
<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper d-flex align-items-center auth px-0">
				<div class="row w-100 mx-0">
					<div class="col-lg-10 mx-auto">
						<div class="auth-form-light text-left py-5 px-4 px-sm-5">
										<h4 class="card-title text-primary">會員個人資料</h4>
						
							<form class="pt-3">
								<div class="row">
								
									<div class="col-md-6">
									<div class="zoomImage" style="background-image:url(/images/jacky/login/20221011girl-2.jpg)"></div>
									<br>
									<a href=""><button class="btn btn-light btn-sm">更改密碼</button></a> 
									<a href=""><button class="btn btn-light btn-sm">驗證信箱</button></a> 
									<a href=""><button class="btn btn-light btn-sm">一鍵修改</button></a> 
									</div>

									<div class="col-md-6">
									<div class="form-group row">
											<label class="col-sm-3 col-form-label">名字</label>
											<div class="col-sm-9">
												<input type="text" class="form-control"  placeholder="name" />
											</div>
											
											<label class="col-sm-3 col-form-label">email</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" name="email"
													placeholder="email" />
											</div>
											
												<label class="col-sm-3 col-form-label">電話</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" name="phone"
													 placeholder="電話" />
											</div>
											
											<label class="col-sm-3 col-form-label">昵稱</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" name="nickname"
													 placeholder="昵稱" />
											</div>
											
											
											<label class="col-sm-3 col-form-label">國家</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" name="nationality"
													placeholder="國家" />
											</div>
											
											<label class="col-sm-3 col-form-label">生日</label>
											<div class="col-sm-9">
												<input type="date" class="form-control" name="birthday"
													placeholder="生日" />
											</div>
											
											<label class="col-sm-3 col-form-label">性別</label>
											<div class="col-sm-9">
												<select class="form-control" name="gender">
													<option value="0">請選擇你的性別</option>
													<option value="female">女</option>
													<option value="male">男</option>
												</select>
											</div>
											
											<label class="col-sm-3 col-form-label">Createtime</label>
<!-- 											<div class="col-sm-9"> -->
<!-- 												<input type="text" class="form-control" name="nationality" -->
<!-- 													placeholder="國家" /> -->
<!-- 											</div> -->
													<label class="col-sm-3 col-form-label">Modifytime</label>
<!-- 											<div class="col-sm-9"> -->
<!-- 												<input type="text" class="form-control" name="nationality" -->
<!-- 													placeholder="國家" /> -->
<!-- 											</div> -->
											
											
										</div>
									</div>
								</div>
									<a href="listAttractions"><button class="btn btn-light" style="float:right;">更改</button></a> 
									<button type="submit" class="btn btn-primary mr-2" id="createmember" name="submit" style="float:right;">確定</button>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>