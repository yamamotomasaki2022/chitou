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
<title>ChiTou後台管理系統-修改方案</title>
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
									<h4 class="card-title text-primary">&nbsp;新增方案</h4>
									<p class="card-description">請輸入您要新增的方案</p>
									<!--form開始-->
									<form class="forms-sample" action="updatePlanAction" method="post">
										<input type="hidden" name="attractionid" value="${plan.attraction.attid}"/>
										<div class="form-group">
											<label>方案編號:</label> 
											<input type="text"
												name="planid" class="form-control"
												placeholder="請輸入新增的方案ID" value="${plan.planid}"/>
										</div>

										<div class="form-group">
											<label>方案名稱:</label>
											 <input type="text" class="form-control"
												id="" name="planname" value="${plan.planname}" placeholder="請輸入新增的方案名稱"/>
										</div>

										<div class="form-group">
											<label>價格:</label> 
											<input type="text" name="planfee" class="form-control"
												id="" placeholder="價格" value="${plan.planfee}" />
										</div>

										<div class="form-group">
											<label> 方案內容: </label>
											<div >
												<textarea id="editor1" name="plandiscript" placeholder="請輸入方案的內容">${plan.plandiscript}</textarea>
											</div>
										</div>
										
										<br>

										<button type="submit" name="submit" class="btn btn-primary mr-2">修改</button>
										<a href="showAttractionPlans"><button class="btn btn-light">返回</button></a> 
									</form>
							<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>
					




	<!-- ckeditor:js & function-->
	<script src="/js/coco/ckeditor.js"></script>
	<script>
	 	ClassicEditor
		   .create(document.querySelector('#editor1'),{
			    ckfinder: {
			        uploadUrl: '/ckUploadCoco'
			    },
			}).then(editor => {
		    	  console.log("editor1 success");
		   });
        </script>

</body>

</html>