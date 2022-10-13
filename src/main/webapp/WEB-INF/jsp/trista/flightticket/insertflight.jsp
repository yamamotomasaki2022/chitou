<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ChiTou後台管理系統-新增航班</title>
<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>


<!--設定長編輯器寬度-->
<style>
.ck-editor__editable {
	min-height: 100px;
	/* width: 100%;
            margin: 0 auto; */
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>

	<!--標頭開始-->
	<h4 class="card-title text-primary">&nbsp;新增航班</h4>
	<p class="card-description">請輸入您要新增的航班</p>
	<!--form開始-->
	<form:form class="forms-sample" action="addFlightTicketAction"
		method="post" modelAttribute="flightticket"
		enctype="multipart/form-data">

		<div class="form-group">
			<form:label path="airline">航空公司:</form:label>
			<form:input type="text" path="airline" class="form-control"
				placeholder="請輸入新增的航空公司" />
		</div>
		<div class="form-group">
			<form:label path="flightid">班機編號:</form:label>
			<form:input type="text" class="form-control" id="flightid"
				path="flightid" placeholder="請輸入班機的編號" />
		</div>

		<div class="form-group">
			<form:label path="originid">出發機場:</form:label>
			<select name="originid" class="form-control" id="originid">
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
		</div>

		<div class="form-group">
			<form:label path="departuretime">出發日期:</form:label>
			<form:input type="date" path="departuretime" class="form-control"
				id="departuretime" placeholder="請輸入出發的日期" />
		</div>

		<div class="form-group">
			<form:label path="destinationid"> 降落機場: </form:label>
			<select name="destinationid" class="form-control" id="destinationid">
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
		</div>

		<div class="form-group">
			<form:label path="arrivaltime">降落日期:</form:label>
			<form:input type="date" path="arrivaltime" class="form-control"
				id="arrivaltime" placeholder="請輸入降落的日期" />
		</div>

		<div class="form-group">
			<form:label path="classid"> 艙等: </form:label>
			<select name="classid" class="form-control" id="classid">
				<option value="1">頭等艙</option>
				<option value="2">商務艙</option>
				<option value="3">經濟艙</option>
			</select>
		</div>

		<div class="form-group">
			<form:label path="fare">票價:</form:label>
			<form:input type="number" path="fare" class="form-control" id="fare"
				placeholder="請輸入票價" />
		</div>

		<br>

		<button type="submit" name="submit" class="btn btn-primary mr-2">新增</button>
		<a href="flightticket.main"><button class="btn btn-light">返回</button></a>
		<button type="button" id="fastInput" class="btn btn-light">一鍵輸入</button>
	</form:form>
	<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>
	<script>
		$('#fastInput').click(function() {
			$('#airline').val('國泰');
			$('#flightid').val('CJ523');
			$('#originid').val('松山TSA');
			$('#departuretime').val('2022-10-20');
			$('#destinationid').val('沖繩OKA');
			$('#arrivaltime').val('2022-10-21');
			$('#classid').val('2');
			$('#fare').val('24599');
		})
	</script>

	<script>
		$(function() {
			$('form').on('click', ':submit', function() {
				console.log('button click')
				return check($(this).val());
			});				

	</script>




</body>

</html>