<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改密碼</title>
</head>
<body>

	<form action="/uvmember/MemberModifyPasswordToDB" method="post">

		<!-- 	<div class="form-group"> -->
		<!-- 		<input type="password" class="form-control form-control-lg" -->
		<!-- 			id="password" placeholder="password" name="password"> -->
		<!-- 	</div> -->
		<!-- 	<div class="form-group"> -->
		<!-- 		<input type="password" class="form-control form-control-lg" -->
		<!-- 			id="reconfirmpassword" placeholder="Reconfirmpassword" -->
		<!-- 			name="reconfirmpassword"> -->
		<!-- 	</div> -->

		<!-- 	<span id="info"> </span> -->

		<!-- 	<div class="mt-3"> -->
		<!-- 		<button id="confirm" -->
		<!-- 			class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" -->
		<!-- 			type="submit" value="login" disabled>確定</button> -->
		<!-- 	</div> -->


		<div class="form-group">

			<label class="col-sm-2 control-label font">密碼</label>

			<div class="col-xs-10">

				<input type="password" class="form-control bt" name="pwd" id="pwd"
					placeholder="請設置密碼">

			</div>

		</div>
		<br />




		<div class="form-group">

			<label class="col-sm-2 control-label font">確認密碼</label>

			<div class="col-xs-10">

				<input type="password" class="form-control bt" name="pwd" id="pwd1"
					placeholder="請再次填寫密碼" onkeyup="validate()"><span id="tishi"></span>

			</div>

		</div>
		<br />
		<br />

			<div class="mt-3">
				<button id="confirm"
					class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"
					type="submit" value="login" disabled>確定</button>
			</div>

	</form>
	
	
	<a href="toMemberHomePage"><button>返回會員主界面</button></a>
	

</body>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script>
	// $('#reconfirmpassword').on('change',function(){
	// var password = $('#password').val();
	// var reconfirmpassword = $('#reconfirmpassword').val();
	// if(password != reconfirmpassword){
	// 	$('#info').text('密碼錯誤')
	// 	$('#confirm').attr('disabled',true)
	// }else{
	// 	$('#info').text('')
	// 	$('#confirm').attr('disabled',false)
	// }
	// })

	// $('#reconfirmpassword').on('click',function(){
	// 	$('#info').remove()
	// })
</script>

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

         $("button").attr("disabled","disabled"); 
         
         
         
         $('#confirm').attr('disabled',true);

      }

}

</script>




</html>