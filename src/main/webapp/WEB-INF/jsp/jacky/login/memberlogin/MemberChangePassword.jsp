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
              <form action="MemberModifyPasswordToDB" method="post" class="pt-3">
                <div class="form-group">
                <label>請輸入要修改的密碼</label>
                  <input type="text" class="form-control form-control-lg" id="pwd"
			placeholder="password" name="password">
                </div>
                
                <div class="form-group">
                  <label>請重新確認密碼</label>
                  <input type="password" class="form-control form-control-lg" id="pwd1" 
                  placeholder="Reconfirmpassword" name="reconfirmpassword" onkeyup="validate()">
                  <span id="tishi"></span>
                </div>
            
                
                <div class="mt-3">
                  <button id="confirm"  class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="login">確定</button>
                </div>
                
                <br>
                <div text-align: center>
                <a href="/uvmember/toMemberHomePage"><button class="btn btn-light btn-sm" type="button">返回個人主頁</button></a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

<script>



function validate() {

      

    var pwd = $("#pwd").val();

    var pwd1 = $("#pwd1").val();

<!-- 对比两次输入的密码 -->

    if(pwd == pwd1)

     {

        $("#tishi").html("兩次密碼相同");

         $("#tishi").css("color","green");

    $("#xiugai").removeAttr("disabled");
    $('#confirm').attr('disabled',false);

     }

else {

        $("#tishi").html("兩次密碼不相同");

         $("#tishi").css("color","red")

//          $("button").attr("disabled","disabled"); 
     
         $('#confirm').attr('disabled',true);

      }

}

</script>



</body>
</html>