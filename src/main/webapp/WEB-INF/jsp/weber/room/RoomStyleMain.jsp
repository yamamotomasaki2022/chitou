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
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>
  </head>
  <body>
    <%@ include file="/WEB-INF/includes/SuperTop.jsp"  %>
    
    <h4 class="card-title text-primary">&nbsp;${hotelResult.name}</h4>
    <div style="display:inline-block;float:left;">
	    <form action="/admin/searchRoom" method="get" >
	    	<select id="type" name="type">
	    	</select>
	    	<input type="text" name="keyword">
	    	<input type="submit" class="btn btn-primary mr-2" value="搜尋">
	    </form>
	</div>
	<div style="display:inline-block;float:right;">
		<form action="/admin/insertStylePage" method="get">
			<input type="submit" class="btn btn-primary mr-2" name="add" value="新增">
		</form>
	</div>
	<div>
		<div class="table-responsive">
	    	<table id="table" class="table table-hover">
	    		<thead>
	              <tr id="tableHead">
	              </tr>
	            </thead>
	            <tbody>
					<c:forEach var="bean" items="${result}">
						<tr>
							<td>
				               	<a href="images/weber/roomStyle/styleNB${bean.styleID}/photo1.jpg">
				               	<img src="images/weber/roomStyle/styleNB${bean.styleID}/photo1.jpg" width="100" height="100" ></a>
				            </td>
							<td>${bean.styleID}</td>
				            <td>${bean.name}</td>
				            <td>${bean.capacity}</td>
				            <td>${bean.price}</td>
				            <td>${bean.bed}</td>
				            <td>${bean.status}</td>
			            	<td>
			            		<% int i=0; %>
				            	<c:forEach var="room" items="${bean.rooms}">
				            	<% i++; %>
				            	</c:forEach>
				            	<% out.print(i); %>
			            	</td>
			            	<td>
			            		<div style="float:left;">
			            			<form action="/admin/toUpdateStyle" method="post">
			            				<input type="hidden" name="styleID" value="${bean.styleID}">
			                			<button type="submit" class="btn btn-inverse-success btn-icon" style="width:30px;height:30px;" name="toUpdatePage">
		                					<i class="ti-pencil-alt"></i>
		                				</button>
		                			</form>
		                		</div>
			            		<div>
			                		<form action="/admin/deleteStyle" method="post">
										<input type="hidden" name="_method" value="DELETE"/>
				                		<input type="hidden" name="styleID" value="${bean.styleID}">
				                		<button type="submit" class="btn btn-inverse-danger btn-icon" style="width:30px;height:30px;" name="delete">
			    		            		<i class="ti-trash"></i>
			            	    		</button>
			            			</form>
		                		</div>
				            </td>
<!-- 			            	<td> -->
<!-- 			            		<form action="addRoom" method="get"> -->
<%-- 				            		<input type="hidden" name="styleID" value="${bean.styleID}"> --%>
<!-- 				                	<input type="submit" class="btn btn-primary mr-2" name="addRoom" value="增加房間"> -->
<!-- 				            	</form> -->
<!-- 				            </td> -->
		              	</tr>
		            </c:forEach>
				</tbody>
			</table>
		</div>
	</div>
			<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>
	
		<script>
		var type = ["photos","styleID","name","capacity","price","bed","status"];
		var typeName = ["照片","房間風格ID","名稱","容量","價格","床位數量","狀態","房間數量"];
	    $(document).ready( function () {
	        for(var i=1;i<type.length;i++){
	        	let option = '"<option value="'+type[i]+'">'+typeName[i]+'</option>"';
	        	$('#type').append(option);
	        }
	        for(var i=0;i<typeName.length;i++){
	        	let tr =  '<th>'+typeName[i]+'</th>';
	        	$('#tableHead').append(tr);
	        }
	        $('#tableHead').append('<th>操作</th>');

	    });
		
		</script>
  </body>
</html>
