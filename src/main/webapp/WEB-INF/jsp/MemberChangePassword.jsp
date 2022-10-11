<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChiTou-修改密碼</title>
<%@ include file="/WEB-INF/includes/jacky/Member/MemberCSSAndJS.jsp"%>

</head>
</head>
<body>

 <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <img src="/images/coco/logo3.png" alt="logo">
                <img src="/images/coco/logo2.png" alt="logo">
              </div>
				<h4 class="card-title text-primary">修改密碼</h4>
              <form class="pt-3">
                <div class="form-group">
                <label>請輸入要修改的密碼</label>
                  <input type="text" class="form-control form-control-lg" id="password"
			placeholder="password" name="password">
                </div>
                
                <div class="form-group">
                  <label>請重新確認密碼</label>
                  <input type="password" class="form-control form-control-lg" id="password" placeholder="Reconfirmpassword" name="reconfirmpassword">
                </div>
            
                
                <div class="mt-3">
                  <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="login">確定</a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>
</html>