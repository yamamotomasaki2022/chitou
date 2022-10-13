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
						<form id="form-submit" action="frontsearchflightticket"
							method="post">
							<div class="row">
								<div class="col-md-6">
									<fieldset>
										<label for="originid">出發機場：</label> <select name="originid"
											class="form-control" id="originid">
											<optgroup label="台灣">
												<option value="松山TSA">松山TSA</option>
												<option value="台北TPE">台北TPE</option>
												<option value="台中TXG">台中TXG</option>
												<option value="台南TNN">台南TNN</option>
												<option value="高雄KHH">高雄KHH</option>
											</optgroup>
											<optgroup label="中國">
												<option value="香港HKG">香港HKG</option>
												<option value="澳門MFM">澳門MFM</option>
												<option value="北京PEK">北京PEK</option>
												<option value="上海SHA">上海SHA</option>
												<option value="天津TSN">天津TSN</option>
												<option value="成都CTU">成都CTU</option>
											</optgroup>
											<optgroup label="日本">
												<option value="東京TYO">東京TYO</option>
												<option value="大阪OSA">大阪OSA</option>
												<option value="名古屋NGO">名古屋NGO</option>
												<option value="沖繩OKA">沖繩OKA</option>
												<option value="札幌SPK">札幌SPK</option>
												<option value="福岡FUK">福岡FUK</option>
											</optgroup>
											<optgroup label="韓國">
												<option value="首爾SEL">首爾SEL</option>
												<option value="釜山PUS">釜山PUS</option>
											</optgroup>
											<optgroup label="北美洲">
												<option value="波士頓BOS">波士頓BOS</option>
												<option value="紐約NYK">紐約NYK</option>
												<option value="亞特蘭大ATL">亞特蘭大ATL</option>
												<option value="邁阿密MIA">邁阿密MIA</option>
												<option value="溫哥華YVR">溫哥華YVR</option>
												<option value="多倫多YYZ">多倫多YYZ</option>
											</optgroup>
											<optgroup label="歐洲">
												<option value="倫敦LON">倫敦LON</option>
												<option value="巴黎PAR">巴黎PAR</option>
												<option value="阿姆斯特丹AMS">阿姆斯特丹AMS</option>
												<option value="維也納VIE">維也納VIE</option>
												<option value="布拉格PRG">布拉格PRG</option>
												<option value="米蘭MIL">米蘭MIL</option>
											</optgroup>
										</select>
									</fieldset>
								</div>
								<div class="col-md-6">
									<fieldset>
										<label for="destinationid">降落機場：</label> <select
											name="destinationid" class="form-control" id="destinationid">
											<optgroup label="台灣">
												<option value="松山TSA">松山TSA</option>
												<option value="台北TPE">台北TPE</option>
												<option value="台中TXG">台中TXG</option>
												<option value="台南TNN">台南TNN</option>
												<option value="高雄KHH">高雄KHH</option>
											</optgroup>
											<optgroup label="中國">
												<option value="香港HKG">香港HKG</option>
												<option value="澳門MFM">澳門MFM</option>
												<option value="北京PEK">北京PEK</option>
												<option value="上海SHA">上海SHA</option>
												<option value="天津TSN">天津TSN</option>
												<option value="成都CTU">成都CTU</option>
											</optgroup>
											<optgroup label="日本">
												<option value="東京TYO">東京TYO</option>
												<option value="大阪OSA">大阪OSA</option>
												<option value="名古屋NGO">名古屋NGO</option>
												<option value="沖繩OKA">沖繩OKA</option>
												<option value="札幌SPK">札幌SPK</option>
												<option value="福岡FUK">福岡FUK</option>
											</optgroup>
											<optgroup label="韓國">
												<option value="首爾SEL">首爾SEL</option>
												<option value="釜山PUS">釜山PUS</option>
											</optgroup>
											<optgroup label="北美洲">
												<option value="波士頓BOS">波士頓BOS</option>
												<option value="紐約NYK">紐約NYK</option>
												<option value="亞特蘭大ATL">亞特蘭大ATL</option>
												<option value="邁阿密MIA">邁阿密MIA</option>
												<option value="溫哥華YVR">溫哥華YVR</option>
												<option value="多倫多YYZ">多倫多YYZ</option>
											</optgroup>
											<optgroup label="歐洲">
												<option value="倫敦LON">倫敦LON</option>
												<option value="巴黎PAR">巴黎PAR</option>
												<option value="阿姆斯特丹AMS">阿姆斯特丹AMS</option>
												<option value="維也納VIE">維也納VIE</option>
												<option value="布拉格PRG">布拉格PRG</option>
												<option value="米蘭MIL">米蘭MIL</option>
											</optgroup>
										</select>
									</fieldset>
								</div>
								<div class="col-md-6">
									<fieldset>
										<label for="departuretime">出發日期：</label> <input
											name="departuretime" type="date" class="form-control date"
											id="departuretime" placeholder="Select date..." required
											onchange='this.form.()'>
									</fieldset>
								</div>
								<div class="col-md-6">
									<fieldset>
										<label for="arrivaltime">降落日期：</label> <input
											name="arrivaltime" type="date" class="form-control date"
											id="arrivaltime" placeholder="Select date..." required
											onchange='this.form.()'>
									</fieldset>
								</div>
								<div class="col-md-6">
									<div class="radio-select">
										<div class="row">
											<div class="col-md-6 col-sm-6 col-xs-6">
												<label for="round">來回</label> <input type="radio"
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
										<button type="button" id="fastInput" class="btn btn-light">一鍵輸入</button>
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
		$('#fastInput').click(function() {
			$('#originid').val('台北TPE');
			$('#departuretime').val('2022-12-31');
			$('#destinationid').val('沖繩OKA');
			$('#arrivaltime').val('2022-12-31');
			
		})
	</script>
</body>
</html>