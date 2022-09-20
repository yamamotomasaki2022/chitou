<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
	<head>
	<title>後台新增景點頁面</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                               新增景點
                            </h2>
                        </caption>

           
						<form:form action="addAttractionAction" method="post" modelAttribute="attraction">
                         <fieldset >
                            <form:label path="attid">景點ID:</form:label>
                            <form:input type="text" path="attid" placeholder="請輸入新增的景點ID" class="form-control"/>
                        </fieldset>
                        
                          <fieldset >
                            <form:label path="preferid">方案編號:</form:label>
                            <form:input type="text" path="preferid" placeholder="請輸入新增的方案編號" class="form-control" />
                        </fieldset>
                      
                         <fieldset >
                            <form:label path="attName">景點名稱:</form:label>
                            <form:input type="text" path="attName" placeholder="請輸入新增的方案編號" class="form-control" />
                        </fieldset>
                        
                        <fieldset >
                            <form:label path="attLocation" >景點位置:</form:label>
                            <form:input type="text" path="attLocation"  placeholder="請輸入新增的景點位置" class="form-control"/>
                        </fieldset>
                        
                        <fieldset >
                            <form:label path="attDescription">景點說明:</form:label>
                            <form:input type="text" path="attDescription" placeholder="請輸入新增的景點說明" class="form-control" />
                        </fieldset>
                        

                           <fieldset >
                            <form:label path="attNotice">購票須知:</form:label>
                            <form:input type="text" path="attNotice" placeholder="請輸入新增的購票須知" class="form-control" />
                        </fieldset>

                 
	            <br>
                        <input type="submit" name="submit" class="btn btn-success" value="新增">
                        <input type="submit" name="backToQuery" class="btn btn-success" value="返回">
                        </form:form>
                    </div>

</body>
</html>