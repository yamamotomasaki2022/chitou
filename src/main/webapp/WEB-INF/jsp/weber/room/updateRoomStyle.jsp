<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<title>更改飯店資料</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
	.box {
		width: 100px;
		height: 100px;
		border: 1px solid black;
		overflow: hidden;
		margin: 10px;
	}
</style>
</head>
<body>
<%@ include file="/WEB-INF/includes/Header.jsp"  %>
	<div align="center">
	    <form:form action="updateStyle" method="post" modelAttribute="style" enctype="multipart/form-data">
	    	<input type="hidden" name="_method" value="PUT">
	    	<form:input type="hidden" path="styleID" name="styleID"/>
	        房型名稱:
	        <form:input type="text" path="name" name="name" id="name"/><br>
	        容納人數:
	        <form:input type="text" path="capacity" name="capacity" id="capacity"/><br>
	        價格:
	        <form:input type="text" path="price" name="price" id="price"/><br>
	        床位:
	        <form:input type="text" path="bed" name="bed" id="bed"/><br>
	        狀態:
	        <form:input type="text" path="status" name="status" id="status"/><br>
	        房間數量:
	        <form:input type="text" path="roomAmount" name="roomAmount"/><br>
	        照片:
	    	<input id="upload" type="file" name="upload" accept="image/*" multiple="multiple"><br>
	        <input type="submit" name="update" value="更新">
	    </form:form>
	    原有照片:
	    <div id="oldpics">沒有照片</div>
	    更新照片:
	    <div id="newpics"></div>
    </div>
    <script>
    	var count = ${photoCount};
    	$(function(){
   			$('#oldpics').empty();
    		for(var i=1 ; i <= count ; i++){
				$('#oldpics').append('<img id="img" src="images/weber/roomStyle/styleNB${style.styleID}/photo'+i+'.jpg" class="box">');
    		}
    	});
    	
    	$('#upload').on('change',function(e){
	    	$('#newpics').empty();
    		var photos = this.files;
	    	for(let i=0;i<photos.length;i++){
	    		var file = photos[i];
	    		var fr = new FileReader();
	    		fr.onload = function(e){
	    			$('#newpics').append('<img id="img" src="'+e.target.result+'" class="box">');
	    		};
	    		fr.readAsDataURL(file);
	    	};
	    });
    </script>
</body>
</html>