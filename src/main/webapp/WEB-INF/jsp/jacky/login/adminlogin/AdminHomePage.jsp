<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@page import="java.util.*, javax.sql.*,tw.jacky.login.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
// if(request.getAttribute("status") !=null){
//  	int status1 = (int)request.getAttribute("status");

//  	System.out.println(status1);
// }else{
// 	int status1 = 0;
// 	System.out.println(status1);
// };

if (request.getAttribute("crud") != null) {
	int crud = (int) request.getAttribute("crud");
} else {
	int crud = 0;
}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>AdminHomePage</title>
<link href="https://img.onl/DOO7l" rel="icon" type="image/png" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>

<script type="text/javascript">
	function upload() {
		//alert('ok');
		var form1 = document.getElementById("form1");
		var formData = new FormData(form1);

		fetch('/AdminUploadPic', {
			method : 'POST',
			body : formData
		}).then(function(response) {
			var status = response.status;

			if (status != 200) {
				console.log('status1:' + status);
				return;
			}

			console.log('status2:' + status);
		});
	}
</script>



<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>

</head>


<body>


	<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>



	<%
	System.out.println("sessionid123 :" + request.getSession().getId());
	%>


	<h1>管理員界面</h1>
	<hr>


	<FORM ACTION="/manager/ToAdminCreateMemberPage" method="post">

		<input class="bot" type="submit" name="addnewmember" value="新增會員資料">
		<hr>

	</form>

	<FORM ACTION="/manager/AdminQueryMember" method="get">
		<select name="searchinfo">
			<option value="memberid">會員編號</option>
			<option value="username">賬號</option>
			<option value="auth">身份</option>
			<option value="email">郵箱</option>

		</select> <label>查詢</label> <input type="text" name="searchtext" size="10">
		<input class="bot" type="submit" name="searchmemberinDB" value="查詢">

	</form>

	<div class="table-responsive">
		<table class="table table-hover">

			<h1>會員資料表</h1>


			<hr>
			<br>


			<thead id="tableHead">
				<tr>
					<th>會員編號</th>
					<th>賬號</th>
					<th>身份</th>
					<th>照片</th>
					<th>郵箱</th>
					<th>刪除</th>
					<th>修改</th>

				</tr>
			</thead>


			<tbody>

				<%
				List<MemberBasicInfo> resultofmember = (List) request.getSession().getAttribute("memberlist");
				for (MemberBasicInfo bean : resultofmember) {
				%>

				<tr>
					<form action="/manager/AdminDeleteMember" method="post">
						<input type="hidden" name="_method" value="DELETE">
						<td><input type="hidden" name="td_memberid"
							value="<%=bean.getMemberid()%>"><%=bean.getMemberid()%></td>
						<!--  <td><%=bean.getStatusid()%></td>-->
						<td><%=bean.getUsername()%></td>
						<td><%=bean.getLoginStatus().getStatusname()%></td>
						<td><img width="500px" height="500px"
							src="/<%=bean.getPhoto()%>"></td>
						<td><%=bean.getEmail()%></td>

						<td>
							<button href="deleteAttraction?attid="
								class="btn btn-inverse-danger btn-icon">
								<i class="ti-trash"></i>
							</button>
						</td>
					</form>

					<form action="/manager/ToAdminModifyMember" method="post">
						<input type="hidden" name="memberid"
							value="<%=bean.getMemberid()%>"> <input type="hidden"
							name="statusid" value="<%=bean.getStatusid()%>"> <input
							type="hidden" name="statusid" value="<%=bean.getUsername()%>">
						<input type="hidden" name="userid" value="<%=bean.getUsername()%>">
						<input type="hidden" name="password"
							value="<%=bean.getPassword()%>"> <input type="hidden"
							name="photo" value=" /<%=bean.getPhoto()%>"> <input
							type="hidden" name="email" value="<%=bean.getEmail()%>">

						<td>
							<button type="submit" name="update"
								class="btn btn-inverse-success btn-icon">
								<i class="ti-pencil-alt"></i>
							</button>
						</td>
					</form>
				</tr>

				<%
				}
				%>
			
		</table>
	</div>
	<div id='aaa'>
		<div class="table-responsive">
			<table class="table table-hover">
				<hr>


				<h1>管理員資料表</h1>
				<div>一般管理員為 1， 主管為 2， 老闆為 3</div>

				<thead id="tableHead">
					<tr>
						<th>管理員編號</th>
						<th>權限</th>
						<th>賬號</th>
						<!-- 						<th>密碼</th> -->
						<th>禁止</th>
						<th>刪除</th>
						<th>修改</th>

					</tr>
				</thead>

				<tbody>

					<%
					List<AdminChitou> resultofadmin = (List) request.getSession().getAttribute("adminlist");
					for (AdminChitou bean : resultofadmin) {
					%>

					<tr>
						<form action="/manager/AdminDeleteAdmin" method="post">
							<input type="hidden" name="_method" value="DELETE">
							<td><input type="hidden" name="td_memberid"
								value="<%=bean.getAdminid()%>"><%=bean.getAdminid()%></td>
							<td><%=bean.getLoginStatus().getStatusname()%></td>
							<td><%=bean.getUsername()%></td>
							<%-- 							<td><%=bean.getPassword()%></td> --%>
							<td><%=bean.getPermission()%></td>


							<td>
								<!-- 							<input type=submit name="deletefromadmin" value="刪除"> -->


								<button href="deleteAttraction?attid="
									class="btn btn-inverse-danger btn-icon">
									<i class="ti-trash"></i>
								</button>

							</td>
						</form>

						<form action="/manager/ToAdminModifyAdmin" method="post">
							<input type="hidden" name="adminid"
								value="<%=bean.getAdminid()%>"> <input type="hidden"
								name="adminstatus" value="<%=bean.getAdminstatus()%>"> <input
								type="hidden" name="username" value="<%=bean.getUsername()%>">
							<input type="hidden" name="password"
								value="<%=bean.getPassword()%>"> <input type="hidden"
								name="permission" value="<%=bean.getPermission()%>">

							<td>
								<!-- 							<input type=submit name="modifyfromadmin" value="更改"> -->
								<button type="submit" name="modifyfromadmin"
									class="btn btn-inverse-success btn-icon">
									<i class="ti-pencil-alt"></i>
								</button>
							</td>
						</form>
					</tr>

					<%
					}
					%>



				</tbody>
			</table>

			<hr>

			<FORM ACTION="/manager/ToAdminCreateAdmin" method="post">
				<input class="bot" type="submit" name="addnewmember" value="新增管理員資料">
			</form>
			<FORM ACTION="/manager/exportCSV" >
				<input class="bot" type="submit" name="exportCSV" value="導出會員資料">
			</form>
			<hr>
		</div>
	</div>


	<a href="/logout">管理員登出 </a>



	<!--  

	<form action="logout">
		<button onclick="">返回登入界面</button>
	</form>

