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


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查詢文章</title>
<link href="https://img.onl/DOO7l" rel="icon" type="image/png" />
<style>

</style>


<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>

</head>

<body>

<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>


<br>

<INPUT TYPE="Button" value="返回" name="goBack" class="btn btn-primary mr-2" onclick="back()"><br><br>

<div class="table-responsive">
<%
Article tt=(Article)request.getAttribute("findByID");
String type="";
String typeID=Integer.toString(tt.getTypeID()).substring(3);
switch(typeID){
	case "91":
		type="遊記";
		break;
	case "92":
		type="食記";
		break;
	case "93":
		type="資訊";
		break;
	case "94":
		type="問題";
		break;
	case "95":
		type="攻略";
		break;
};
%> 
<h1>【<%=type %>】<%=tt.getTitle() %></h1>
<hr>
<p style="color:gray;font-size: 5px;"><%=tt.getDate() %> 發布</p>
<%=tt.getContent() %>
</div>
<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>

<script>
function back(){
	history.back();
}

</script>
</body>
</html>