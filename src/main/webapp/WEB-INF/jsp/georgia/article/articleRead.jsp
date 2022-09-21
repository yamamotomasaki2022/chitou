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
            border: 2px solid black;
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
</head>

<body>
<header>

</header>
<br>

<INPUT TYPE="Button" value="返回" name="goBack" class="btn" onclick="back()"><br><br>
<table border="1" >
    <th width=3.55%>會員ID</th>
    <th width=3.55%>國家編號</th> 
    <th width=6.35%>文章類型編號</th>
    <th width=25%>文章標題</th> 
    <th width=5.55%>發布日期</th>
    <th width=15%>圖片上傳</th> 
    <th>文章內文</th>
    
<%
List<Article> list=(List)request.getAttribute("searchBean");
for (Article bean : list) {
		%>
				<tr>
					<td name="posterID" class="centre"><%=bean.getPosterID() %></td>
					<td name="countryID" class="centre"><%=bean.getCountryID() %></td>
					<td name="typeID" class="centre"><%=bean.getTypeID() %></td>
					<td name="title"><%=bean.getTitle() %></td>
					<td name="date" class="centre"><%=bean.getDate() %></td>
					<td><img src= "images/georgia/picture/<%=bean.getPhoto()%>" alt="<%=(bean.getPhoto().length() ==0)?"":"圖片歪腰(｡•́︿•̀｡)"%>"  width="200"  /></td>
					<td name="content"><%=bean.getContent() %><h7 style="color:gray">......</h7><h7 style="color:blue">查看詳細內文</h7></td>
				</tr>
			<%
}
%>
<script>
function back(){
	history.back();
}

</script>
</body>
</html>