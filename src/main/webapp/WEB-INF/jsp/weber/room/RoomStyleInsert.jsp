<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<title>加入飯店資料</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<style type="text/css">
	.box {
		width: 100px;
		height: 100px;
		border: 1px solid black;
		overflow: hidden;
		margin: 10px;
	}
</style>
<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>
</head>
<body>
<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>

		<div>
	    	<form:form action="insertStyle" method="post" modelAttribute="style" enctype="multipart/form-data" class="forms-sample">
		    	<div class="form-group">
			        <label>請輸入房型名稱:</label>
			        <form:input type="text" path="name" class="form-control"  name="name" id="name"/><br>
			        <label>容納人數:</label>
			        <form:input type="text" path="capacity" class="form-control"  name="capacity" id="capacity"/><br>
			        <label>床位:</label>
			        <form:input type="text" path="bed" class="form-control"  name="bed" id="bed"/><br>
			        <label>狀態:</label>
			        <form:input type="text" path="status" class="form-control"  name="status" id="status"/><br>
			        <label style="width:52%">價格:</label>
			        <label>房間數量:</label><br>
			        <form:input type="number" path="price" class="form-control" style="width:48%;display:inline-block;" name="price" id="price"/>
			        <input type="number" id="roomAmount" class="form-control" style="width:48%;display:inline-block;float:right;" name="roomAmount"><br>
			    	<label>照片:</label>
			    			<div class="input-group col-xs-12" >
								<span class="input-group-append">
				    				<input id="upload" type="file" class="file-upload-browse btn btn-primary" name="upload" accept="image/*" multiple="multiple">
								</span>
							</div>
		    	</div>
			    	<input type="submit" class="btn btn-primary mr-2" name="insert" value="加入一筆資料">
			    	<button type="button" class="btn btn-primary mr-2" id="fastInput">一鍵輸入</button>
	    	</form:form>
	    	<div id="picPreview"></div>
	    </div>
	<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>

    <script>
	    $('#upload').on('change',function(e){
	    	$('#picPreview').empty();
    		var photos = this.files;
	    	for(let i=0;i<photos.length;i++){
	    		var file = photos[i];
	    		var fr = new FileReader();
	    		fr.onload = function(e){
	    			$('#picPreview').append('<img id="img" src="'+e.target.result+'" class="box">');
	    		};
	    		fr.readAsDataURL(file);
	    	};
	    });
	    $('#fastInput').click(function(){
	    	$('#name').val('菁英客房二小床');
	    	$('#capacity').val('最多可入住 4 人 (含所有額外成人與孩童)');
	    	$('#bed').val('2 張單人床');
	    	$('#status').val('開放');
	    	$('#price').val('4481');
	    	$('#roomAmount').val('5');
	    });
	    
    </script>
</body>
</html>