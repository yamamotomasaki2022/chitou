<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<% 
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ChiTou後台管理系統-新增景點</title>
<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>
	

<!--設定長編輯器寬度-->
<style>

.ck-editor__editable {
	min-height: 100px;
	/* width: 100%;
            margin: 0 auto; */
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>

									<!--標頭開始-->
									<h4 class="card-title text-primary">&nbsp;新增景點</h4>
									<p class="card-description">請輸入您要新增的景點</p>
									<!--form開始-->
									<form:form class="forms-sample" action="addAttractionAction" method="post" modelAttribute="attraction" enctype="multipart/form-data">
										<div class="form-group">
											<label >景點圖片:</label> 

											<div class="input-group col-xs-12">
												<input name="photoo" type="file"  class="form-control file-upload-info"
													 placeholder="Upload Image">
													 <span class="input-group-append">
<!-- 													<button class="file-upload-browse btn btn-primary" -->
<!-- 														type="button">Upload</button> -->
												</span>
												
											</div>
										</div>

										<div class="form-group">
											<form:label path="attid">景點編號:</form:label> 
											<form:input type="text" id="attid"
												path="attid" name="attid" class="form-control"
												placeholder="請輸入新增的景點ID" />
										</div>
										<div class="form-group">
											<form:label path="preferid">方案編號:</form:label>
											 <select name="preferid" name="preferid" id="preferid"
												class="form-control">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
											</select>
										</div>

										<div class="form-group">
											<form:label path="attName">景點名稱:</form:label>
											 <form:input type="text" class="form-control" 
												name="attName" id="attName"  path="attName" placeholder="請輸入新增的景點名稱"/>
										</div>

										<div class="form-group">
											<form:label path="attLocation">景點位置:</form:label> 
											<form:input type="text" path="attLocation" id="attLocation" class="form-control" name="attLocation" 
												 placeholder="請選擇新增的景點位置" />
										</div>

										<div class="form-group">
											<form:label path="attDescription"> 景點說明: </form:label>
											<div >
												<form:textarea id="attDescription" path="attDescription" name="attDescription" placeholder="請輸入新增的景點說明"></form:textarea>
											</div>
										</div>
										
<!-- 											<div class="form-group"> -->
<!-- 											<label> 購票須知: </label> -->
<!-- 											<div > -->
<!-- 												<textarea id="editor2" placeholder="請輸入新增的購票須知"></textarea> -->
<!-- 											</div> -->
<!-- 										</div> -->
									
										<br>

										<button type="submit" name="submit" class="btn btn-primary mr-2">新增</button>
										<a href="listAttractions"><button class="btn btn-light">返回</button></a>    
										<button type="button" class="btn btn-primary mr-2" id="fastinput" style="float:right;">一鍵輸入</button>
										
										                    </form:form>
							<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>
					


	<script src="/js/coco/bootstrap/jquery-3.4.1.min.js"></script>
	<script>
	
// 	$('#fastinput').on('click',function{
// 		console.log('yee')
// 	})
	
	$('#fastinput').click(function(){
		
		$('#attid').val('1110')
		$('#attName').val('麗寶樂園渡假區')
		$('#attLocation').val('台中市后里區福容路8號')
		$('#attDescription').val('遊客眾多的主題樂園，主打雲霄飛車、多種遊樂設施、人工波浪池和飄飄河。')
		
	})
	
	</script>
	
	<!-- ckeditor:js & function-->
	<script src="https://cdn.ckeditor.com/ckeditor5/35.2.0/super-build/ckeditor.js"></script>
	<script src="/js/coco/ckeditorCoco.js"></script>
	<script>
// 	 	ClassicEditor
// 		   .create(document.querySelector('#editor1'),{
// 			    ckfinder: {
// 			        uploadUrl: '/ckUploadCoco'
// 			    },
// 			}).then(editor => {
// 		    	  console.log("editor1 success");
// 		   });
        </script>

</body>

</html>
