<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>

<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8" />
<TITLE>ChiTou後台管理系統-創建管理員</TITLE>
<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>
<script>
	function getTime() {
		var currentTime = new Date();
		return currentTime
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>
	<div class="col-md-6 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<h3 class="card-title text-primary">老闆創建管理員</h3>
				<p class="card-description">請輸入要創建的管理員資訊</p>
				<form class="forms-sample" ACTION="AdminInsertAdmin" method="post"
					id="form">
					<div class="form-group">
						<label>Adminstatus</label> <input type="text" class="form-control"
							id="username" name="adminstatus" autocomplete="off"
							placeholder="Adminstatus">
					</div>

					<div class="form-group">
						<label>Username</label> <input type="text" class="form-control"
							id="username" name="username" autocomplete="off"
							placeholder="Username">
					</div>

					<div class="form-group">
						<label>Password</label> <input type="password"
							class="form-control" id="password" name="password"
							autocomplete="off" placeholder="Password">
					</div>
					<div  class="form-group">
						<input type="hidden" name="permission" value="1">
					</div>

					<button type="submit" class="btn btn-primary mr-2"  id="createmember" name="submit">提交</button>
					<a href="/manager/AdminHomePage"><button type="button" class="btn btn-light">返回</button></a> 
				</form>
			</div>
		</div>
	</div>


	<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>

</body>
</html>