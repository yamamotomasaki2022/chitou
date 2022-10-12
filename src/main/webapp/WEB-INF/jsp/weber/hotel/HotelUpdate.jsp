<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" ; charset="UTF-8">
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
<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>
	<h4 class="card-title text-primary">&nbsp;飯店修改</h4>
	<div>
		<form:form action="/admin/updateHotel" method="post" modelAttribute="result" enctype="multipart/form-data" class="forms-sample">
		    <form:input type="hidden" path="hotelID" class="form-control"/><br>
<!-- 			<input type="hidden" name="_method" value="PUT"> -->
	        <div class="form-group">
		        <label>飯店名稱:</label>
		        <form:input type="text" path="name" class="form-control" name="name" id="name" placeholder="輸入景點名稱"/><br>
		        <label>地址:</label>
		        <form:input type="text" path="address" class="form-control" name="address" id="address" placeholder="輸入地址"/><br>
		        <label>類型:</label>
		        <form:input type="text" path="type" class="form-control" name="type" id="type" placeholder="飯店類型"/><br>
		        <label>介紹:</label>
		        <form:input type="text" path="intro" class="form-control" name="intro" id="intro" placeholder="介紹一下飯店..."/><br>
		        <label>國家:</label>
		        <form:input type="text" path="country" class="form-control" name="country" id="country" placeholder="飯店所屬國家"/><br>
		        <label>電話:</label>
		        <form:input type="text" path="phone" class="form-control" name="phone" id="phone" placeholder="輸入電話"/><br>
		        <label>狀態:</label>
		        <form:input type="text" path="status" class="form-control" name="status" id="status" placeholder="ex.開放中、整修中"/><br>
		        <label>可容納人數:</label>
		        <form:input type="text" path="capacity" class="form-control" name="capacity" id="capacity"/><br>
		        <label>業主名稱:</label>
		        <form:input type="text" path="owner" class="form-control" name="owner" id="owner" placeholder="輸入景點名稱"/><br>
		        <label>平均房價:</label>
		        <form:input type="text" path="averagePrice" class="form-control" name="averagePrice" id="averagePrice"/><br>
		    	<label>照片:</label>
		    		<div class="input-group col-xs-12" >
	<!-- 				<input type="text" class="form-control file-upload-info" disabled placeholder="Upload Image">  -->
						<span class="input-group-append">
		    				<input id="upload" type="file" class="file-upload-browse btn btn-primary" name="upload" accept="image/*" multiple="multiple">
						</span>
					</div>
	    	</div>
	    	<input type="submit" name="insert" class="btn btn-primary mr-2" value="修改">
	    </form:form>

		原有照片:
		<div id="oldpics">沒有照片</div>
		更新照片:
		<div id="newpics"></div>
	</div>

	<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>

	<script>
		$(function() {
			$.ajax({
				url : "/admin/loadHotelPhotoAjax/${hotelID}",
				data : "hotelNB${hotelID}",
				success : function(data) {
						$('#oldpics').empty();
					for (var i = 1; i <= data; i++) {
						$('#oldpics').append('<img id="img" src="/images/weber/hotel/hotelNB${hotelID}/photo'+i+'.jpg" class="box">');
					}
				}
			});
		});
		$('#upload').on('change',function(e) {
			$('#newpics').empty();
			var photos = this.files;
			for (let i = 0; i < photos.length; i++) {
				var file = photos[i];
				var fr = new FileReader();
				fr.onload = function(e) {
					$('#newpics').append('<img id="img" src="'+e.target.result+'" class="box">');
				};
				fr.readAsDataURL(file);
			};
		});
	</script>
</body>
</html>