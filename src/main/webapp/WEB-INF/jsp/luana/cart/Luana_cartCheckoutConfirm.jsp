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
                <div>
                <table class="table table-loght">
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
                            <td>${Cart.planfee}</td>                     
							
                            <td>${Cart.quantity}"
                            <td>小計：<c:out value="${Cart.planfee * Cart.quantity}" /></td>
                            <td></td>
                            <td></td>
                        </tr>                      
                            </c:forEach>
                    </tbody>
                </table>
            </div>
            
            
            <div>
                 
                 
            	<div class="card">
      				<div class="card-body">
                  	<c:set var="total" value="${0}" />
                    <c:forEach var="Cart" items="${cartList}">
                    <c:set var="total" value="${total+Cart.planfee * Cart.quantity}" />
                    </c:forEach>	
       					<h5 class="card-title">Total: ${total}</h5>
                 
                 
					 <form action="buyFromCart" method="post" class="form-inline" >
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