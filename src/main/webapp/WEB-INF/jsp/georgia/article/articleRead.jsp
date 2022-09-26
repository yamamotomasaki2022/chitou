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
*{
font-size: 102%;
}
table {
            width: 100%;
            height: 50px;
            margin: 10 auto;
            border-radius: 5px;
            
        }
       .btn{
			 background-color:#FFFDD0;
			 border-color:#FFFDD0;
			 color:#265D7E;
			 border-radius: 25px;
			 font-size: 150%;
		 }
		 .centre{
		 text-align: center;
		 }
</style>


<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>

</head>

<body>

<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>


<br>

<INPUT TYPE="Button" value="返回" name="goBack" class="btn btn-primary mr-2" onclick="back()"><br><br>
<div class="table-responsive">
<table class="table table-hover" >
    <thead id="tableHead">
	<tr>
    <th class="card-title text-primary">會員ID</th>
	<th class="card-title text-primary">國家</th>
	<th class="card-title text-primary">文章類型</th>
	<th class="card-title text-primary">文章標題</th>
	<th class="card-title text-primary">發布日期</th>
	<th class="card-title text-primary">文章內文</th>
	</tr>
	</thead>
	<tbody>
<%
List<Article> list=(List)request.getAttribute("searchBean");
for (Article bean : list) {
	int title=bean.getTitle().length();
		%>
				<tr>
					<td name="posterID" class="centre"><%=bean.getPosterID() %></td>
					<td name="countryID" class="centre"><%=bean.getCountryID() %></td>
					<td name="typeID" class="centre"><%=bean.getTypeID() %></td>
					<td><%=(title<6)?bean.getTitle().substring(0,title):bean.getTitle().substring(0,6)%></td>
					<td name="date" class="centre"><%=bean.getDate() %></td>
					<td name="content"><%=bean.getContent() %><h7 style="color:gray">......</h7><h7 style="color:blue">查看詳細內文</h7></td>
				</tr>
			<%
}
%>
</tbody>
		</table>
		</div>
<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>

<script>
function back(){
	history.back();
}

</script>
</body>
</html>