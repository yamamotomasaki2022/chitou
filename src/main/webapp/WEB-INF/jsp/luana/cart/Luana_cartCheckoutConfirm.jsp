<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChiTou</title>
	<%@ include file="/WEB-INF/includes/coco/attraction/AttractionsDescriptionCSS.jsp"%>


</head>
<body class="body2">
	<%@ include file="/WEB-INF/includes/coco/attraction/Header.jsp"%>
	<div class="container my-4">
		<div class="mb-4" style="height:100px">

		</div>

		<br>

		<div class="row justify-content-center">

			<div class="col-10" >
			<table class="table">
					<thead>
						<tr>
							<th>確認結帳內容</th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
					</thead>
                    <tbody>
	                  
                      	  <c:forEach var="Cart" items="${cartList}">
                        <tr>
                        
                        	<td>${Cart.attractionname}</td>
                            <td>${Cart.planname}</td>
                            <td>單價：${Cart.planfee}元</td>                     
							
                            <td>數量：${Cart.quantity}
                            <td>小計：<c:out value="${Cart.planfee * Cart.quantity}" />元</td>
                            <td></td>
                            <td></td>
                        </tr>                      
                            </c:forEach>
                    </tbody>
                </table>	
			</div>


			<div class="col-2" >
				<div class="card" style="width:18rem; background-color:#dbdbee;position:sticky;top:10" >
      				<div class="card-body" >
                  	<c:set var="total" value="${0}" />
                    <c:forEach var="Cart" items="${cartList}">
                    <c:set var="total" value="${total+Cart.planfee * Cart.quantity}" />
                    </c:forEach>	
       					<h5 class="card-title">總計: ${total} 元</h5>
                 
                 
					 <form action="buyFromCart" method="post" class="form-inline" >
		             	<input type="hidden" name="totalPrice" value="${total}"/>
		              	<input type="submit"  class="btn btn-primary"  value="結帳">
		             </form>
		                 
              		</div>
				</div>
			</div>
		</div>
	</div>


	<div class="untree_co-section">
		<div class="container">
		</div>
		
	</div>
	<%@ include file="/WEB-INF/includes/coco/attraction/Footer.jsp"%>

	<div id="overlayer"></div>
	<div class="loader">
		<div class="spinner-border" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>


	<%@ include file="/WEB-INF/includes/coco/attraction/AttractionsDescriptionJS.jsp"%>



</body>
</html>