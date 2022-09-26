<%@page import="tw.georgia.article.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>

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
<title>更新文章</title>
<link href="https://img.onl/DOO7l" rel="icon" type="image/png" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
*{
font-size: 102%;
}
button, .btn {
	background-color: #FFFDD0;
	border-color: #FFFDD0;
	color: #265D7E;
	border-radius: 25px;
	font-size: 150%;
}
</style>

<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>

</head>

<body>


<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>


<br>
<%
Article tt=(Article)request.getAttribute("findByIdBean");
String articleCiassIDStr=Integer.toString(tt.getTypeID());
int typeID = Integer.parseInt(articleCiassIDStr.substring(3));
%> 
<form action="article.update" method="post" enctype="multipart/form-data">
<input type="hidden" name="_method" value="PUT">
<INPUT TYPE="HIDDEN" NAME="postID" VALUE="<%= tt.getPostID() %>">
<INPUT TYPE="HIDDEN" NAME="posterID" VALUE="<%= tt.getPosterID() %>">
<INPUT TYPE="HIDDEN" NAME="date" VALUE="<%= tt.getDate() %>">
<INPUT TYPE="HIDDEN" NAME="photo" value="<%= tt.getPhoto() %>">
文章標題: <BR><INPUT TYPE="TEXT" NAME="title" VALUE="<%= tt.getTitle() %>"><BR>
<br> 選擇國家<select name="chooseCountry">
			<optgroup label="亞洲">
				<option value=101 <%= (tt.getCountryID()==101)?"selected":"" %>>台灣</option>
				<option value=102 <%= (tt.getCountryID()==102)?"selected":"" %>>日本</option>
				<option value=103 <%= (tt.getCountryID()==103)?"selected":"" %>>韓國</option>
				<option value=108 <%= (tt.getCountryID()==108)?"selected":"" %>>新加坡</option>
				<option value=109 <%= (tt.getCountryID()==109)?"selected":"" %>>印尼</option>
			</optgroup>
			<optgroup label="美洲">
				<option value=201 <%= (tt.getCountryID()==201)?"selected":"" %>>美國</option>
				<option value=202 <%= (tt.getCountryID()==202)?"selected":"" %>>加拿大</option>
			</optgroup>
			<optgroup label="歐洲">
				<option value=301 <%= (tt.getCountryID()==301)?"selected":"" %>>英國</option>
				<option value=302 <%= (tt.getCountryID()==302)?"selected":"" %>>法國</option>
				<option value=304 <%= (tt.getCountryID()==304)?"selected":"" %>>義大利</option>
				<option value=307 <%= (tt.getCountryID()==307)?"selected":"" %>>土耳其</option>
				<option value=308 <%= (tt.getCountryID()==308)?"selected":"" %>>聖托里尼</option>
				<option value=309 <%= (tt.getCountryID()==309)?"selected":"" %>>阿爾巴尼亞</option>
			</optgroup>
			<optgroup label="大洋洲">
				<option value=401 <%= (tt.getCountryID()==401)?"selected":"" %>>澳洲</option>
			</optgroup>
			<optgroup label="非洲">
				<option value=501 <%= (tt.getCountryID()==501)?"selected":"" %>>埃及</option>
			</optgroup>
		</select> 
			<br><br>
		選擇文章類型<select name="chooseType">
			<option value=91 <%= (typeID==91)?"selected":"" %>>遊記</option>
			<option value=92 <%= (typeID==92)?"selected":"" %>>食記</option>
			<option value=93 <%= (typeID==93)?"selected":"" %>>資訊</option>
			<option value=94 <%= (typeID==94)?"selected":"" %>>問題</option>
			<option value=95 <%= (typeID==95)?"selected":"" %>>攻略</option>
			</select> 
		<br><br>
發布日期: <%= tt.getDate() %><BR><BR>
圖片:<img src= "images/georgia/picture/<%=tt.getPhoto()%>" alt="<%=(tt.getPhoto().length() ==0)?"添加一張圖片看看↓":"圖片歪腰(｡•́︿•̀｡)請重新選擇上傳圖片"%>" width="300" /><BR><BR>
選擇新的上傳圖片:<INPUT TYPE="FILE" NAME="photoRenew" ID=""><BR><BR>
<!--圖片上傳:  <BR><INPUT TYPE="TEXT" NAME="photo" VALUE="<%= (tt.getPhoto()==null)?"":tt.getPhoto() %>">-->
文章內文：<BR><INPUT TYPE="TEXT" NAME="content" VALUE="<%= tt.getContent() %>"><BR>


<INPUT TYPE="SUBMIT" value="更新文章" name="updateArticle" class="btn">
</form>

<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>

<script type="text/javascript">

</script>
</body>
</html>