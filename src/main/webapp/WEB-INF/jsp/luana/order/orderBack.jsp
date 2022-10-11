<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import= "tw.luana.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- BootStrap -->

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" 
		rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" 
		crossorigin="anonymous">

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

    <!-- dataTable -->
    
    <!--
    
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">

    <script type="text/javascript" charset="utf8"
        src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
	
	<script src="js/luana/dataTable.js"></script>
	
	-->
		<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>
	
	
    <title>BackOrderList</title>

</head>

<body>

	<%@ include file="/WEB-INF/includes/SuperTop.jsp"  %>
	
	
	    <div style="display:inline-block;float:left;">
	    <form action="/admin/searchHotel" method="get" >
	    	<select id="type" name="type">
	    	</select>
	    	<input type="text" name="keyword">
	    	<input type="submit" class="btn btn-primary mr-2" value="搜尋">
	    </form>
	</div>

	
	
	<div class="table-responsive">
    <table id="table_id"  class="table table-hover">
        <thead>
            <tr id="tableHead">
      
               
            </tr>
        </thead>
        <tbody>
           <c:forEach var="order" items="${orderBack}">
				
					<tr>
						<td id="ordertype">${order.ordertype}</td>
						<td id="orderdate">${order.orderdate}</td>
						<td id="orderid">${order.orderid}</td>
						<td id="ordertype">${order.totalprice}</td>
						<td id="orderstatus">${order.orderstatus}</td>
						<td id="memberid">${order.memberid}</td>
						
						<c:choose>
							<c:when test="${order.ordertype == '景點'}">
								<td>
									<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" value="${order.orderid}" onclick="btnAttraction('${order.orderid}')" >
  									明細
									</button>
								</td>
							</c:when>
							<c:when test="${order.ordertype == '飯店'}">
								<td>
									<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" value="${order.orderid}" onclick="btnHotel('${order.orderid}')" >
  									明細
									</button>
								</td>
							</c:when>
							<c:when test="${order.ordertype == '機票'}">
								<td>
									<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" value="${order.orderid}" onclick="btnFlight('${order.orderid}')" >
  									明細
								</button>
								</td>
							</c:when>
						</c:choose>
						
            </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>
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
    <script type="text/javascript">
    	
  	//let orderId = $("#detail").val();
  	//console.log(orderId);
    function btnAttraction(data) {
    
    	 $.ajax({
    	  	url: "attractionOrderDetail",	//上傳URL
    	  	type: "POST", //請求方式
    	  	data: {"orderid": data}, //需要上傳的數據
    	  	//contentType:"application/json",
    	  	dataType: "JSON", //設置接受到的響應數據的格式
    	  	success: function (detail) {	//請求成功
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
    	  	},
    	  	error: function () {
    			console.log("Oh no...");
    	  	},//表示如果請求響應出現錯誤，會執行的回調函數
    	 });
    }
    
    function btnHotel(data) {
    
    	 $.ajax({
    	  	url: "hotelOrderDetail",	//上傳URL
    	  	type: "POST", //請求方式
    	  	data: {"orderid": data}, //需要上傳的數據
    	  	//contentType:"application/json",
    	  	dataType: "JSON", //設置接受到的響應數據的格式
    	  	success: function (detail) {	//請求成功
    	  	console.log(detail);

    	  	$("#title").html("訂單編號："+ data );
			
    	  	let orderList="";
			
    			for(i = 0 ; i < detail.length ; i++){
				
					orderList += 
						"名稱："+detail[i].hotelName +" "+
						detail[i].roomName +"</br>"+
						"人數："+detail[i].numberOfPeople +"</br>"+
						"入住日："+detail[i].checkInDate +"</br>"+
						"退房日："+detail[i].checkOutDate +"<br><hr>";
						
				};
		
			$("#orderDetail").html(orderList);					
    		//console.log(orderdetail.attractionname);
    	  	},
    	  	error: function () {
    			console.log("Oh no...");
    	  	},//表示如果請求響應出現錯誤，會執行的回調函數
    	 });
    }
    </script>
    
    <script type="text/javascript">
    	var type = ["orderid","ordertype","orderdate","orderstatus","totalprice","memberid"];
		var typeName = ["訂單種類","下訂日","訂單編號","總價","訂單狀態","會員編號"];
	    $(document).ready( function () {
	        for(var i=1;i<type.length;i++){
	        	let option = '"<option value="'+type[i]+'">'+typeName[i]+'</option>"';
	        	$('#type').append(option);
	        }
	        for(var i=0;i<typeName.length;i++){
	        	let tr =  '<th>'+typeName[i]+'</th>';
	        	$('#tableHead').append(tr);
	        }
			$('#tableHead').append('<th>詳細內容</th>');	        
	    }); 
    
    </script>
    
    
</body>
</html>