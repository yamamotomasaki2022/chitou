<%@page import="tw.coco.*"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
//System.out.println(userBean.getDescription());
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>後台修改景點頁面</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://img.onl/DOO7l" rel="icon" type="image/png" />	
	
</head>
<body>
<header>
			<nav class="navbar navbar-expand-md navbar-dark" style="background-color: lightblue">
  					 <div>
  				  	<img src ="images/chitou.png" />
                        <a href="http://localhost:8080/HibernateChiTou/Kang-list.jsp" class="navbar-brand"> ChiTou </a>
                    </div>

                    <ul class="navbar-nav">
                        <li><a href="http://localhost:8080/HibernateChiTou/Kang-list.jsp" class="nav-link">景點項目</a></li>
                    </ul>
              </nav>
	</header>

<br>
 			<div class="container col-md-5">
  

                        <caption>
                            <h2>
                               修改景點
                            </h2>
                        </caption>

           
						<form:form action="updateAttraction" method="post" modelAttribute="selectByAttid">
                 
                        <form:input type="hidden" path="attid" value="${selectByAttid.attid}" class="form-control" />
                        <fieldset >
                            <form:label path="preferid">方案編號:</form:label> 
                            <form:input type="text" path="preferid" value="${selectByAttid.hobbyclassification.preferid}" class="form-control" />
                        </fieldset>
                         <fieldset >
                            <form:label path="attName">景點名稱:</form:label> 
                            <form:input type="text" path="attName" placeholder="請輸入修正的景點名稱" value="${selectByAttid.attName}" class="form-control" />
                            	
                        </fieldset>
                        
                        <fieldset >
                            <form:label path="attLocation">景點位置:</form:label> 
                            <form:input type="text" path="attLocation"  placeholder="請輸入修正的景點位置" value="${selectByAttid.attLocation}" class="form-control" />
                        </fieldset>
                        
                        <fieldset >
                            <form:label path="attDescription">景點說明:</form:label> 
                            <form:textarea id="t1" rows="6" cols="50" path="attDescription" class="form-control" placeholder="請輸入修正的景點說明"></form:textarea>
                            
                        </fieldset>
                        
							<script>
    							document.getElementById("t1").value=${selectByAttid.attDescription}
   							</script>
							
                        
                           <fieldset >
                            <form:label path="attNotice">購票須知:</form:label> 
                             <form:textarea id="t2" rows="6" cols="50" path="attNotice" class="form-control" placeholder="請輸入修正的購票須知"></form:textarea>
                        </fieldset>
                        
                        <script>
    							document.getElementById("t2").value=${selectByAttid.attDescription}
   							</script>

                 
	            <br>
                        <input type="submit" name="modify" class="btn btn-success" value="修正">
                        </form:form>
                    </div>
</body>
</html>