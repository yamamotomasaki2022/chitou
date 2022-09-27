<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>測試能不能用</title>
	<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>
</head>
<body>
	<div class="container-scroller">
		<!-- partial:partials/_navbar.html -->
		<%@ include file="/WEB-INF/includes/TopNavBar.jsp"%>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:../../partials/_settings-panel.html -->
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
											<i class="ti-plus"></i>
											&nbsp;新增飯店
										</button>
									</p>
									<div class="table-responsive">
										<table class="table table-hover">
											<thead id="tableHead">
											</thead>
											<tbody>
												<c:forEach var="bean" items="${result}">
													<tr>
														<form action="updateAttraction" method="get">
															<td></td>
															<td>${bean.hotelID}</td>
															<td>${bean.name}</td>
															<td>${bean.address.substring(0,5)}</td>
															<td>${bean.type}</td>
															<td>${bean.intro.substring(0,5)}</td>
															<td>${bean.country}</td>
															<td>${bean.phone}</td>
															<td>${bean.status}</td>
															<td>${bean.capacity}</td>
															<td>${bean.owner}</td>
															<td>${bean.averagePrice}</td>
															<td>
																<button type="submit" name="update" class="btn btn-inverse-success btn-icon">
																	<i class="ti-pencil-alt"></i>
																</button> 
																&nbsp; &nbsp;
																 <!-- 刪除 -->
																<button href="deleteAttraction?attid=" class="btn btn-inverse-danger btn-icon">
																	<i class="ti-trash"></i>
																</button>
															</td>
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
	<script>
		var type = ["photos","hotelID","name","address","type","intro","country","phone","status","capacity","owner","averagePrice"];
		var typeName = ["照片","飯店ID","飯店名稱","地址","類型","介紹","國家","電話","狀態","可容納人次","業主名稱","平均房價"];
	    $(document).ready( function () {
// 	        for(var i=1;i<type.length;i++){
// 	        	let option = '"<option value="'+type[i]+'">'+typeName[i]+'</option>"';
// 	        	$('#type').append(option);
// 	        }
	        for(var i=0;i<typeName.length;i++){
	        	let tr =  '<th>'+typeName[i]+'</th>';
	        	$('#tableHead').append(tr);
	        }
			$('#tableHead').append('<th>操作</th>');	        
	    }); 
	</script>
</body>
</html>