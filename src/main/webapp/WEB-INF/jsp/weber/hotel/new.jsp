<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>測試能不能用</title>
<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>
	<!--標頭開始-->
	<h4 class="card-title text-primary">&nbsp;新增景點</h4>
	<p class="card-description">請輸入您要新增的景點</p>
	<!--form開始-->
	<form action="yeeee" class="forms-sample">
		<div class="form-group">
			<label>景點圖片:</label> <input type="file" name="img[]"
				class="file-upload-default">
			<div class="input-group col-xs-12">
				<input type="text" class="form-control file-upload-info" disabled
					placeholder="Upload Image"> <span
					class="input-group-append">
					<button class="file-upload-browse btn btn-primary" type="button">Upload</button>
				</span>
			</div>
		</div>

		<div class="form-group">
			<label path="attid">景點編號:</label> <input type="text" path="attid"
				class="form-control" id="" placeholder="請輸入新增的景點ID">
		</div>
		<div class="form-group">
			<label path="preferid" path="preferid">方案編號:</label> <select
				class="form-control">
				<option>1</option>
				<option>2</option>
			</select>
		</div>

		<div class="form-group">
			<label>景點名稱:</label> <input type="" class="form-control" id=""
				placeholder="請輸入新增的景點名稱">
		</div>
		<div class="form-group">
			<label path="preferid">方案編號:</label> <input type="" path="preferid"
				class="form-control" id="" placeholder="請輸入新增的方案編號">
		</div>

		<div class="form-group">
			<label>景點位置:</label> <input type="" class="form-control" id=""
				placeholder="請選擇新增的景點位置">
		</div>

		<div class="form-group">
			<label> 景點說明: </label>
			<div>
				<textarea id="editor1" name="yee"></textarea>
			</div>
		</div>
		<br>





		<div class="form-group">
			<label for="exampleTextarea1">Textarea</label>
			<div>
				<textarea class="form-control" id="editor2" rows="4"></textarea>
			</div>
		</div>
		<button type="submit" class="btn btn-primary mr-2">送出</button>
		<button class="btn btn-light">返回</button>
	</form>

	<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>

	<script src="/js/coco/ckeditor.js"></script>
	<script>
	var ckeditorConfig = {
	    ckfinder: {
	        uploadUrl: '/paaa'
	    },
	}
	
	ClassicEditor
	   .create(document.querySelector('#editor1'),{
		    ckfinder: {
		        uploadUrl: '/ckUploadGeorgia'
		    },
		}).then(editor => {
	    	  console.log("editor1 success");
	   });
// 	     ClassicEditor
// 	      .create(document.querySelector('#editor2'))
// 	      .then(editor => {
// 	    	  console.log("editor2 success");
// 	          console.log(editor);
// 	      });
        </script>
</body>
</html>