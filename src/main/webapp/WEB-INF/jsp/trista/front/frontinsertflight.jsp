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
<title>來Chitou訂機票</title>
<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>

</head>
<body>
	<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>
	<!--標頭開始-->
	<h4 class="card-title text-primary">&nbsp;預訂機票</h4>
	<p class="card-description">請輸入購買人的資料</p>
	<!--form開始-->
	<form:form class="forms-sample" action="addFlightTicketOrder"
		method="post" modelAttribute="flightticketorder"
		enctype="multipart/form-data">

		<div class="form-group">
			<form:label path="firstname">訂購人姓氏:</form:label>
			<form:input type="text" path="firstname" class="form-control" id="firstname"
				 placeholder="請輸入護照英文姓氏"/>
		</div>
		
		<div class="form-group">
			<form:label path="lastname">訂購人名字:</form:label>
			<form:input type="text" path="lastname" class="form-control" id="lastname"
				 placeholder="請輸入護照英文名字"/>
		</div>
		
		<div class="form-group">
			<form:label path="emailaddress">信箱:</form:label>
			<form:input type="text" path="emailaddress" class="form-control" id="emailaddress"
				 placeholder="請輸入訂購人信箱"/>
		</div>
		
		<div class="form-group">
			<form:label path="emailaddress">電話:</form:label>
			<form:input type="text" path="phone" class="form-control" id="phone"
				 placeholder="請輸入訂購人電話"/>
		</div>
		
		<div class="form-group">
			<form:label path="airline">航空公司:</form:label>
			<form:input type="text" path="airline" class="form-control" id="airline"
				value="${flightticket1.airline}"/>
		</div>
		
		<div class="form-group">
			<form:label path="flightid">航班編號:</form:label>
			<form:input type="text" path="flightid" class="form-control" id="flightid"
				value="${flightticket1.flightid}"/>	
		</div>
		
		<div class="form-group">
			<form:label path="classid">艙等:</form:label>
			<form:input type="text" path="classid" class="form-control" id="classid"
				value="${flightticket1.classid}"/>	
		</div>
				
		<div class="form-group">
			<form:label path="originid">出發機場:</form:label>
			<form:input type="text" path="originid" class="form-control" id="originid"
				value="${flightticket1.originid}"/>
		</div>

		<div class="form-group">
			<label>出發時間:<label>
			<form:input type="text" path="departuretime" class="form-control" id="departuretime"
				value="${flightticket1.departuretime}"/>
		</div>

		<div class="form-group">
			<form:label path="destinationid">降落機場:</form:label>
			<form:input type="text" path="destinationid" class="form-control" id="destinationid"
				value="${flightticket1.destinationid}"/>
		</div>

		<div class="form-group">
			<label>降落時間:<label>
			<form:input type="text" path="arrivaltime" class="form-control" id="arrivaltime"
				value="${flightticket1.arrivaltime}"/>
		</div>


		<div class="form-group">
			<form:label path="fare">票價:</form:label>
			<form:input type="number" path="fare" class="form-control" id="fare"
				value="${flightticket1.fare}"/>
		</div>








		<br>

		<button type="submit" name="modify" class="btn btn-primary mr-2">結帳</button>
		<a href="flightticket.main"><button class="btn btn-light">返回</button></a>
		<button type="button" id="fastInput" class="btn btn-light">一鍵輸入</button>
	</form:form>
	</div>
	<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>
	<script>
		$('#fastInput').click(function() {

			$('#firstname').val('Wong');
			$('#lastname').val('XiaoMing');
			$('#emailaddress').val('chitou01@gmail.com');
			$('#phone').val('0955167899');
			
		})
	</script>
	<script src="/js/coco/ckeditor.js"></script>



</body>
</html>