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
    <style>
    	#target {
		  position: relative;
		  width: 600px;
		  height: 300px;
		  border-style: solid;
		  float: right;
		}
    </style>
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
				               	<a href="/images/weber/roomStyle/styleNB${bean.styleID}/photo1.jpg">
				               	<img src="/images/weber/roomStyle/styleNB${bean.styleID}/photo1.jpg" width="100" height="100" ></a>
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
			            			<form action="toUpdateStyle" method="post">
			            				<input type="hidden" name="styleID" value="${bean.styleID}">
			                			<button type="submit" class="btn btn-inverse-success btn-icon" style="width:30px;height:30px;" name="toUpdatePage">
		                					<i class="ti-pencil-alt"></i>
		                				</button>
		                			</form>
		                		</div>
			            		<div>
			                		<form action="deleteStyle" method="post" onsubmit="deleteConfirm(event)">
<!-- 										<input type="hidden" name="_method" value="DELETE"/> -->
				                		<input type="hidden" name="styleID" value="${bean.styleID}">
				                		<button type="submit" class="btn btn-inverse-danger btn-icon" style="width:30px;height:30px;" name="delete">
			    		            		<i class="ti-trash"></i>
			            	    		</button>
			            			</form>
		                		</div>
				            </td>
			            	<td>
			            		<form action="#" method="get">
				            		<input type="hidden" name="styleID" value="${bean.styleID}">
				                	<button type="button" class="btn btn-primary mr-2 searchRoomStatus" name="searchRoom">查詢</button>
				            	</form>
				            </td>
		              	</tr>
		            </c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<div id="roomDetailArea"></div>
	
	
	
	
<!-- 	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="btn(data)">明細</button> -->
	
	
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
  
      <div class="modal-header" id="title">
          <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="orderDetail">
        
      </div>
   
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
			<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
		<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		<script type="text/javascript" src="/js/weber/RoomStyleBackMain.js"></script>
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
	        $('#tableHead').append('<th>操作</th><th>查詢房間預定狀況</th>');

	    });
	    function deleteConfirm(event){
	    	event.preventDefault();
	    	var todo = event.target;
	    	Swal.fire({
	    		  title: '確定刪除?',
	    		  icon: 'warning',
	    		  showCancelButton: true,
	    		  confirmButtonColor: '#3085d6',
	    		  cancelButtonColor: '#d33',
	    		  confirmButtonText: '刪掉!',
	    		  cancelButtonText: '取消'
	    		}).then((result) => {
		    		  if (result.isConfirmed) {
		    			  todo.submit();
			    	 }
			})
	    };
	    
	    
	    
	    function btn(data) {
	    	  	console.log(detail);

	    	  	$("#title").html("訂單編號："+ data );
				
	    	  	let orderList="";
				
	    			for(i = 0 ; i < detail.length ; i++){
					
						orderList += 
							"名稱："+detail[i].attractionname +" "+
							detail[i].planname +"</br>"+
							"數量："+detail[i].quantity +"</br>"+
							"金額："+detail[i].price +"<br><hr>";
					};
			
				$("#orderDetail").html(orderList);					
	    		//console.log(orderdetail.attractionname);
	    }
		</script>
  </body>
</html>
