<%@page import="tw.jacky.login.model.*"%>
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
	<!--  <form action="article.new" method="get">
		<INPUT TYPE="SUBMIT" value="新增文章" name="newarticle" class="btn btn-primary mr-2">
	</form>-->

	<br>
	<form action="article.admin.read" method="post">
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
		</select> <INPUT TYPE="SUBMIT" value="查詢" name="chooseArticle" class="btn btn-primary mr-2"><br>
		<br>
	</form>
	<div class="table-responsive">
		<table class="table table-hover">
			<thead id="tableHead">
				<tr>
					<th class="card-title text-primary">會員ID</th>
					<th class="card-title text-primary">國家<BR>文章類型</th>
					<th class="card-title text-primary">預覽縮圖</th>
					<th class="card-title text-primary">文章標題</th>
					<th class="card-title text-primary">發布日期</th>
					<th class="card-title text-primary">文章內文</th>
					<th class="card-title text-primary">文章狀態</th>
					<th class="card-title text-primary">文章管理</th>
				</tr>
			</thead>
			<tbody>

				<%
				List<Article> list = (List) request.getAttribute("list");
				for (Article bean : list) {
					int title=bean.getTitle().length();
					String status="";
					if(bean.getUserDelete()==1){
						status="會員自行刪除";
					}else if(bean.getManageHidden()==1){
						status="文章已隱藏";
					}else{
						status="文章上架中";
					}
					
					
				%>

				<tr>
					<td class=""><%=bean.getMember().getMemberid()%></td>
					<td class=""><%=bean.getCategory().getCountry()%><HR><%=bean.getCategory().getType()%></td>
					<td class=""><img id="img" src="images/georgia/picture/<%=bean.getPhoto()%>" class="box" style="width:80px;height:80px"></td>
					<td><%=(title<20)?bean.getTitle().substring(0,title):bean.getTitle().substring(0,20)%><HR><%=bean.getSubtitle()%></td>
					<td class=""><%=bean.getDate()%></td>
					<td>
					<form action="article.admin.show" method="post">
					<INPUT TYPE="HIDDEN" value=<%=bean.getPostID()%> name="postID">
					<input type="submit" name="toShow" value="查看詳細內文" class="btn btn-light">
					</form>
					</td>
					<td class=""><%=status%></td>
					<td class="">

						<form action="article.mail" method="post" style="">
							<INPUT TYPE="HIDDEN" value=<%=bean.getPostID()%> name="postID">
							<input type="submit" name="update" value="通知" class="btn btn-primary mr-2"
								id="update">
						</form>

						<form action="article.manageHidden" method="post" style="">
							<!--  <input type="hidden" name="_method" value="DELETE"> -->
							<input type="hidden" name="postID" value=<%=bean.getPostID()%>>
							<input type="submit" name="" value="隱藏" class="btn btn-light"
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

