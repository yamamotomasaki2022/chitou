<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.management.MBeanAttributeInfo"%>
<%@page import=" java.util.*,tw.jacky.login.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChiTou後台管理系統-會員資料更改</title>
<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>


	<div class="col-md-6 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<h3 class="card-title text-primary">會員資料更改</h3>
				<p class="card-description">請輸入要更改的會員資訊</p>
				<%
				MemberBasicInfo bean = (MemberBasicInfo) request.getAttribute("modifymemberbean");
				%>

				<form class="forms-sample" action="AdminModifyMember" method="post"
					enctype="multipart/form-data">
					<div class="form-group">
						<input type="hidden" name="_method" value="PUT" class="form-control"> 
						<input type="hidden" name="memberid" value="<%=bean.getMemberid()%>" class="form-control">
					</div>
					
					<div class="form-group">
						<input type="hidden" name="statusid" value="<%=bean.getLoginStatus().getStatusid()%>" class="form-control">
					</div>
					
					<div class="form-group">
						<label>用戶ID</label> <input type="text"
							class="form-control"name="username"
					value="<%=bean.getUsername()%>" placeholder="username">
					</div>
					
<!-- 					<div class="form-group"> -->
<!-- 						<label>身份</label> <input class="form-control" type="text" -->
<%-- 							name="password" value="<%=bean.getLoginStatus().getStatusname()%>" placeholder="Statusid"> --%>
<!-- 					</div> -->
					
					<div class="form-group">
						<label>Photo</label>
						<div class="input-group col-xs-12">
						<img id="img1" alt="" src=" <%=bean.getPhoto() %>" >
							<input id="myfile" type="file" name="myFile"
								class="form-control file-upload-info" placeholder="Upload Image">
							<span class="input-group-append"></span>
						</div>
					</div>

					<div class="form-group">
						<label>email</label> <input class="form-control" type="text"
							name="email" value="<%=bean.getEmail()%>" placeholder="email">
					</div>

					<button type="submit" class="btn btn-primary mr-2"
						name="modifyfromadmin">更改</button>
					<a href="listAttractions"><button class="btn btn-light">返回</button></a>
					<!-- herf=總攬連結 -->
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>
	<script>
		$('#myfile').on('change', function(e) {
			const file = this.files[0];//將上傳檔案轉換為base64字串

			const fr = new FileReader();//建立FileReader物件
			fr.onload = function(e) {
				$('#img1').attr('src', e.target.result);//读取的结果放入圖片
				console.log(e.target.result);
			};

			// 使用 readAsDataURL 將圖片轉成 Base64
			fr.readAsDataURL(file);
		});
		
	</script>

</body>
</html>