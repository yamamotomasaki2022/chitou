<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="tw.georgia.article.model.* , java.util.*, java.sql.*, javax.servlet.* , javax.naming.*, java.sql.*, javax.sql.*"%>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
List<Category> list=(List)request.getAttribute("findCountry");
for (Category bean : list) {

	bean.getCategoryID();
	bean.getCountryID();s
	bean.getTypeID();
	
	
		 }%>
</body>
<%
List<Category> list=(List)request.getAttribute("findCountry");
for (Category bean : list) {%>

	<%=bean.getCategoryID()%>
	<%=bean.getCountryID()%>
	<%=bean.getTypeID()%>
	
	
		<% }%>
</html>