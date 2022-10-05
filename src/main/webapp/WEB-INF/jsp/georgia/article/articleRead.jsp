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
	<th class="card-title text-primary">文章管理</th>
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
					<td name="countryID" class="centre"><%=bean.getCategory().getCountry()%></td>
					<td name="typeID" class="centre"><%=bean.getCategory().getType()%></td>
					<td><%=(title<20)?bean.getTitle().substring(0,title):bean.getTitle().substring(0,20)%></td>
					<td name="date" class="centre"><%=bean.getDate() %></td>
					<td><form action="article.show" method="post">
					<INPUT TYPE="HIDDEN" value=<%=bean.getPostID()%> name="postID">
					<input type="submit" name="toShow" value="查看詳細內文" class="btn btn-light">
					</form></td>
					<td class="centre">

						<form action="article.renew" method="post" style="">
							<INPUT TYPE="HIDDEN" value=<%=bean.getPostID()%> name="postID">
							<input type="submit" name="update" value="修改" class="btn btn-primary mr-2"
								id="update">
						</form>

						<form action="article.delete" method="post" style="">
							<input type="hidden" name="_method" value="DELETE"> <input
								type="hidden" name="postID" value=<%=bean.getPostID()%>>
							<input type="submit" name="delete" value="刪除" class="btn btn-light"
								id="check">
						</form>


					</td>
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
$(function() {
	$('form').on('click', ':submit', function() {
		console.log('button click')
		return check($(this).val());
	});

	function check(action) {
		let msg = '';
		if (action === '刪除') {
			return message('確定刪除嗎?');
		} else if (action === '修改') {
			return message('確定更新嗎?');
		} else {
			return true;
		}
	}

	function message(msg) {
		if (confirm(msg)) {
			return true
		} else {
			return false
		}
	}

})

</script>
</body>
</html>