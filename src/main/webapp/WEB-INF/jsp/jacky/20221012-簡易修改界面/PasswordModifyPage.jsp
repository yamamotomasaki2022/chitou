<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h1>請修改密碼！！！</h1>



	<form action="/MemberForgetPasswordAndModify" method="post">

		<div>

			<input name="username" type="hidden"  value="${memberbasicinfo.username}" >
		</div>

		<div>
			<input id="password" placeholder="password" name="password">
			<span>${errors.name}</span>
		</div>
		<div>
			<input type="password" id="password2" placeholder="Reconfirmed"
				name="password2"> <span>${errors.pwd}</span>
		</div>
		<div class="mt-3">
			<button type="submit" value="login">修改密碼</button>
			<span>${errors.msg}</span>
		</div>

	</form>

</body>
</html>