<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>LoginPage</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://img.onl/DOO7l" rel="icon" type="images/chitou.png" />
<style>
span {
	color: red;
	display: flex;
	justify-content: center
}

.btnfloat {
	float: left;
	margin-left: 45%;
	padding: 10px
}

.tworows {
	margin-left: 30%;
}

legend {
	margin-left: 45%;
}
</style>



</head>
<body>


	<%@ include file="/WEB-INF/includes/Header.jsp"  %>

	<FORM ACTION="adminlogin" method="post">
		<fieldset class="container col-md-5">
			<legend>管理員登入界面</legend>
		<table>
			<tr>
				<td>UserName:</td>
				<td><input type="text" name="loginuserid"></td>
				<td>${errors.name}</td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="loginpw"></td>
				<td>${errors.pwd}</td>
			</tr>
			<tr>
			<td><button type="submit" value="login">Login</button>
			<td>${errors.msg}</td>
			</tr>
		</table>
	</Form>

	<FORM ACTION="./Project2Servlet" method="post">
		<div class="btnfloat">
			<input class="btn btn-success" type="submit" name="register"
				value="注冊">

		</div>

	</FORM>







	<script src="https://code.jquery.com/jquery-3.6.0.min.js">
		
	</script>


	<script>
		$('#loginuserid').on('focus', function() {
			$('.logininfo').hide();
		});

		$('#loginpw').on('focus', function() {
			$('.logininfo').hide();
		});
	</script>

	</fieldset>

</body>
</html>