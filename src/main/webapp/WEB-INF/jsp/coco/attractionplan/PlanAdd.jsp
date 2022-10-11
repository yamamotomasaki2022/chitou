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
									<h4 class="card-title text-primary">&nbsp;新增方案</h4>
									<p class="card-description">請輸入您要新增的方案</p>
									<!--form開始-->
									<form:form class="forms-sample" action="addPricingPlanAction" method="post" modelAttribute="pricingplan">
										<form:input type="hidden" path="attractionid"></form:input>
										<div class="form-group">
											<form:label path="planid">方案編號:</form:label> 
											<form:input type="text"
												path="planid" class="form-control"
												placeholder="請輸入新增的方案ID" />
										</div>

										<div class="form-group">
											<form:label path="planname">景點名稱:</form:label>
											 <form:input type="text" class="form-control"
												id="" path="planname" placeholder="請輸入新增的景點名稱"/>
										</div>

										<div class="form-group">
											<form:label path="planfee">景點位置:</form:label> 
											<form:input type="text" path="planfee" class="form-control"
												id="" placeholder="請選擇新增的景點位置" />
										</div>

										<div class="form-group">
											<form:label path="plandiscript"> 景點說明: </form:label>
											<div >
												<form:textarea id="editor1" path="plandiscript" placeholder="請輸入新增的景點說明"></form:textarea>
											</div>
										</div>
										
										<br>

										<button type="submit" name="submit" class="btn btn-primary mr-2">新增</button>
										<a href="listAttractions"><button class="btn btn-light">返回</button></a>                        </form:form>
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