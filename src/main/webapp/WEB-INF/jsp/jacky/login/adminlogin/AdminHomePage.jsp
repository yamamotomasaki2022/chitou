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


	<h1 class="card-title text-primary">管理員界面</h1>
	<hr>


	<FORM ACTION="/manager/ToAdminCreateMemberPage" method="post">

		<input class="btn btn-inverse-primary btn-fw" type="submit"
			name="addnewmember" value="新增會員資料">
		<hr>

	</form>

	<FORM ACTION="/manager/AdminQueryMember" method="get">
		<select name="searchinfo">
			<option value="memberid">會員編號</option>
			<option value="username">賬號</option>
			<option value="auth">身份</option>
			<option value="email">郵箱</option>

		</select> <label>查詢</label> <input type="text" name="searchtext" size="10">
		<input class="btn btn-inverse-primary btn-fw" type="submit"
			name="searchmemberinDB" value="查詢">

	</form>

	<div class="table-responsive">
		<table class="table table-hover">

			<h1 class="card-title text-primary">會員資料表</h1>


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
						<!-- 						<input type="hidden" name="_method" value="DELETE"> -->
						<td><input type="hidden" id="<%=bean.getMemberid()%>"
							name="td_memberid" value="<%=bean.getMemberid()%>"><%=bean.getMemberid()%></td>
						<!--  <td><%=bean.getStatusid()%></td>-->
						<td><%=bean.getUsername()%></td>
						<td><%=bean.getLoginStatus().getStatusname()%></td>
						<td><img width="500px" height="500px"
							src="/<%=bean.getPhoto()%>"></td>
						<td><%=bean.getEmail()%></td>

						<td>
							<button type="button" class="btn-inverse-danger">
								<i class="fa-solid fa-trash-can"></i>
							</button>
						</td>
					</form>



<!-- ajax版本 -->

	<script>
	

	
		
	$(".btn-inverse-danger").on('click',function(){
		
		const swalWithBootstrapButtons = Swal.mixin({
			  customClass: {
			    confirmButton: 'btn btn-success',
			    cancelButton: 'btn btn-danger'
			  },
			  buttonsStyling: false
			})
		

		
		swalWithBootstrapButtons.fire({
			  title: '你確定嗎?',
			  text: "你沒辦法重新取回資料哦!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonText: '是, 請刪除!',
			  cancelButtonText: '不, 取消吧!',
			  reverseButtons: true
			}).then((result) => {
			  if (result.isConfirmed) {
			    swalWithBootstrapButtons.fire(
			      '刪除',
			      '會員資訊成功刪除',
			      'success'
			    )
			    $.ajax({
					type:'post',
					url:'/manager/AdminDeleteMember',
					data:{
						td_memberid:<%=bean.getMemberid()%>
					},
					success:function(data){
// 						document.write(data);
// 						console.log(data);
// 						自動刷新
						setTimeout("location.reload()",1500);
					}
					
					})
			  } else if (
			    /* Read more about handling dismissals below */
			    result.dismiss === Swal.DismissReason.cancel
			  ) {
			    swalWithBootstrapButtons.fire(
			      '取消了！',
			      '資訊還在 :)',
			      'error'
			    )
			  }
			})
		
	})
	</script>




<!-- 原始版本 -->
					<!-- 					<form action="/manager/AdminDeleteMember" method="post" style=""> -->
					<%-- 						<INPUT TYPE="HIDDEN" value=<%=bean.getMemberid()%> name="td_memberid"> --%>
					<!-- 						<input type="hidden" name="_method" value="DELETE"> -->
					<%-- 						<td><%=bean.getMemberid()%></td> --%>
					<%-- 						<td><%=bean.getUsername()%></td> --%>
					<%-- 						<td><%=bean.getLoginStatus().getStatusname()%></td> --%>
					<!-- 						<td><img width="500px" height="500px" -->
					<%-- 							src="/<%=bean.getPhoto()%>"></td> --%>
					<%-- 						<td><%=bean.getEmail()%></td> --%>

					<!-- 						<td> -->
					<%-- 						<input type="submit" name="delete" value="<i class="fa-solid fa-trash-can">" --%>
					<!-- 							class="btn btn-inverse-danger btn-icon"  id=""> -->

					<!-- 						</td>	 -->
					<!-- 					</form> -->

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
							<button type="submit" name="update" class="btn-inverse-success">
								<i class="fa-regular fa-pen-to-square"></i>
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


				<h1 class="card-title text-primary">管理員資料表</h1>


				<thead id="tableHead">
					<tr>
						<th>管理員編號</th>
						<th>權限</th>
						<th>賬號</th>
						<!-- 						<th>密碼</th> -->
<!-- 						<th>禁止</th> -->
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
<%-- 							<td><%=bean.getPermission()%></td> --%>


							<td>
								<!-- 								<input type=submit name="deletefromadmin" value="刪除"> -->



								<button href="deleteAttraction?attid="
									class="btn btn-inverse-danger btn-icon">
									<i class="fa-solid fa-trash-can"></i>
								</button>

							</td>
						</form>

						<form action="/manager/ToAdminModifyAdmin" method="post">
							<input type="hidden" name="adminid"
								value="<%=bean.getAdminid()%>"> <input type="hidden"
								name="adminstatus" value="<%=bean.getAdminstatus()%>"> <input
								type="hidden" name="username" value="<%=bean.getUsername()%>">
							<input type="hidden" name="password"
								value="<%=bean.getPassword()%>"> 
								<input type="hidden"
								name="permission" value="<%=bean.getPermission()%>">

							<td>
								<!-- 							<input type=submit name="modifyfromadmin" value="更改"> -->
								<button type="submit" name="modifyfromadmin"
									class="btn btn-inverse-success btn-icon">
									<i class="fa-regular fa-pen-to-square"></i>
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
				<input class="btn btn-inverse-primary btn-fw" type="submit"
					name="addnewmember" value="新增管理員資料" style="float: left">
			</form>
			&nbsp;

			<ul class="navbar-nav mr-lg-4" style="float: right">
				<li class="nav-item dropdown"><a
					class="dropdown-toggle btn btn-inverse-primary btn-sm" href="#"
					data-toggle="dropdown"> <i></i>&nbsp;導出會員資料
				</a>
					<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
						aria-labelledby="profileDropdown">
						<a href="/manager/exportCSV" class="dropdown-item"> <i
							class="ti-settings text-primary"></i> CSV導出
						</a> <a href="/manager/exportPDF" class="dropdown-item"> <i
							class="ti-settings text-primary"></i> PDF導出
						</a>
					</div></li>
			</ul>


			<!-- 			<FORM ACTION="/manager/exportCSV" > -->
			<!-- 				<input class="btn btn-inverse-primary btn-fw" type="submit" name="exportCSV" value="導出會員資料"  style="float:right"> -->
			<!-- 			</form> -->

		</div>
	</div>






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
	
	
	var crude = ${crud};
	
	console.log("得到狀態更新:" + crude);
	
	if (crude == 3) {
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
				))
	}else if (crude == 1) {
		Swal.fire(
				  '讚!',
				  '新增成功!',
				  'success'
				).then((result) => 
				$.ajax({
					type:'get',
					url:'/manager/crudBean',
					success:function(data){
						console.log(data);
					}
					
					}
				))
	
	}else if(crude == 4){
		Swal.fire(
				  'OK!',
				  '刪除成功!',
				  'success'
				).then((result) => 
				$.ajax({
					type:'get',
					url:'/manager/crudBean',
					success:function(data){
						console.log(data);
					}
					
					}
				))
	}
	</script>






</body>
</html>