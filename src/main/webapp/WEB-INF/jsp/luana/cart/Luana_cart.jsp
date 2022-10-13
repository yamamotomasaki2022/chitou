<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import= "tw.luana.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  
    <!DOCTYPE html>
    <html>

    <head>
        <title>購物車</title>
<link href="https://img.onl/DOO7l" rel="icon" type="image/png" />

        <%@ include file="../Luana_include/head.jsp" %>
            <style type="text/css">
                .table tbody td {
                    vartical-align: middle;
                }

                .btn-incre,
                .btn-decre {

                    box-shadow: none;
                    font-size: 25px;
                }
            </style> 
    </head>
    <body>
    
    	<%@ include file="/WEB-INF/includes/Header.jsp"  %>
        <%@ include file="../Luana_include/navbar.jsp" %>
       
            <div class="container">                
                <div class="col-9" style="display:inline-block;float:left;">
                <table class="table table-loght">
					<thead>
						<tr>
							<th>購物車一覽</th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
					</thead>
                    <tbody>
	                  <!--  
	                  	<tr>
	                    	<td><input type="checkbox" name="itemId" value="checkAll"></td>
	                    	<td>checkAll</td>
	                    </tr> 
	                   -->   
                      	  <c:forEach var="Cart" items="${cartList}">
                        <tr>
                        <!--  
                        	<td><input type="checkbox" name="itemId" value="${Cart.itemid}"></td>
                        -->    
                        	<td>${Cart.attractionname}</td>
                            <td>${Cart.planname}</td>
                            <td>${Cart.planfee}</td>                     
							
                            <td>
                                <form action="buyIt" method="post" class="form-inline">
                              <!--      <input type="hidden" name="attractionId" value="${Cart.attractionid}" class="form-input"/>
                                    <input type="hidden" name="planId" value="${Cart.planid}" class="form-input"/>
                                   <input type="hidden" name="attractionName" value="${Cart.attractionname}" class="form-input">
                                    <input type="hidden" name="planName" value="${Cart.planname}" class="form-input">
                                     <input type="hidden" name="itemId" value="${Cart.itemid}" class="form-input"/>
                                    <input type="hidden" name="planFee" value="${Cart.planfee}" class="form-input">  
                               -->                                  
                                    <div class="form-group d-flex justify-content-between">
                                       <a class="btn bnt-sm btn-incre" href="changeQuant?count=inc&itemId=${Cart.itemid}&quantity=${Cart.quantity}">
                                        	<i class="fas fa-plus-square"></i>
                                        </a>
                                                 
                                    
                                            <input type="text" name="quantity" class="form-control" style="width:45px" value="${Cart.quantity}" readonly>
                                        <a class="btn btn-sm btn-decre" href="changeQuant?count=dec&itemId=${Cart.itemid}&quantity=${Cart.quantity}">
                                       	 <i class="fas fa-minus-square"></i>
                                        </a>
                                    </div>
                                   <!--  <input type="submit" name="buyIt" class="btn btn-primary btn-sm" value="BuyIt"> -->
                  	      </form>
                            </td>
                            <td>小計：<c:out value="${Cart.planfee * Cart.quantity}" /></td>
                            <td>
                                <form action="removeFromCart" method="post" class="form-inline" >
                                    <input type="hidden" name="itemId" value="${Cart.itemid}" class="form-input"/>
                                    <input type="submit"  class="btn btn-sm btn-danger" name="removeFromCart" value="Remove">
                  	      </form>
                            </td>
                        </tr>                      
                            </c:forEach>
                    </tbody>
                </table>
            </div>
            
            
            <div class="col-3" style="display:inline-block;float:right;">
                 
                 
            	<div class="card">
      				<div class="card-body">
                  	<c:set var="total" value="${0}" />
                    <c:forEach var="Cart" items="${cartList}">
                    <c:set var="total" value="${total+Cart.planfee * Cart.quantity}" />
                    </c:forEach>	
       					<h5 class="card-title">Total: ${total}</h5>
                 
                 
					 <form action="confirmBeforeCheckout" method="post" class="form-inline" >
		             	<input type="hidden" name="totalPrice" value="${total}"/>
		              	<input type="submit"  class="btn btn-primary"  value="結帳">
		             </form>
		                 
              		</div>
				</div>
           </div>
            
            
           </div>
            <%@ include file="../Luana_include/footer.jsp" %>
    </body>

    </html>