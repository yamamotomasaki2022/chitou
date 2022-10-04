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
//String articleCiassIDStr=Integer.toString(tt.getCategory().getCategoryID());
//int typeID = Integer.parseInt(articleCiassIDStr.substring(3));

%> 
<form action="article.update" method="post" enctype="multipart/form-data">
<input type="hidden" name="_method" value="PUT">
<INPUT TYPE="HIDDEN" NAME="postID" VALUE="<%= tt.getPostID() %>">
<INPUT TYPE="HIDDEN" NAME="posterID" VALUE="<%= tt.getPosterID() %>">
<INPUT TYPE="HIDDEN" NAME="date" VALUE="<%= tt.getDate() %>">
文章標題: <BR><INPUT TYPE="TEXT" NAME="title" VALUE="<%= tt.getTitle() %>" style="width: 100%;"><BR>
文章副標題: <BR><INPUT TYPE="TEXT" NAME="subtitle" VALUE="" id="subtitleInput" style="width: 100%;"><BR><BR>
選擇縮圖:<BR><INPUT TYPE="FILE" NAME="photo" ID="upload"><BR>
	   <div id="picPreview"></div><BR>
<br> 選擇國家<select name="chooseCountry">
			<optgroup label="亞洲">
				<option value=101 <%= (tt.getCategory().getCountryID()==101)?"selected":"" %>>台灣</option>
				<option value=102 <%= (tt.getCategory().getCountryID()==102)?"selected":"" %>>日本</option>
				<option value=103 <%= (tt.getCategory().getCountryID()==103)?"selected":"" %>>韓國</option>
				<option value=108 <%= (tt.getCategory().getCountryID()==108)?"selected":"" %>>新加坡</option>
				<option value=109 <%= (tt.getCategory().getCountryID()==109)?"selected":"" %>>印尼</option>
			</optgroup>
			<optgroup label="美洲">
				<option value=201 <%= (tt.getCategory().getCountryID()==201)?"selected":"" %>>美國</option>
				<option value=202 <%= (tt.getCategory().getCountryID()==202)?"selected":"" %>>加拿大</option>
			</optgroup>
			<optgroup label="歐洲">
				<option value=301 <%= (tt.getCategory().getCountryID()==301)?"selected":"" %>>英國</option>
				<option value=302 <%= (tt.getCategory().getCountryID()==302)?"selected":"" %>>法國</option>
				<option value=304 <%= (tt.getCategory().getCountryID()==304)?"selected":"" %>>義大利</option>
				<option value=307 <%= (tt.getCategory().getCountryID()==307)?"selected":"" %>>土耳其</option>
				<option value=308 <%= (tt.getCategory().getCountryID()==308)?"selected":"" %>>聖托里尼</option>
				<option value=309 <%= (tt.getCategory().getCountryID()==309)?"selected":"" %>>阿爾巴尼亞</option>
			</optgroup>
			<optgroup label="大洋洲">
				<option value=401 <%= (tt.getCategory().getCountryID()==401)?"selected":"" %>>澳洲</option>
			</optgroup>
			<optgroup label="非洲">
				<option value=501 <%= (tt.getCategory().getCountryID()==501)?"selected":"" %>>埃及</option>
			</optgroup>
		</select> 
			<br><br>
		選擇文章類型<select name="chooseType">
			<option value=91 <%= (tt.getCategory().getTypeID()==91)?"selected":"" %>>遊記</option>
			<option value=92 <%= (tt.getCategory().getTypeID()==92)?"selected":"" %>>食記</option>
			<option value=93 <%= (tt.getCategory().getTypeID()==93)?"selected":"" %>>資訊</option>
			<option value=94 <%= (tt.getCategory().getTypeID()==94)?"selected":"" %>>問題</option>
			<option value=95 <%= (tt.getCategory().getTypeID()==95)?"selected":"" %>>攻略</option>
			</select> 
		<br><br>
發布日期: <%= tt.getDate() %><BR><BR>
<%-- 文章內文：<BR><INPUT TYPE="TEXT" NAME="content" VALUE="<%= tt.getContent() %>"><BR> --%>
<textarea id="contentInput" name="content"><%= tt.getContent() %></textarea>

<INPUT TYPE="SUBMIT" value="更新文章" name="updateArticle" class="btn btn-primary mr-2">
</form>

<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>

<script type="text/javascript"></script>
<script src="/js/coco/ckeditor.js"></script>
<script>
$('#upload').on('change',function(e){
	$('#picPreview').empty();
	var photos = this.files;
	for(let i=0;i<photos.length;i++){
		var file = photos[i];
		var fr = new FileReader();
		fr.onload = function(e){
			$('#picPreview').append('<img id="img" src="'+e.target.result+'" class="box" style="height:100px">');
		};
		fr.readAsDataURL(file);
	};
});
</script>
<script>
ClassicEditor
.create(document.querySelector('#contentInput'),{
	    ckfinder: {
	        uploadUrl: '/ckUploadGeorgia'
	    },
	}).then(editor => {
 	  console.log("editor1 success");
});
</script>
</body>
</html>