<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改密碼</title>
</head>
<body>

	<div class="form-group">
		<input type="password" class="form-control form-control-lg" id="password"
			placeholder="password" name="password">
	</div>
	<div class="form-group">
		<input type="password" class="form-control form-control-lg"
			id="reconfirmpassword" placeholder="Reconfirmpassword"
			name="reconfirmpassword">
	</div>
	
	<span id="info">  </span>
	
	<div class="mt-3">
		<button id="confirm"
			class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"
			type="submit" value="login" disabled>確定</button>
	</div>

</body>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script>

$('#reconfirmpassword').on('change',function(){
var password = $('#password').val();
var reconfirmpassword = $('#reconfirmpassword').val();
if(password != reconfirmpassword){
	$('#info').text('密碼錯誤')
	$('#confirm').attr('disabled',true)
}else{
	$('#info').text('')
	$('#confirm').attr('disabled',false)
}


})



</script>
</html>