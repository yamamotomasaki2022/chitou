<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%response.setContentType("text/html;charset=UTF-8");%>
<!DOCTYPE html>
<html>
<html lang="en">
  <head>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8" />
    <title>找飯店</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="/js/weber/daterangepicker/moment.min.js"></script>
	<script type="text/javascript" src="/js/weber/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/js/weber/daterangepicker/daterangepicker.css" />
	
	
<!-- 	<link rel="preconnect" href="https://fonts.googleapis.com"> -->
<!-- <link rel="preconnect" href="https://fonts.gstatic.com"> -->

<!-- <link rel="stylesheet" -->
<!-- 	href="/css/beforehomepage/fonts/icomoon/style.css"> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="/css/beforehomepage/fonts/flaticon/font/flaticon.css"> -->

<!-- <link rel="stylesheet" href="/css/beforehomepage/css/tiny-slider.css"> -->
<!-- <link rel="stylesheet" href="/css/beforehomepage/css/aos.css"> -->
<!-- <link rel="stylesheet" href="/css/beforehomepage/css/style.css"> -->
	
	
	
  </head>
<body>
<%@ include file="/WEB-INF/includes/Header.jsp"  %>
	<br>
	<div align="center">
	    <form action="/searchHotel" method="get" >
	    前往
	    <select id="destination" name="destination">
	    </select>
	    入住日期
	    <input type="text" id="date" name="date" value="${dateStart} - ${dateEnd}">
	    <input type="hidden" id="dateStart" name="dateStart" value="${dateStart}">
	    <input type="hidden" id="dateEnd" name="dateEnd" value="${dateEnd}">
	    人數
	    <input type="number" name="number" style="width:50px;" value="${number}">人
	    <input type="submit" value="搜尋">
	    </form>
	</div>
	<br>
	<div class="container">
					<div class="row">
						<c:forEach var="bean" items="${result}">
						<div class="col-md-4 col-sm-4 col-xs-12">
							<div class="single-awesome-project">
								<a href="property-single.html" class="img"> <img
									src="/css/beforehomepage/images/japan-2.jpg" alt="Image" class="img-fluid">
								</a>

								<div class="project-dec-2">
									<div>
										<span class="d-block mb-2 text-black-50"><i
											class="fa-solid fa-location-dot"></i> ${bean.name}</span> <span
											class="city d-block mb-3">${bean.address}</span>
										<div class="specs d-flex mb-4">
											<span class="d-block d-flex align-items-center me-3">
												<span class="icon-bed me-2"></span> <span class="caption">
													平均房價:${bean.averagePrice}
												</span>
											</span>
										</div>

										<a href="" class="btn btn-primary py-2 px-3"
											style="background-color: lightblue">詳細</a>
										<span style="color:blue">還剩${bean.amount}間房</span>
									</div>
								</div>
							</div>
						</div>
						
						</c:forEach>
					</div>
		</div>
	<script>
	var des = ["台灣","日本","澳洲","英國","法國"];
    $(document).ready( function () {
        for(var i=0;i<des.length;i++){
        	let option = '"<option value="'+des[i]+'">'+des[i]+'</option>"';
        	$('#destination').append(option);
        };
        let date = new Date().toISOString().split('T')[0];
        $('#dateStart').val(date);
		$('#dateEnd').val(date);
    }); 
    $("#date").daterangepicker({
    	"minDate": new Date(),
    	locale:{
    		applyLabel:"確定",
    		cancelLabel: "取消",
    		fromLabel: "開始日期",
    		toLabel: "結束日期",
    		daysOfWeek: ["日", "一", "二", "三", "四", "五", "六"],
    		monthNames: ["1月", "2月", "3月", "4月", "5月", "6月",
    		"7月", "8月", "9月", "10月", "11月", "12月"],
    	}
    });
    $("#date").on('change',function(){
    	let date = $(this).val().replace(" ","").replace(" ","").split('-');
		$('#dateStart').val(date[0]);
		$('#dateEnd').val(date[1]);
    });
	</script>
</body>
</html>