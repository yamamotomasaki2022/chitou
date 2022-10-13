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
  
    </head>
    <body>
    
    	<%@ include file="/WEB-INF/includes/Header.jsp"  %>
        <%@ include file="../Luana_include/navbar.jsp" %>
       
            <div class="container">                
                	
                	
                	<div class="row justify-content-center align-items-center">
  						<div class="col-1"><h1>購物車是空的</h1></div>
  						
					</div>
            
            
            
            
           </div>
            <%@ include file="../Luana_include/footer.jsp" %>
    </body>

    </html>