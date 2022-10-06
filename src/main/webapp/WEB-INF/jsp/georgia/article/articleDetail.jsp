<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="tw.georgia.article.model.* , java.util.*, java.sql.*, javax.servlet.* , javax.naming.*, java.sql.*, javax.sql.*"%> 
<%
Article tt=(Article)request.getAttribute("findByID");
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>【<%=tt.getCategory().getType().trim()%>】<%=tt.getTitle() %></title>
<link href="https://img.onl/DOO7l" rel="icon" type="image/png" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
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

<h2>【<%=tt.getCategory().getType().trim()%>】<%=tt.getTitle() %></h2>
<h4><%=tt.getSubtitle() %></h4>
<hr>
<p style="color:gray;font-size: 5px;"><%=tt.getDate() %> 發布</p>
<%=tt.getContent() %>

<table>
	<thead>
		<tr>
			<th><h3>留言區</h3></th>
		</tr>
	</thead>
	<tbody>
		<tr>
		<%Set<Reply> replySet=tt.getReply();
		for(Reply reply:replySet){
			%>	
		
			<td><img id="img" src="images/georgia/picture/354617.jpg" class="box" style="width:100px;height:100px"></td>
			<td><%=reply.getComment()%></td>
			<td><input type="button" value="回覆"></td>
			<br><br></tr>
		<%}%>
		<tr>
			<td><img id="img" src="images/georgia/picture/354617.jpg" class="box" style="width:100px;height:100px"></td>
			<td><input type="text" placeholder="喵喵喵"></td>
			<td><input type="button" value="送出"></td>
		</tr>
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
	history.back();}
</script>

<script>
$(function() {
	$('#BackTop').click(function(){ 
		$('html,body').animate({scrollTop:0}, 200);
	});
	$('#ToBottom').click(function(){ 
		$('html,body').animate({scrollTop:document.body.scrollHeight}, 200);
	});


})
</script>
</body>
</html>