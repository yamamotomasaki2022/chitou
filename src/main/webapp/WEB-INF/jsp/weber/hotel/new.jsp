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
	<div class="container-scroller">
		<%@ include file="/WEB-INF/includes/TopNavBar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<%@ include file="/WEB-INF/includes/ThemeBar.jsp"%>
			<%@ include file="/WEB-INF/includes/ToDoListBar.jsp"%>
			<%@ include file="/WEB-INF/includes/ManageBar.jsp"%>
			<!-- 中間欄位 -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title text-primary">&nbsp;飯店管理</h4>
									<p class="card-description" href="addAttraction">
										<button type="button" class="btn btn-inverse-primary btn-fw">
											<i class="ti-plus"></i>&nbsp;新增飯店
										</button>
									</p>
									<div class="table-responsive">
										<table class="table table-hover">
											<thead>
												<tr>
													<th>圖片</th>
													<th>飯店ID</th>
													<th>飯店名稱</th>
													<th>地址</th>
													<th>類型</th>
													<th>介紹</th>
													<th>國家</th>
													<th>電話</th>
													<th>狀態</th>
													<th>可容納人次</th>
													<th>業主名稱</th>
													<th>平均房價</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="bean" items="${result}">
													<tr>
														<form action="updateAttraction" method="get">
															<td></td>
															<td><c:out value="${bean.hotelID}" /></td>
															<td><c:out
																	value="${bean.name}" /></td>
															<td><c:out value="${bean.address}" /></td>
															<td><c:out value="${bean.type}" /></td>
															<td><c:out
																	value="${bean.intro}" /></td>
															<td><c:out value="${bean.country}" /></td>
															<td><c:out value="${bean.phone}" /></td>
															<td><c:out value="${bean.status}" /></td>
															<td><c:out value="${bean.capacity}" /></td>
															<td><c:out value="${bean.owner}" /></td>
															<td><c:out value="${bean.averagePrice}" /></td>
															<td>

																<button type="submit" name="update"
																	class="btn btn-inverse-success btn-icon">
																	<i class="ti-pencil-alt"></i>
																</button> &nbsp; &nbsp;
																 <!-- 刪除 -->
																<button 
																	href="deleteAttraction?attid="
																	class="btn btn-inverse-danger btn-icon">
																	<i class="ti-trash"></i>
																</button></td>
														</form>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!-- partial -->
					</div>
					<!-- main-panel ends -->
				</div>
				<!-- page-body-wrapper ends -->
			</div>
		</div>
	</div>
</body>
</html>