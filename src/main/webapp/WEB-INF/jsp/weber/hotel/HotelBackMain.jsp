<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8" />
    <title>飯店後台管理</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>
  </head>
  <body>
  
	<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>
	
    	<h4 class="card-title text-primary">&nbsp;飯店管理</h4>
    <div style="display:inline-block;float:left;">
	    <form action="/admin/searchHotel" method="get" >
	    	<select id="type" name="type">
	    	</select>
	    	<input type="text" name="keyword">
	    	<input type="submit" class="btn btn-primary mr-2" value="搜尋">
	    </form>
	</div>
	<div style="display:inline-block;float:right;">
		<form action="/admin/insertHotelPage" method="get">
			<input type="submit" class="btn btn-primary mr-2" name="add" value="新增">
		</form>
	</div>
	<div>
		<div class="table-responsive">
	    	<table class="table table-hover">
	    		<thead>
	              <tr id="tableHead">
	              </tr>
	            </thead>
	            <tbody>
					<c:forEach var="bean" items="${result}">
						<tr>
							<td>
			                	<a href="/images/weber/hotel/hotelNB${bean.hotelID}/photo1.jpg">
			                	<img src="/images/weber/hotel/hotelNB${bean.hotelID}/photo1.jpg" width="100" height="100" ></a>
			                </td>
			                <td>${bean.hotelID}</td>
			                <td>${bean.name}</td>
			                <td>${bean.type}</td>
			                <td>${bean.country}</td>
			                <td>${bean.status}</td>
			                <td>${bean.capacity}</td>
			                <td>${bean.owner}</td>
			                <td>${bean.averagePrice}</td>
			                <td>
			                	<div style="float:left;">
			            			<form action="/admin/toUpdateHotel" method="post">
			            				<input type="hidden" id="hotelID" class="hotelID" name="hotelID" value="${bean.hotelID}">
			                			<button type="submit" class="btn btn-inverse-success btn-icon" style="width:30px;height:30px;" name="toUpdatePage">
		                					<i class="ti-pencil-alt"></i>
		                				</button>
		                			</form>
		                		</div>
								<div>
		                			<form action="/admin/deleteHotel" method="post" onsubmit="deleteConfirm(event)">
<!-- 										<input type="hidden" name="_method" value="DELETE"/> -->
			                			<input type="hidden" id="hotelID" class="hotelID" name="hotelID" value="${bean.hotelID}">
			                			<button type="submit" class="btn btn-inverse-danger btn-icon" style="width:30px;height:30px;" >
			                				<i class="ti-trash"></i>
			                			</button>
			            			</form>
			            		</div>
			            	</td>
			            	<td>
			            		<div>
			            			<form action="/admin/toRoomPage" method="get">
			            				<input type="hidden" name="name" value="${bean.name}">
			            				<input type="hidden" id="hotelID" class="hotelID" name="hotelID" value="${bean.hotelID}">
			                			<input type="submit" class="btn btn-primary mr-2" value="房間">
			            			</form>
			            		</div>
			            	</td>
		              	</tr>
		            </c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
		<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
		var type = ["photos","hotelID","name","type","country","status","capacity","owner","averagePrice"];
		var typeName = ["照片","飯店ID","飯店名","類型","國家","狀態","可容納人數","業主名稱","平均房價"];
	    $(document).ready( function () {
	        for(var i=1;i<type.length;i++){
	        	let option = '"<option value="'+type[i]+'">'+typeName[i]+'</option>"';
	        	$('#type').append(option);
	        }
	        for(var i=0;i<typeName.length;i++){
	        	let tr =  '<th>'+typeName[i]+'</th>';
	        	$('#tableHead').append(tr);
	        }
			$('#tableHead').append('<th>操作</th><th></th>');	        
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
	</script>
  </body>
</html>