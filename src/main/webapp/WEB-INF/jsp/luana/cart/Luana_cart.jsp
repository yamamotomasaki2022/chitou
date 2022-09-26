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
    
    
    <%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>
    
    <body>
    
<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>
       
            <div class="container">
                <div class="d-flex py-3">
                    <h3>Total:</h3><a class="mx-3 btn btn-primary" href="BuyfromCart?id=1">check</a>

                </div>
                <table class="table table-loght">
                    <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Plan</th>
                            <th scope="col">Price</th>
                            <th scope="col">Amount</th>
                            <th scope="col"></th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                      	  <c:forEach var="Cart" items="${cartList}">
                        <tr>
                            <td>${Cart.attractionname}</td>
                            <td>${Cart.planname}</td>
                            <td>${Cart.planfee}</td>                     
							
                            <td>
                                <form action="buyIt" method="post" class="form-inline">
                                    <input type="hidden" name="attractionId" value="${Cart.attractionid}" class="form-input"/>
                                    <input type="hidden" name="planId" value="${Cart.planid}" class="form-input"/>
                                   <input type="hidden" name="attractionName" value="${Cart.attractionname}" class="form-input">
                                    <input type="hidden" name="planName" value="${Cart.planname}" class="form-input">
                                     <input type="hidden" name="itemId" value="${Cart.itemid}" class="form-input"/>
                                    <input type="hidden" name="planFee" value="${Cart.planfee}" class="form-input">                                    
                                    <div class="form-group d-flex justify-content-between">
                                        <a class="btn bnt-sm btn-incre" href="AttractionServlet?action=inc&id=${Cart.quantity}"><i
                                                class="fas fa-plus-square"></i></a> <input type="text" name="quantity"
                                            class="form-control" value="${Cart.quantity}" readonly>
                                        <a class="btn btn-sm btn-decre" href="AttractionServlet?action=dec&id=${Cart.quantity}"><i
                                                class="fas fa-minus-square"></i></a>
                                    </div>
                                    <input type="submit" name="buyIt" class="btn btn-primary btn-sm" value="BuyIt">
                  	      </form>
                            </td>
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
<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>
    </body>

    </html>