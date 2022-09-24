<%@page import="tw.cocokang.attraction.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
//System.out.println(userBean.getDescription());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChiTou後台管理系統-修改景點</title>
<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>

</head>
<body>
		<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>
									<!--標頭開始-->
									<h4 class="card-title text-primary">&nbsp;修改景點</h4>
									<p class="card-description">請輸入您要修改的景點</p>
									<!--form開始-->
									<form:form class="forms-sample" action="updateAttraction" method="post" modelAttribute="selectByAttid">
									<form:input type="hidden" path="attid" value="${selectByAttid.attid}" class="form-control" />
										
										<div class="form-group">
											<form:label path="">景點圖片:</form:label> 
											<input type="file" name="img[]"
												class="file-upload-default"/>
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
											<form:label  path="preferid">方案編號:</form:label> 
											<form:input type="text" path="preferid" value="${selectByAttid.hobbyclassification.preferid}" placeholder="請輸入修正的方案編號" class="form-control" />
										</div>

										<div class="form-group">
											<form:label  path="attName">景點名稱:</form:label>
											 <form:input type="text" path="attName" class="form-control"
												value="${selectByAttid.attName}" placeholder="請輸入修正的景點名稱" />
										</div>
										

										<div class="form-group">
											<form:label path="attLocation">景點位置:</form:label> 
											<form:input type="text" path="attLocation"
												class="form-control"  placeholder="請輸入修正的景點位置" />
										</div>

										<div class="form-group">
											<form:label path="attDescription"> 景點說明: </form:label>
											<div id="editor1">
										<form:textarea id="t1" rows="6" cols="50" path="attDescription" class="form-control" placeholder="請輸入修正的景點說明"></form:textarea>											</div>
										<script>
    									document.getElementById("t1").value=${selectByAttid.attDescription}
   										</script>
										</div>
										
										
										
										<div class="form-group">
											<form:label path="attNotice"> 購票須知: </form:label>
											<div id="editor2">
										<form:textarea id="t2" rows="6" cols="50" path="attNotice" class="form-control" placeholder="請輸入修正的購票須知"></form:textarea>											</div>
										<script>
		    							document.getElementById("t2").value=${selectByAttid.attDescription}
   										</script>
										</div>
										
										
										<br>

										<button type="submit" name="modify" class="btn btn-primary mr-2">修正</button>
										<button class="btn btn-light">返回</button>
                       				 </form:form>
									</div>
						<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>
				
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