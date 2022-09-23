<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>測試</title>
	<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>
</head>
<body>
			<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>

									<h4 class="card-title text-primary">&nbsp;飯店管理</h4>
									<p class="card-description" href="addAttraction">
										<button type="button" class="btn btn-inverse-primary btn-fw">
											<i class="ti-plus"></i>&nbsp;新增飯店
										</button>
									</p>
									<div class="table-responsive">
										
									</div>
								
			<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>

</body>
</html>