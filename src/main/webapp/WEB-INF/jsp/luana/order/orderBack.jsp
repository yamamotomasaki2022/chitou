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
		
	<!-- sweetalert2 -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	
    <title>BackOrderList</title>

</head>

<body>

	<%@ include file="/WEB-INF/includes/SuperTop.jsp"  %>
	
	
	    <div style="display:inline-block;float:left;">
	    <form action="searchOrder" method="get">
	    	<select id="type" name="type" class="form-select form-select-sm" aria-label=".form-select-sm example">
	    	</select>
	    	<input type="text" name="keyword">
	    	<input type="submit" class="btn btn-primary mr-2" value="搜尋">
	    </form>
	</div>
		<form action="showOrderlistInType" method="post">
			<div style="display:inline-block;float:right;">
				<input type="hidden" name="type" value="all">
				<input type="submit" class="btn btn-primary mr-2" name="add" value="總覽">
			</div>
		</form>
		<form action="showOrderlistInType" method="post">
			<div style="display:inline-block;float:right;">
				<input type="hidden" name="type" value="飯店">
				<input type="submit" class="btn btn-primary mr-2" name="add" value="飯店">
			</div>
		
		</form>
		<form action="showOrderlistInType" method="post">
			<div style="display:inline-block;float:right;">
				<input type="hidden" name="type" value="機票">
				<input type="submit" class="btn btn-primary mr-2" name="add" value="機票">
			</div>
		
		</form>
		<form action="showOrderlistInType" method="post">
			<div style="display:inline-block;float:right;">
				<input type="hidden" name="type" value="景點">
				<input type="submit" class="btn btn-primary mr-2" name="add" value="景點">
			</div>
		</form>
		
		<form action="downloadCSV" method="get">
			<div style="display:inline-block;float:right;">
				<input type="submit" class="btn btn-primary mr-2" value="匯出CSV檔">
			</div>
		</form>
		<form action="orderStatic" method="get">
			<div style="display:inline-block;float:right;">
				<input type="submit" class="btn btn-primary mr-2" value="chart">
			</div>
		</form>
		
	
	
	<div class="table-responsive">
    <table id="table_id"  class="table table-hover">
        <thead>
            <tr id="tableHead">
      
               
            </tr>
        </thead>
        <tbody>
           <c:forEach var="order" items="${orderBack}">
				
					<tr class="updateOrderstatus" id="orderList">
						<td class="ordertype">${order.ordertype}</td>
						<td class="orderdate">${order.orderdate}</td>
						<td class="orderid">${order.orderid}</td>
						<td class="ordertype">${order.totalprice}</td>
						<td class="orderstatus">${order.orderstatus}</td>
						<td class="memberid">${order.memberid}</td>
						<td class="mannual">
							
								<select class="form-select form-select-sm status" aria-label=".form-select-sm example">
									<option selected>更新訂單</option>
									<option value="已付款">已付款</option>
									<option value="已取消">已取消</option>
									<option value="已完成">已完成</option>
								</select>
							
						</td>
						
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
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉</button>
     <!--   <button type="button" class="btn btn-primary">Save changes</button> --> 
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
    	  	data: {"orderid": data,}, //上傳的數據
    	  	//contentType:"application/json",
    	  	dataType: "JSON", //設置接受到的數據的格式
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
    	  	},//表示出現錯誤
    	 });
    }
    
    function btnHotel(data) {
    
    	 $.ajax({
    	  	url: "hotelOrderDetail",
    	  	type: "POST",
    	  	data: {"orderid": data},
    	  	//contentType:"application/json",
    	  	dataType: "JSON", 
    	  	success: function (detail) {
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
    	  	},
    	 });
    }
    
    function btnFlight(data) {
    
    	 $.ajax({
    	  	url: "flightOrderDetail",
    	  	type: "POST",
    	  	data: {"orderid": data},
    	  	//contentType:"application/json",
    	  	dataType: "JSON", 
    	  	success: function (detail) {
    	  	console.log(detail);

    	  	$("#title").html("訂單編號："+ data );
			
    	  	let orderList="";
			
    			for(i = 0 ; i < detail.length ; i++){
				
					orderList += 
						"航空公司："+detail[i].airline +" "+
						detail[i].flightid +"</br>"+
						"於：　"+detail[i].departuretime+"　從 "+detail[i].originid +"　出發</br>"+
						"於：　"+detail[i].arrivaltime+"　至 "+detail[i].destinationid +"　抵達<br><hr>"+
						"乘客資訊：<br>"+
						"姓："+detail[i].lastname+"　名："+detail[i].firstname+"<br>"+
						"聯絡信箱："+detail[i].emailaddress+"　聯絡電話："+detail[i].phone;
						
				};
		
			$("#orderDetail").html(orderList);					
    		//console.log(orderdetail.attractionname);
    	  	},
    	  	error: function () {
    			console.log("Oh no...");
    	  	},
    	 });
    }
    </script>
    
    <script type="text/javascript">
    	var type = ["ordertype","orderdate","orderid","totalprice","orderstatus","memberid"];
		var typeName = ["訂單種類","下訂日","訂單編號","總價","訂單狀態","會員編號"];
	    $(document).ready( function () {
	        for(var i=0;i<type.length;i++){
	        	let option = '"<option value="'+type[i]+'">'+typeName[i]+'</option>"';
	        	$('#type').append(option);
	        }
	        for(var i=0;i<typeName.length;i++){
	        	let tr =  '<th>'+typeName[i]+'</th>';
	        	$('#tableHead').append(tr);
	        }
			$('#tableHead').append('<th>更新狀態</th><th>詳細</th>');	        
	    }); 
    
    </script>
    
    <script type="text/javascript">
    
    $('.updateOrderstatus').on('change', function () {
    
    	Swal.fire({
    		  title: '確定更改訂單狀態？',
    		  showDenyButton: true,
    		  showCancelButton: false,
    		  confirmButtonText: '是',
    		  denyButtonText: `否`,
    		}).then((result) => {
    		
    		  if (result.isConfirmed) {
    			  
    			var selected = $(this).find(":selected").val();
    			console.log("selected:" +selected);
    			
    			var orderId = $(this).find(".orderid").text();
    			console.log("orderId:" +orderId);
    			
		       // Swal.fire('訂單已更新', '', 'success')
    			$.ajax({
		      		
		        	  	url: "updateOrderStatus",	//上傳URL
		        	  	type: "POST", //請求方式
		        	  	data: {"orderStatus": selected, "orderid":orderId}, //上傳數據
		        	  	//contentType:"application/json",
		        	  	dataType: "JSON", //接受的格式
		        	  	success: function (result) {	//請求成功
		        	  		
		        	  			location.reload(true);
		        	  		
		        	  		//$(this).find("#orderstatus").text(selected);	
		        	  		
		        	  		/*
		            	  	console.log(orderList);
		        			
		            	  	let orderList="";
		        			
		            			for(i = 0 ; i < orderList.length ; i++){
		        				
		        					orderList += 
		        						"名稱："+orderList[i].hotelName +" "+
		        						orderList[i].roomName +"</br>"+
		        						"人數："+orderList[i].numberOfPeople +"</br>"+
		        						"入住日："+orderList[i].checkInDate +"</br>"+
		        						"退房日："+orderList[i].checkOutDate +"<br><hr>";
		        				};
		        		
		        			$("#orderDetail").text(orderList);	
		        	  		*/
		        	  	},
		        	  	error: function () {
		        			console.log("Oh no...");
		        	  	},
		        	 });
    		  } else if (result.isDenied) {
    		    Swal.fire('取消更新', '', 'info')
    		  }
    		})	
    });
    
   
    </script>
    
    
</body>
</html>