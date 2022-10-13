<%@page import="tw.jacky.login.model.MemberDetailInfo"%>
<%@page import="tw.jacky.login.model.MemberBasicInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>會員主頁</title>

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

<style type="text/css">
#auth_button {
	background-color: pink
}
</style>

</head>

<body>

	<h1>會員個人資料</h1>

	<%
	MemberBasicInfo bean = (MemberBasicInfo) request.getSession().getAttribute("memberbasicinfo");
	MemberDetailInfo bean1 = (MemberDetailInfo) request.getSession().getAttribute("memberdetailinfo");
	%>

	<img width="300px" height="300px" src="/<%=bean.getPhoto()%>">
	<div><%=bean1.getName()%></div>
	<div><%=bean.getEmail()%></div>
	<div><%=bean1.getPhone()%></div>
	<div><%=bean1.getAddress()%></div>
	<div><%=bean1.getNickname()%></div>
	<div><%=bean1.getNationality()%></div>
	<div><%=bean1.getBrith()%></div>
	<div><%=bean1.getGender()%></div>
	<div><%=bean1.getCreatetime()%></div>
	<div><%=bean1.getModifytime()%></div>



	<button
		class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"
		type="submit" value="login">一鍵修改</button>


	<a href="/uvmember/MemberModifyPassword">

		<button
			class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"
			type="button" value="login">更改密碼</button>

	</a>


	<a href="/uvmember/MemberVerifyEmail">
		<button
			class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"
			type="submit" value="login">驗證郵箱</button>
	</a>




	<button
		class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"
		type="submit" value="login">更改</button>

	<button
		class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"
		type="submit" value="login">確定</button>


	<a href="/logout"> 管理員登出 </a>


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



	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
		var op_status = ${operation_Status}


		if (op_status == 1) {
			Swal.fire(
					  '已驗證過了!不需要重新驗證',
					  '會員',
					  'error'
					)
		}
	</script>
</body>

</html>
