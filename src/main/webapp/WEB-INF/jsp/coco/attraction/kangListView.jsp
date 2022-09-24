<%@page import="java.util.List"%>
<%@page import="tw.cocokang.attraction.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChiTou後台管理系統-景點總覽</title>
<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>

	<h4 class="card-title text-primary">&nbsp;景點總覽</h4>
	<p class="card-description" href="addAttraction">
		<a href="addAttraction">
			<button type="button" class="btn btn-inverse-primary btn-fw">
				<i class="ti-plus"></i>&nbsp;新增景點
			</button>
		</a>
	</p>
	<div class="table-responsive">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>景點圖片</th>
					<th>景點編號</th>
					<th>方案編號</th>
					<th>景點名稱</th>
					<th>景點位置</th>
					<th>景點說明</th>
					<th>購票須知:</th>
					<th>操作:</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="attraction" items="${listAttraction}">
					<tr>
						<form action="updateAttraction" method="get">
							<td class="py-1"><img src="../../images/faces/face3.jpg"
								alt="image" /></td>
							<td><c:out value="${attraction.attid}" /></td>
							<td><c:out
									value="${attraction.hobbyclassification.preferid}" /></td>
							<td><c:out value="${attraction.attName}" /></td>
							<td><c:out value="${attraction.attLocation}" /></td>
							<td><c:out
									value="${attraction.attDescription.substring(0,5)}" /></td>
							<td><c:out value="${attraction.attNotice}" /></td>

							<td><input type="hidden" name="attid"
								value="${attraction.attid}"> <input type="hidden"
								name="hobbyclassification"
								value="${attraction.hobbyclassification.preferid}"> <input
								type="hidden" name="attName" value="${attraction.attName}">
								<input type="hidden" name="attLocation"
								value="${attraction.attLocation}"> <input type="hidden"
								name="attDescription" value="${attraction.attDescription}">
								<input type="hidden" name="attNotice"
								value="${attraction.attNotice}">

								<button type="submit" name="update"
									class="btn btn-inverse-success btn-icon">
									<i class="ti-pencil-alt"></i>
								</button> &nbsp; &nbsp;
						</form>
						<!-- 刪除 -->
						<a href="deleteAttraction?attid=${attraction.attid}"><button
								class="btn btn-inverse-danger btn-icon">
								<i class="ti-trash"></i>
							</button></a>
						</td>
				</c:forEach>
			</tbody>
		</table>
		<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>
</body>
</html>