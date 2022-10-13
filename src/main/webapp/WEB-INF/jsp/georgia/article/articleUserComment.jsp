<%@page import="tw.georgia.article.model.ArticleService"%>
<%@page import="javax.management.MBeanAttributeInfo"%>
<%@page
	import="java.sql.Connection, java.util.*, javax.sql.*, javax.servlet.*,  javax.naming.*,java.io.*,java.sql.* ,tw.georgia.article.model.*,tw.georgia.article.controller.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
<head>
<!--meta charset="UTF-8"  -->
<title>ChiTou留言管理</title>

<link href="https://img.onl/DOO7l" rel="icon" type="image/png" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript"></script>
<style>
* {
	font-size: 102%;
}

table {
	
	width: 100%;
	height: 50px;
	margin: 10 auto;
	border-radius: 5px;
}


button, .btn {
	background-color: #FFFDD0;
	border-color: #FFFDD0;
	color: #265D7E;
	border-radius: 25px;
	font-size: 150%;
}

.centre {
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
	<div class="table-responsive">
		<table class="table table-hover">
			<thead id="tableHead">
				<tr>
					<!--  <th class="card-title text-primary">會員ID</th>-->
					<th class="card-title text-primary">預覽縮圖</th>
					<th class="card-title text-primary">文章標題</th>
					<th class="card-title text-primary">評論日期</th>
					<th class="card-title text-primary">評論內容</th>
					<th class="card-title text-primary">文章內文</th>
					<th class="card-title text-primary">文章管理</th>
				</tr>
			</thead>
			<tbody>

				<%
				List<Reply> list = (List) request.getAttribute("list");
				for (Reply bean : list) {
					if(bean.getUserDelete()==1)
						continue;
					if(bean.getManageHidden()==1)
						continue;
					int title=bean.getArticle().getTitle().length();
					
				%>

				<tr>
					<td class=""><img id="img" src="images/georgia/picture/<%=bean.getArticle().getPhoto()%>" class="box" style="width:100px;height:100px"></td>
					<td><%=(title<20)?bean.getArticle().getTitle().substring(0,title):bean.getArticle().getTitle().substring(0,20)%><HR><%=bean.getArticle().getSubtitle()%></td>
					<td class=""><%=bean.getReplyTime()%></td>
					<td class=""><%=bean.getComment()%></td>
					<td><form action="article.show" method="post">
					<INPUT TYPE="HIDDEN" value=<%=bean.getArticle().getPostID()%> name="postID">
					<input type="submit" name="toShow" value="查看原文章" class="btn btn-light">
					</form></td>
					<td class="">

						<form action="article.userDelete.reply" method="post" style="">
							<!--  <input type="hidden" name="_method" value="DELETE">--> 
							<input type="hidden" name="postID" value=<%=bean.getReplyID()%>>
							<input type="submit" name="userDelete" value="刪除" class="btn btn-light"
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

