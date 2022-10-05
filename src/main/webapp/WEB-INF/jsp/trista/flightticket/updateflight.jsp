<%@page import="tw.trista.flightticket.model.*"%>
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
<title>ChiTou後台管理系統-更新航班</title>
<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>

</head>
<body>
	<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>
	<!--標頭開始-->
	<h4 class="card-title text-primary">&nbsp;更新航班</h4>
	<p class="card-description">請輸入您要更新的資料</p>
	<!--form開始-->
	<form:form class="forms-sample" action="updateFlightTicketAction"
		method="post" modelAttribute="flightticket1"
		enctype="multipart/form-data">
		<form:input type="hidden" path="flightid"
			value="${flightticket1.flightid}" class="form-control" />
		<form:input type="hidden" path="airline"
			value="${flightticket1.airline}" class="form-control" />
		<form:input type="hidden" path="classid"
			value="${flightticket1.classid}" class="form-control" />

		<div class="form-group">
			<form:label path="originid">出發機場:</form:label>
			<form:input type="text" path="originid" class="form-control" id="originid"
				value="${flightticket1.originid}" placeholder="請輸入更新的出發機場" />
		</div>

		<div class="form-group">
			<form:label path="departuretime">出發時間:</form:label>
			<form:input type="date" path="departuretime" class="form-control" id="departuretime"
				value="${flightticket1.departuretime}" placeholder="請輸入更新的出發時間" />
		</div>

		<div class="form-group">
			<form:label path="destinationid">降落機場:</form:label>
			<form:input type="text" path="destinationid" class="form-control" id="destinationid"
				value="${flightticket1.destinationid}" placeholder="請輸入更新的降落機場" />
		</div>

		<div class="form-group">
			<form:label path="arrivaltime">降落時間:</form:label>
			<form:input type="date" path="arrivaltime" class="form-control" id="arrivaltime"
				value="${flightticket1.arrivaltime}" placeholder="請輸入更新的降落時間" />
		</div>


		<div class="form-group">
			<form:label path="fare">票價:</form:label>
			<form:input type="number" path="fare" class="form-control" id="fare"
				value="${flightticket1.fare}" placeholder="請輸入更新的票價" />
		</div>








		<br>

		<button type="submit" name="modify" class="btn btn-primary mr-2">更新</button>
		<a href="flightticket.main"><button class="btn btn-light">返回</button></a>
		<button type="button" id="fastInput" class="btn btn-light">一鍵輸入</button>
	</form:form>
	</div>
	<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>
	<script>
		$('#fastInput').click(function() {

			$('#originid').val('桃園TPE');
			$('#departuretime').val('2022-12-31');
			$('#destinationid').val('波士頓BOS');
			$('#arrivaltime').val('2023-01-01');
			$('#fare').val('18699');
		})
	</script>
	<script src="/js/coco/ckeditor.js"></script>



</body>
</html>