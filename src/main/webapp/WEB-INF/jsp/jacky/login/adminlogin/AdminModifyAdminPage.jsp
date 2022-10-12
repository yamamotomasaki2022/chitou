<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="javax.management.MBeanAttributeInfo"%>
<%@page import=" java.util.*,tw.jacky.login.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChiTou後台管理系統-管理員資料更改</title>
<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
				<h3 class="card-title text-primary">管理員資料更改</h3>
				<p class="card-description">一般管理員為 1，主管為 2，老闆為 3</p>
				<form class="forms-sample"action="AdminModifyAdmin" method="post">
				<input type="hidden" name="_method" value="PUT">
				<input type="hidden" name="adminid" value="${modifyadminbean.adminid}"><br>
					<div class="form-group">
						<label>權限</label> <input type="text" id="adminstatus" class="form-control"
							name="adminstatus" autocomplete="off" placeholder="userID" value="${modifyadminbean.loginStatus.statusid}">
					</div>
					<div class="form-group">
						<label>賬號</label> <input type="text"
							class="form-control" id="username" name="username"
							autocomplete="off" placeholder="username" value="${modifyadminbean.username}"">
					</div>
					
					<div class="form-group">
						<label>密碼</label> <input type="password"
							class="form-control" id="password" name="password"
							autocomplete="off" placeholder="Password" value="${modifyadminbean.password}"">
					</div>
					
					<div class="form-group">
						<label>禁止</label> 
						<select class="form-control" name="permission">
													<option value="true">允許</option>
													<option value="false">禁止</option>
												</select>
					</div>

					<button type="submit" class="btn btn-primary mr-2" name="modifyfromadmin">更改</button>
					<a href="/manager/AdminHomePage"><button type="button" class="btn btn-light" value="返回">返回</button></a>
					<!-- herf=總攬連結 -->
				</form>
				
				
			
				
				
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
<!-- 	<button type="submit" class="btn btn-primary mr-2" id="createmember" name="submit">提交</button> -->
<!-- 					<a href="listAttractions"><button class="btn btn-light">返回</button></a>  -->
				<!-- herf=總攬連結 -->
	<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>

</body>
</html>