<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
  <script>
    function login() {
      // console.info("點選了登入");
      var userName = $("#uName").val();
      // console.info(userName)
      var userPass = $("#uPass").val();
      // console.info(userPass);
      if (userName == "" || userName == null) {
        alert("使用者名稱不能為空");
        return false;
      } else if (userPass == "" || userPass == null) {
        alert("密碼不能為空");
        return false;
      } else {
        return true;
      }
    }
  </script>


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
                <a class="navbar-brand brand-logo mr-5" href="index.html"><img src="/images/coco/logo3.png" class="mr-6"
                    width="auto" height="auto" alt="logo" /><img src="/images/coco/logo2.png" class="mr-2"
                    alt="logo" /></a>
              </div>
              <form class="pt-3" οnsubmit="return login();">
                <div class="form-group">
                  <input type="email" class="form-control form-control-lg" id="uName" placeholder="Username">
                </div>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="uPass" placeholder="Password">
                </div>
                <div class="mt-3">
                  <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" href="">登入</a>
                </div>
                <div class="my-2 d-flex justify-content-between align-items-center">
                  <div class="form-check">
                    <label class="form-check-label text-muted">
                      <input type="checkbox" class="form-check-input">
                      記住我的認證
                    </label>
                  </div>
                  <a href="#" class="auth-link .text-primary">忘記密碼</a>
                </div>
                <div class="mb-2">
                  <button type="button" class="btn btn-social-icon btn-outline-facebook"><i
                      class="ti-facebook"></i></button>

                  <button type="button" class="btn btn-social-icon btn-outline-google"><i
                      class="ti-google"></i></button>

                  <button type="button" class="btn btn-social-icon btn-outline-google"><i
                      class="ti-google"></i></button>
                </div>
                <div class="text-center mt-4 font-weight-light">
                  還沒有帳號? <a href="register.html" class="text-primary">創建帳戶</a>
                </div>
              </form>
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
</body>

</html>