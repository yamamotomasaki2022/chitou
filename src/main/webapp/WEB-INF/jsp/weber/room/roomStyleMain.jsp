<%@page import="org.springframework.context.annotation.Bean"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.setContentType("text/html;charset=UTF-8");
%>
<!doctype html>
<html lang="en">
  <head>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8" />
    <title>房間後台管理</title>
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>

  </head>
  <body>
    <%@ include file="/WEB-INF/includes/Header.jsp"  %>
    <h2 align="center"></h2>
    <h2 align="center">${hotelResult.name}</h2>
<!--     <div align="center"> -->
<!-- 	    <form action="searchRoom" method="get" > -->
<!-- 	    <select id="type" name="type"> -->
<!-- 	    </select> -->
<!-- 	    <input type="text" name="keyword"> -->
<!-- 	    <input type="submit" name="search" value="搜尋"> -->
<!-- 	    </form> -->
<!-- 	</div> -->
	<div>
		<div align="center">
	    	<table id="table" class="display">
	    		<thead>
	              <tr id="tableHead">
	              </tr>
	            </thead>
	            <tbody>
					<c:forEach var="bean" items="${result}">
						<tr>
							<td>${bean.styleID}</td>
				            <td>${bean.name}</td>
				            <td>${bean.capacity}</td>
				            <td>${bean.price}</td>
				            <td>${bean.bed}</td>
				            <td>
				               	<a href="images/weber/roomStyle/styleNB${bean.styleID}/photo1.jpg">
				               	<img src="images/weber/roomStyle/styleNB${bean.styleID}/photo1.jpg" width="100" height="100" ></a>
				            </td>
				            <td>${bean.status}</td>
			            	<td>
			            		<% int i=0; %>
				            	<c:forEach var="room" items="${bean.rooms}">
				            	<% i++; %>
				            	</c:forEach>
				            	<% out.print(i); %>
			            	</td>
			            	<td>
			            		<form action="toUpdateStyle" method="post">
			            			<input type="hidden" name="styleID" value="${bean.styleID}">
			                		<input type="submit" class="update" name="toUpdatePage" value="修改">
		                		</form>
		                		<form action="deleteStyle" method="post">
									<input type="hidden" name="_method" value="DELETE"/>
			                		<input type="hidden" name="styleID" value="${bean.styleID}">
			                		<input type="submit" name="delete" value="刪除">
			            		</form>
				            	</td>
			            	<td>
			            		<form action="addRoom" method="get">
				            		<input type="hidden" name="styleID" value="${bean.styleID}">
				                	<input type="submit" name="addRoom" value="增加房間">
				            	</form>
				            </td>
		              	</tr>
		            </c:forEach>
				</tbody>
			</table>
			<form action="insertStylePage" method="get">
				<input type="submit" name="add" value="新增">
			</form>
		</div>
	</div>
		<script>
		var type = ["styleID","name","capacity","price","bed","photos","status"];
		var typeName = ["房間風格ID","名稱","容量","價格","床位數量","照片","狀態","房間數量"];
	    $(document).ready( function () {
// 	        for(var i=0;i<type.length;i++){
// 	        	let option = '"<option value="'+type[i]+'">'+typeName[i]+'</option>"';
// 	        	$('#type').append(option);
// 	        }
	        for(var i=0;i<typeName.length;i++){
	        	let tr =  '<th>'+typeName[i]+'</th>';
	        	$('#tableHead').append(tr);
	        }
	        $('#tableHead').append('<th></th><th></th>');
	        $('#table').DataTable();

	    });
		
		</script>
  </body>
</html>