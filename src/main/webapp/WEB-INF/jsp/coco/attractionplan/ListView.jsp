<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8" />
    <title>ChiTou後台管理系統-景點方案</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>
  </head>
  <body>
  
	<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>
	
    <h4 class="card-title text-primary">&nbsp;方案管理</h4>
    <p class="card-description">
		<a href="addAttraction">
			<button id="receive" type="button" class="btn btn-inverse-primary btn-fw">
				<i class="ti-plus"></i>&nbsp;新增景點
			</button>
		</a>
	</p>
    <form action="searchAttraction" method="post" enctype="multipart/form-data">
		<input type="text" name="search" class="form-control">
		<input type="submit" name="searchno" value="搜尋" class="btn btn-outline-info btn-fw">
	</form>
	<div>
		<div class="table-responsive">
	    	<table class="table table-hover">
	    		<thead>
	              <tr id="tableHead">
	              </tr>
	            </thead>
	            <tbody>
					<c:forEach var="plan" items="${listPlan}">
						<tr>
			                <td>${plan.planid}</td>
			                <td>${plan.attraction.attName}</td>
			                <td>${plan.planname}</td>
			                <td>${plan.planfee}</td>
			                <td>${plan.plandiscript}</td>
			                <td>
			                	<div style="float:left;">
			            			<form action="/admin/toUpdateHotel" method="post">
			            				<input type="hidden" id="hotelID" class="hotelID" name="hotelID" value="${plan.planid}">
			                			<button type="submit" class="btn btn-inverse-success btn-icon" style="width:30px;height:30px;" name="toUpdatePage">
		                					<i class="ti-pencil-alt"></i>
		                				</button>
		                			</form>
		                		</div>
								<div>
		                			<form action="/admin/deleteHotel" method="post">
<!-- 										<input type="hidden" name="_method" value="DELETE"/> -->
			                			<input type="hidden" id="hotelID" class="hotelID" name="hotelID" value="${plan.planid}">
			                			<button type="submit" class="btn btn-inverse-danger btn-icon" style="width:30px;height:30px;" name="delete">
			                				<i class="ti-trash"></i>
			                			</button>
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
	
	<script>
		var typeName = ["方案編號","所屬景點ID","方案名稱","價格","方案內容"];
	    $(document).ready( function () {
	        for(var i=0;i<typeName.length;i++){
	        	let tr =  '<th>'+typeName[i]+'</th>';
	        	$('#tableHead').append(tr);
	        }
			$('#tableHead').append('<th>操作</th>');	        
	    }); 
	</script>
  </body>
</html>