<%@page import="org.springframework.context.annotation.Bean"%>
<%@page import="java.util.List"%>
<%@page import="tw.trista.flightticket.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>來Chitou訂機票</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/trista/bootstrap.min.css">
<!-- <link rel="stylesheet" href="/css/trista/bootstrap-theme.min.css"> -->
<!-- <link rel="stylesheet" href="/css/trista/fontAwesome.css"> -->
<!-- <link rel="stylesheet" href="/css/trista/hero-slider.css"> -->
<!-- <link rel="stylesheet" href="/css/trista/owl-carousel.css"> -->
<!-- <link rel="stylesheet" href="/css/trista/datepicker.css"> -->
<link rel="stylesheet" href="/css/trista/tooplate-style.css">

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link href="https://img.onl/DOO7l" rel="icon" type="image/png" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript"></script>
<style>
</style>

<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>

</head>

<body>


	<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>

	<fieldset>
		<h1 class="card-title text-primary">&nbsp;即刻上Chitou預訂最低價機票！</h1>
		<div class="col-md-5 col-md-offset-1">
			<section id="first-tab-group" class="tabgroup">
				<div id="tab1">
					<div class="submit-form">
						<h4>選擇您希望的班機時間</h4>
						<form id="form-submit" action="frontsearchflightticket" method="post">
							<div class="row">
								<div class="col-md-6">
									<fieldset>
										<label for="originid">出發機場：</label> 
										<select name="originid" class="form-control" id="originid">
											<optgroup label="亞洲">
												<option value="松山TSA">松山TSA</option>
												<option value="桃機TPE">桃機TPE</option>
												<option value="台中TXG">台中TXG</option>
												<option value="台南TNN">台南TNN</option>
												<option value="高雄KHH">高雄KHH</option>
												<option value="北京PEK">北京PEK</option>
											</optgroup>
										</select>
									</fieldset>
								</div>
								<div class="col-md-6">
									<fieldset>
										<label for="destinationid">降落機場：</label> 
										<select name="destinationid" class="form-control" id="destinationid">
											<optgroup label="亞洲">
												<option value="松山TSA">松山TSA</option>
												<option value="桃機TPE">桃機TPE</option>
												<option value="台中TXG">台中TXG</option>
												<option value="台南TNN">台南TNN</option>
												<option value="高雄KHH">高雄KHH</option>
												<option value="北京PEK">北京PEK</option>
												<option value="東京TYO">東京TYO</option>
											</optgroup>
										</select>
									</fieldset>
								</div>
								<div class="col-md-6">
									<fieldset>
										<label for="departuretime">出發日期：</label> 
										<input name="departuretime"
											type="date" class="form-control date" id="departuretime"
											placeholder="Select date..." required onchange='this.form.()'>
									</fieldset>
								</div>
								<div class="col-md-6">
									<fieldset>
										<label for="arrivaltime">降落日期：</label> 
										<input name="arrivaltime"
											type="date" class="form-control date" id="arrivaltime"
											placeholder="Select date..." required onchange='this.form.()'>
									</fieldset>
								</div>
								<div class="col-md-6">
									<div class="radio-select">
										<div class="row">
											<div class="col-md-6 col-sm-6 col-xs-6">
												<label for="round">來回</label> 
												<input type="radio"
													name="trip" id="round" value="round"
													requiredonchange='this.form.()'>
											</div>
											<div class="col-md-6 col-sm-6 col-xs-6">
												<label for="oneway">單程</label> <input type="radio"
													name="trip" id="oneway" value="one-way"
													requiredonchange='this.form.()'>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<fieldset>
										<button type="submit" id="form-submit" class="btn">搜出最適航班</button>
									</fieldset>
								</div>
							</div>
						<form>
					</div>
				</div>
			</section>
		</div>
		</div>
		</div>
		</section>

























		<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>


		<script>
			
		</script>
</body>
</html>