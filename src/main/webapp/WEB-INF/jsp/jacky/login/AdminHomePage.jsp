
<%@page import="javax.management.MBeanAttributeInfo"%>
<%@page
	import="java.sql.Connection, java.util.*, javax.sql.*, tw.jacky.controller.*, javax.naming.*,java.io.*,java.sql.* ,tw.jacky.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>




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
<link rel= "stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>	

</head>


<body>


<%@include file="WEB-INF/includes/Header.jsp" %>

	<h1>管理員界面</h1>
	<hr>
	<hr>
	
		<FORM ACTION="entercreatememberpage" method="post">
		
		<input class="bot" type="submit" name="addnewmember" value="新增會員資料">
		<hr>

	</form>

	<FORM ACTION="adminsearchindb" method="post">
		<select name="searchinfo">
			<option value="memberid">會員編號</option>
			<option value="username">賬號</option>
			<option value="password">密碼</option>
			<option value="name">名字</option>
			<option value="nickname">綽號</option>
			<option value="phone">號碼</option>
			<option value="nationality">國家</option>
			<option value="birth">生日</option>
			<option value="gender">性別</option>
			<option value="address">地址</option>
			<option value="email">郵箱</option>
			<option value="createtime">創建時間</option>
			<option value="modify">修改時間</option>
		</select> 
		<label>查詢</label> <input type="text" name="searchtext" size="10">
		<input class="bot" type="submit" name="searchmemberinDB" value="查詢">

	</form>
	
	
	<table id="myTable" class="display">
	
	<h1>會員資料表</h1>
	
	
	<hr>
	<br>
	
	
		<thead>
			<tr>
				<th>會員編號</th>
				<th>賬號</th>
				<th>密碼</th>
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
				<form action="admindeletemember" method="post">
					<td><input type="hidden" name="td_memberid" value="<%=bean.getMemberid()%>"><%=bean.getMemberid()%></td>
					<!--  <td><%=bean.getStatusid()%></td>-->
					<td><%=bean.getUsername()%></td>
					<td><%=bean.getPassword()%></td>
					<td><%=bean.getPhoto()%></td>
					<td><%=bean.getEmail()%></td>

					<td><input type=submit name="deletefromadmin" value="刪除"></td>
				</form>

				<form action="adminmodifypage" method="post">
				<input type="hidden" name="memberid" value="<%=bean.getMemberid()%>">
				<input type="hidden" name="statusid" value="<%=bean.getStatusid()%>">
				<input type="hidden" name="statusid" value="<%=bean.getUsername()%>">
				<input type="hidden" name="userid" value="<%=bean.getUsername()%>">
				<input type="hidden" name="password" value="<%=bean.getPassword()%>">
				<input type="hidden" name="photo" value="<%=bean.getPhoto()%>">
				<input type="hidden" name="email" value="<%=bean.getEmail()%>">

				<td><input type=submit name="modifyfromadmin" value="更改"></td>
				</form>
			</tr>

		<%
		}
		%>
		


	
	

		
		
		<table id="myTable2" class="display">
		<hr>
		
		<h1>管理員資料表</h1>
		<div> 一般管理員為 1，  主管為 2， 老闆為 3</div>
		
		<thead>
			<tr>
				<th>管理員編號</th>
				<th>權限</th>
				<th>賬號</th>
				<th>密碼</th>
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
				<form action="admindeleteadmin" method="post">
					<td><input type="hidden" name="td_memberid" value="<%=bean.getAdminid()%>"><%=bean.getAdminid()%></td>
					<td><%=bean.getAdminstatus()%></td>
					<td><%=bean.getUsername()%></td>
					<td><%=bean.getPassword()%></td>
					<td><%=bean.getPermission()%></td>


					<td><input type=submit name="deletefromadmin" value="刪除"></td>
				</form>

				<form action="adminmodifyadminpage" method="post">
				<input type="hidden" name="adminid" value="<%=bean.getAdminid()%>">
				<input type="hidden" name="adminstatus" value="<%=bean.getAdminstatus()%>">
				<input type="hidden" name="username" value="<%=bean.getUsername()%>">
				<input type="hidden" name="password" value="<%=bean.getPassword()%>">
				<input type="hidden" name="permission" value="<%=bean.getPermission()%>">


				<td><input type=submit name="modifyfromadmin" value="更改"></td>
				</form>
			</tr>

		<%
		}
		%>
		
		
		
		</tbody>
	</table>
	
	<hr>
	
	<FORM ACTION="entercreateadminpage" method="post">
		
		<input class="bot" type="submit" name="addnewmember" value="新增管理員資料">
		<hr>
	</form>
	
	<hr>
	
	<form action="loginmain.controller">
		<button onclick="">返回登入界面</button>
	</form>
	


<script>

$(document).ready( function () {
    $('#myTable').DataTable();
    $('#myTable2').DataTable();
} );

</script>


</body>
</html>