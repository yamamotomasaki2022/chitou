
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


</head>
<body>

<%@include file="WEB-INF/includes/Header.jsp" %>


	<FORM ACTION="./Project2Servlet" method="post">
		<h1>查詢主頁面</h1>

	<div>
	<select name="searchinfo">
				<option value="memberid">會員編號</option>	
				<option value="userid">賬號</option>
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
	</select> <br> 
	<label>查詢</label><br>
	<input type="text" name="searchtext" size="10">
	<input class="bot" type="submit" name="searchmemberinDB"
				value="查詢">
		<br>		
		<label> 會員資料庫列表</label>
		<table>
			<thead>
				<tr>
					<th>會員編號</th>
					<th>權限</th>
					<th>賬號</th>
					<th>密碼</th>
					<th>姓名</th>
					<th>綽號</th>
					<th>電話號碼</th>
					<th>國家</th>
					<th>生日</th>
					<th>性別</th>
					<th>地址</th>
					<th>郵箱</th>
					<th>創建時間</th>
					<th>修改時間</th>
				</tr>
			</thead>

			<tbody>
<% 

List<MemberBasicInfo> result =(List)request.getAttribute("result");
for(MemberBasicInfo bean:result) { %>

				<tr>
					<td name="td_memberid" value=<%= bean.getMemberid() %>> <%= bean.getMemberid() %></td>
					<td name="td_statusid" value=<%= bean.getStatusid() %>> <%= bean.getStatusid() %></td>
					<td name="td_userid" value= <%= bean.getUsername() %>> <%= bean.getUsername() %> </td>
					<td name="td_password" value= <%= bean.getPassword() %>> <%= bean.getPassword() %></td>
					<td name="td_photo" value= <%= bean.getPhoto() %>> <%= bean.getPhoto() %></td>
					<td name="td_email" value= <%= bean.getEmail() %>> <%= bean.getEmail() %></td>

				</tr>
			</tbody>
<%
}
%>




		</table>
	</div>

</FORM>
<hr>
<form action="adminhomepage">
<button onclick="">返回管理員主頁面</button>
</form>

</body>
</html>