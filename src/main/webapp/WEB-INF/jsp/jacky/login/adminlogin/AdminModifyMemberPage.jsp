<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="javax.management.MBeanAttributeInfo"%>
<%@page import=" java.util.*,tw.jacky.login.model.*"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>AdminHomePage</title>
<link href="https://img.onl/DOO7l" rel="icon" type="image/png" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
table {
	border: 2px solid;
	margin-top: 10px;
}

th {
	border: 2px solid;
}

td {
	border: 2px solid;
}
</style>


<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>

</head>
<body>


<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>

	<hr>
	<br>
	<label>會員資料更改</label>
	<div>

		<%
		MemberBasicInfo bean = (MemberBasicInfo) request.getAttribute("modifymemberbean");
		%>

		<tr>
			<form action="AdminModifyMember" method="post" enctype="multipart/form-data">
				<input type="hidden" name="_method" value="PUT"> <input
					type="hidden" name="memberid" value="<%=bean.getMemberid()%>"><br>
					
				<input type="hidden" name="statusid" value="<%=bean.getStatusid()%>"><br>
				
				用戶ID<input type="text" name="username"
					value="<%=bean.getUsername()%>"><br> 
				密碼<input
					type="text" name="password" value="<%=bean.getPassword()%>"><br>
				<p>
					Photo:<br/> 
					<img id="img1" alt="" src=" <%=bean.getPhoto() %>"><br> 

					<input id="myfile2" class="myfile" type="file" name="myFile" />

				</p>
				email <input type="text" name="email" value="<%=bean.getEmail()%>"><br>

				<input type=submit name="modifyfromadmin" value="更改">

			</form>
		</tr>


	</div>
	<hr>
	<form action="adminlist">
		<button onclick="">返回登入界面</button>
	</form>

<%@ include file="/WEB-INF/includes/SuperBottom.jsp" %>

	<script>
		$('.myfile').on('change', function(e) {
			const file = this.files[0];//將上傳檔案轉換為base64字串

			const fr = new FileReader();//建立FileReader物件
			fr.onload = function(e) {
				$('#img1').attr('src', e.target.result);//读取的结果放入圖片
				console.log(e.target.result);
			};

			// 使用 readAsDataURL 將圖片轉成 Base64
			fr.readAsDataURL(file);
		});
		
		
		if($('#myfile2').val().length != 0){
			console.log("111")
		}else{
			$('#img1').attr('src', <%= bean.getPhoto() %>);
		}
		
	</script>
	


</body>
</html>