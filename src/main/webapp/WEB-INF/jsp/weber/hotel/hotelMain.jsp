<%@page import="tw.weber.hotel.model.Hotel,java.util.List"%>
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
    <title>飯店後台管理</title>
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>

  </head>
  <body>
    <h2 align="center">飯店查詢</h2>
    <div align="center">
	    <form action="searchHotel" method="get" >
	    <select id="type" name="type">
	    </select>
	    <input type="text" name="keyword">
	    <input type="submit" name="search" value="搜尋">
	    </form>
	</div>
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
							<form action="toUpdateHotel" method="post">
				                <td><input type="hidden" id="hotelID" class="hotelID" name="hotelID" value="${bean.hotelID}">${bean.hotelID}</td>
				                <td><input type="hidden" name="name" value="${bean.name}">${bean.name}</td>
				                <td><input type="hidden" name="address" value="${bean.address}">${bean.address}</td>
				                <td><input type="hidden" name="type" value="${bean.type}">${bean.type}</td>
				                <td><input type="hidden" name="intro" value="${bean.intro}">${bean.intro}</td>
				                <td><input type="hidden" name="country" value="${bean.country}">${bean.country}</td>
				                <td><input type="hidden" name="phone" value="${bean.phone}">${bean.phone}</td>
				                <td><input type="hidden" name="status" value="${bean.status}">${bean.status}</td>
				                <td><input type="hidden" name="capacity" value="${bean.capacity}">${bean.capacity}</td>
				                <td><input type="hidden" name="owner" value="${bean.owner}">${bean.owner}</td>
				                <td><input type="hidden" name="averagePrice" value="${bean.averagePrice}">${bean.averagePrice}</td>
				                <td><input type="hidden" name="photos" value="${bean.photos}">${bean.photos}</td>
				                <td><input type="submit" class="update" name="toUpdatePage" value="修改"></td>
			                </form>
			                <form action="deleteHotel" method="post">
								<input type="hidden" name="_method" value="DELETE"/>
				                <input type="hidden" id="hotelID" class="hotelID" name="hotelID" value="${bean.hotelID}">
				                <td><input type="submit" name="delete" value="刪除"></td>
				            </form>
		              	</tr>
		            </c:forEach>
				</tbody>
			</table>
			<form action="insertHotelPage" method="get">
				<input type="submit" name="add" value="新增">
			</form>
		</div>
	</div>
		<script>
		var type = ["hotelID","name","address","type","intro","country","phone","status","capacity","owner","averagePrice","photos"];
		var typeName = ["飯店ID","飯店名","地址","類型","介紹","國家","電話","狀態","可容納人數","業主名稱","平均房價","照片路徑名稱"];
	    $(document).ready( function () {
	        for(var i=0;i<type.length;i++){
	        	let option = '"<option value="'+type[i]+'">'+typeName[i]+'</option>"';
	        	$('#type').append(option);
	        }
	        for(var i=0;i<typeName.length;i++){
	        	let tr =  '<th>'+typeName[i]+'</th>';
	        	$('#tableHead').append(tr);
	        }
			$('#tableHead').append('"<th></th>"');	        
			$('#tableHead').append('"<th></th>"');	        
	        $('#table').DataTable();
	    }); 
	    $('.delete').on('click',function(){
	    	console.log($(this).val());
// 			var hotelID = $(this).parent().parent().children();
// 			var hotelID = $(this).parent().parent().children().filter($('.hotelID'));
			var hotelID = $(this).parent().parent().find($(".hotelID")).val();
			console.log(hotelID);
	    })
		</script>
  </body>
</html>