-->


	<hr>




	<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>

	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script>
		var status = "${session_status}";

		if (status == 1) {
			document.getElementById('aaa').setAttribute("style",
					"display : none")
		}else if(status==2){
			document.getElementById('aaa').setAttribute("style",
			"display : '' ")
		}else if(status==3){
			document.getElementById('aaa').setAttribute("style",
			"display : '' ")
		}
		
	</script>

	<script>
	
	var welcome = ${welcome_message}
	
	
	if (welcome == 1) {
		Swal.fire(
				  'Welcome!',
				  'Admin!',
				  'success'
				)
	} else if (welcome == 2) {
		Swal.fire(
				  'Welcome!',
				  'Manager!',
				  'success'
				)

	} else if (welcome == 3) {
		Swal.fire(
				  'Welcome!',
				  'Boss!',
				  'success'
				)

	} else {
		
	}
	
	
	</script>


	<script>
	
	
	var crud = "${crud}";
	
	console.log("crud:" +crud)
	
	if (crud == 1) {
		Swal.fire(
				  '讚！',
				  '新增成功',
				  'success'
				).then((result) => 
				$.ajax({
				type:'get',
				url:'/manager/crudBean',
				success:function(data){
					console.log(data);
				}
				
				}
				)
				
				
				)
				
	} else if (crud == 2) {
		Swal.fire(
				  '',
				  'Manager!',
				  'success'
				)
	} else if (crud == 3) {
		Swal.fire(
				  '讚!',
				  '更新成功!',
				  'success'
				).then((result) => 
				$.ajax({
					type:'get',
					url:'/manager/crudBean',
					success:function(data){
						console.log(data);
					}
					
					}
					)
	} else if (crud == 4) {
		Swal.fire(
				  '讚！',
				  '刪除成功！',
				  'success'
				)
				.then((result) => 
				$.ajax({
				type:'get',
				url:'/manager/crudBean',
				success:function(data){
					console.log(data);
				}
				
				}
				)
				
	}else {
		
	}
	</script>


</body>
</html>