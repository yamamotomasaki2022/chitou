<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>

<%@page import="javax.management.MBeanAttributeInfo"%>
<%@page
	import=" java.util.*,tw.jacky.login.model.*"%>



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

#list {
text-align:center;
}

</style>

<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>

</head>
<body>

<%@include file="/WEB-INF/includes/Header.jsp" %>

<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>



	<FORM ACTION="/manager/AdminQueryMember">
		<h1>查詢主頁面</h1>

	<div>
	<select name="searchinfo" style="float:left">
				<option value="memberid">會員編號</option>	
				<option value="username">賬號</option>
				<option value="auth">身份</option>
				<option value="email">郵箱</option>

	</select>  <br><br><br>

	<input type="text" name="searchtext" size="5" style="float:left">
	<input class="btn btn-inverse-primary btn-fw" type="submit" name="searchmemberinDB"
				value="查詢" style="float:left">
		<br>		

		<div id="list" >
		<label > 會員資料庫列表</label>
		
		</div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>會員編號</th>
					<th>賬號</th>
					<th>權限</th>
					<th>郵箱</th>
				</tr>
			</thead>

			<tbody>
<% 

List<MemberBasicInfo> result =(List)request.getAttribute("result");
for(MemberBasicInfo bean:result) { %>

				<tr>
					<td name="td_memberid" value=<%= bean.getMemberid() %>> <%= bean.getMemberid() %></td>
					<td name="td_userid" value= <%= bean.getUsername() %>> <%= bean.getUsername() %> </td>
					<td name="td_statusid" value=<%= bean.getLoginStatus().getStatusname()  %>> <%= bean.getLoginStatus().getStatusname() %></td>
<%-- 					<td name="td_password" value= <%= bean.getPassword() %>> <%= bean.getPassword() %></td> --%>
<%-- 					<td name="td_photo" value= <%= bean.getPhoto() %>> <%= bean.getPhoto() %></td> --%>
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
<form action="AdminHomePage">
<button class="btn btn-inverse-primary btn-fw" onclick="">返回管理員主頁面</button>
</form>

<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>


</body>
</html>