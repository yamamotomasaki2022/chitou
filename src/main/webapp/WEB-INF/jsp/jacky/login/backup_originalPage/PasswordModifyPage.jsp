<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<%@ include file="/WEB-INF/includes/coco/attraction/AttractionsDescriptionCSS.jsp"%>
</head>
<body>

<%@ include file="/WEB-INF/includes/coco/attraction/Header.jsp"%>
	<h1>請修改密碼(忘記密碼的人)！！！</h1>



	<form action="/MemberForgetPasswordAndModify" method="post">

		<div>

			<input name="username" type="hidden"  value="${memberbasicinfo.username}" >
		</div>

		<div>
		    <span>密碼</span>
			<input id="password" placeholder="password" name="password">
			<span>${errors.name}</span>
		</div>
		<div>
			<span>確認密碼</span>
			<input type="password" id="password2" placeholder="Reconfirmed"
				name="password2" onkeyup="validate()"> <span id="tishi"></span>
		</div>
		
		<div class="mt-3">
			<button id="confirm" type="submit" value="login">修改密碼</button>

		</div>

	</form>
	
	
	<script type="text/javascript">
	
	function validate() {

      

    var pwd = $("#password").val();

    var pwd1 = $("#password2").val();

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