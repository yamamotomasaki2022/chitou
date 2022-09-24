<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
									<form class="forms-sample">
										<div class="form-group">
											<label>景點圖片:</label> <input type="file" name="img[]"
												class="file-upload-default">
											<div class="input-group col-xs-12">
												<input type="text" class="form-control file-upload-info"
													disabled placeholder="Upload Image"> <span
													class="input-group-append">
													<button class="file-upload-browse btn btn-primary"
														type="button">Upload</button>
												</span>
											</div>
										</div>

										<div class="form-group">
											<label path="attid">景點編號:</label> <input type="text"
												path="attid" class="form-control" id=""
												placeholder="請輸入新增的景點ID">
										</div>
										<div class="form-group">
											<label path="preferid" path="preferid">方案編號:</label> <select
												class="form-control">
												<option>1</option>
												<option>2</option>
											</select>
										</div>

										<div class="form-group">
											<label>景點名稱:</label> <input type="" class="form-control"
												id="" placeholder="請輸入新增的景點名稱">
										</div>
										<div class="form-group">
											<label path="preferid">方案編號:</label> <input type=""
												path="preferid" class="form-control" id=""
												placeholder="請輸入新增的方案編號">
										</div>

										<div class="form-group">
											<label>景點位置:</label> <input type="" class="form-control"
												id="" placeholder="請選擇新增的景點位置">
										</div>

										<div class="form-group">
											<label> 景點說明: </label>
											<div >
												<textarea id="editor1" placeholder="請輸入新增的景點說明"></textarea>
											</div>
										</div>
										
											<div class="form-group">
											<label> 購票須知: </label>
											<div >
												<textarea id="editor2" placeholder="請輸入新增的購票須知"></textarea>
											</div>
										</div>
										
<!-- 										<div class="form-group"> -->
<!--                                                 <label for="exampleTextarea1">購票須知:</label> -->
<!--                                                 <textarea class="form-control" id="exampleTextarea1" -->
<!--                                                     rows="4"></textarea> -->
<!--                                             </div> -->
										<br>

										<button type="submit" class="btn btn-primary mr-2">新增</button>
										<button class="btn btn-light">返回</button>
									</form>
							<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>
					




	<!-- ckeditor:js & function-->
	<script src="/js/coco/ckeditor.js"></script>
	<script>

	ClassicEditor
	   .create(document.querySelector('#editor1'))
	      .then(editor => {
	          console.log(editor);
	      });
	     ClassicEditor
	      .create(document.querySelector('#editor2'))
	      .then(editor => {
	          console.log(editor);
	      });

        </script>

</body>

</html>