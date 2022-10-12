<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="tw.georgia.article.model.* , java.util.*, java.sql.*, javax.servlet.* , javax.naming.*, java.sql.*, javax.sql.*"%> 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查詢文章</title>
<link href="https://img.onl/DOO7l" rel="icon" type="image/png" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
#BackTop	{
				position:fixed;				
				bottom:140px;
				right:31px;
				}
#ToBottom	{
				position:fixed;				
				bottom:90px;
				right:31px;
				}
.jiantou	{
				width: 2.7rem;
				height: 2.7rem;
				color:rgb(75,73,172);
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
	<th class="card-title text-primary">預覽縮圖</th>
	<th class="card-title text-primary">文章標題</th>
	<th class="card-title text-primary">發布日期</th>
	<th class="card-title text-primary">文章內文</th>
	<th class="card-title text-primary">文章管理</th>
	</tr>
	</thead>
	<tbody>
<%
List<Article> list=(List)request.getAttribute("search");
for (Article bean : list) {
	int title=bean.getTitle().length();
	
		%>
				<tr>
					<td name="posterID" class="centre"><%=bean.getPosterID() %></td>
					<td name="countryID" class="centre"><%=bean.getCategory().getCountry()%></td>
					<td name="typeID" class="centre"><%=bean.getCategory().getType()%></td>
					<td class=""><img id="img" src="images/georgia/picture/<%=bean.getPhoto()%>" class="box" style="width:100px;height:100px"></td>
					<td><%=(title<20)?bean.getTitle().substring(0,title):bean.getTitle().substring(0,20)%><HR><%=bean.getSubtitle()%></td>
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
		
<svg type="button" id="BackTop" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-circle-fill jiantou" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 0 0 8a8 8 0 0 0 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
</svg>
<svg type="button" id="ToBottom" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-circle-fill jiantou" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z"/>
</svg>
<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>

<script>
function back(){
	history.back();
}
$(function() {
	
	$('#BackTop').click(function(){ 
		$('html,body').animate({scrollTop:0}, 200);
	});
	$('#ToBottom').click(function(){ 
		$('html,body').animate({scrollTop:document.body.scrollHeight}, 200);
	});
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