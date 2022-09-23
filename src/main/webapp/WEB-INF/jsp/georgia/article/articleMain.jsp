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
<title>ChiTou文章管理</title>

<link href="https://img.onl/DOO7l" rel="icon" type="image/png" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript"></script>
<style>
* {
	font-size: 102%;
}

table {
	border: 2px solid black;
	width: 100%;
	height: 50px;
	margin: 10 auto;
	border-radius: 5px;
}

th {
	border: 1px solid black;
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
</style>

<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>

</head>
<body>


	<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>



	<br>
	<form action="article.new" method="get">
		<INPUT TYPE="SUBMIT" value="新增文章" name="newarticle" class="btn">
	</form>

	<br>
	<form action="article.read" method="post">
		選擇國家<select name="chooseCountry">
			<optgroup label="亞洲">
				<option value=101>台灣</option>
				<option value=102>日本</option>
				<option value=103>韓國</option>
				<option value=108>新加坡</option>
				<option value=109>印尼</option>
			</optgroup>
			<optgroup label="美洲">
				<option value=201>美國</option>
				<option value=202>加拿大</option>
			</optgroup>
			<optgroup label="歐洲">
				<option value=301>英國</option>
				<option value=302>法國</option>
				<option value=304>義大利</option>
				<option value=307>土耳其</option>
				<option value=308>聖托里尼</option>
				<option value=309>阿爾巴尼亞</option>
			</optgroup>
			<optgroup label="大洋洲">
				<option value=401>澳洲</option>
			</optgroup>
			<optgroup label="非洲">
				<option value=501>埃及</option>
			</optgroup>
		</select> 選擇文章類型<select name="chooseType">
			<option value="">全部</option>
			<option value=91>遊記</option>
			<option value=92>食記</option>
			<option value=93>資訊</option>
			<option value=94>問題</option>
			<option value=95>攻略</option>
		</select> <INPUT TYPE="SUBMIT" value="查詢" name="chooseArticle" class="btn"><br>
		<br>
	</form>
	<div class="table-responsive">
		<table class="table table-hover">
			<thead id="tableHead">
				<tr>
					<th width=3.55%>會員ID</th>
					<th width=3.55%>國家編號</th>
					<th width=6.35%>文章類型編號</th>
					<th width=25%>文章標題</th>
					<th width=5.55%>發布日期</th>
					<th width=8%>圖片上傳</th>
					<th>文章內文</th>
					<th width=6%>文章管理</th>
				</tr>
			</thead>
			<tbody>

				<%
				List<Article> list = (List) request.getAttribute("list");
				for (Article bean : list) {
				%>

				<tr>
					<td class="centre"><%=bean.getPosterID()%></td>
					<td class="centre"><%=bean.getCountryID()%></td>
					<td class="centre"><%=bean.getTypeID()%></td>
					<td><%=bean.getTitle()%></td>
					<td class="centre"><%=bean.getDate()%></td>
					<td><img src="images/georgia/picture/<%=bean.getPhoto()%>"
						alt="<%=(bean.getPhoto().length() == 0) ? "" : "圖片歪腰(｡•́︿•̀｡)"%>"
						width="200" /></td>
					<td><%=bean.getContent()%><h7 style="color:gray">......</h7> <h7
							style="color:blue">查看詳細內文</h7></td>
					<td class="centre">

						<form action="article.renew" method="post" style="">
							<INPUT TYPE="HIDDEN" value=<%=bean.getPostID()%> name="postID">
							<INPUT TYPE="HIDDEN" value=<%=bean.getPosterID()%>
								name="posterID"> <INPUT TYPE="HIDDEN"
								value=<%=bean.getCountryID()%> name="countryID"> <INPUT
								TYPE="HIDDEN" value=<%=bean.getTypeID()%> name="typeID">
							<INPUT TYPE="HIDDEN" value=<%=bean.getTitle()%> name="title">
							<INPUT TYPE="HIDDEN" value=<%=bean.getDate()%> name="articleDate">
							<INPUT TYPE="HIDDEN" value=<%=bean.getPhoto()%> name="photo">
							<INPUT TYPE="HIDDEN" value=<%=bean.getContent()%> name="content">
							<input type="submit" name="update" value="修改" class="btn"
								id="update">
						</form>

						<form action="article.delete" method="post" style="">
							<input type="hidden" name="_method" value="DELETE"> <input
								type="hidden" name="postID" value=<%=bean.getPostID()%>>
							<input type="submit" name="delete" value="刪除" class="btn"
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

