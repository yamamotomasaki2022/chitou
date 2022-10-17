<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="tw.luana.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- BootStrap -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
	crossorigin="anonymous">

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!-- chart.js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>

<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>





<title>OrderListChart</title>

</head>

<body>

	<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>


	<div class="container">

		<div class="card text-white bg-primary  mb-3"
			style="width: 18rem; display: inline-block;">
			<div class="card-header text-white"></div>
			<div class="card-body">
				<h3 class="card-title text-white">會員人數</h3>
				<p class="card-text text-white" style="font-weight: bolder">
				</p>
				<h2>${memberCount} 位</h2>
			</div>

		</div>
		<div class="card text-white bg-info  mb-3"
			style="width: 18rem; display: inline-block;">
			<div class="card-header"></div>
			<div class="card-body">
				<h3 class="card-title text-white">訂單總數</h3>
				<p class="card-text text-white" style="font-weight: bolder">
				</p>
				<h2>${orderCount} 筆</h2>
			</div>

		</div>
		<div class="card text-white bg-success  mb-3"
			style="width: 18rem; display: inline-block;">
			<div class="card-header"></div>
			<div class="card-body">
				<h3 class="card-title text-white">訂單總銷售額</h3>
				<p class="card-text text-white" style="font-weight: bolder">
				</p>
				<h2>${orderSale} $</h2>
			</div>
		</div>




	</div>
	<div class="container">
		<div class="chartdiv"
			style="width: 350px; height: 400px; border: 2px #cccccc solid; margin: 15px">
			<span>會員性別比</span>
			<canvas id="myChart1" width="200px" style="padding: 20px 10px"></canvas>

		</div>
	</div>

	<div class="container">


		<div class="chartdiv"
			style="width: 350px; height: 400px; border: 2px #cccccc solid; float: right; margin: 15px">
			<span>訂單數比例</span>
			<canvas id="myChart2" width="200px" style="padding: 20px 10px"></canvas>

		</div>


		<div class="chartdiv"
			style="width: 480px; height: 400px; border: 2px #cccccc solid; float: left; margin: 15px">
			<span>訂單營業額</span>
			<canvas id="myChart3" width="300px" height="200px"
				style="margin: 20px"></canvas>

			<!-- 	style="width:100%;max-width:800px -->
		</div>

	</div>


	<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
		crossorigin="anonymous"></script>

	<script type="text/javascript">

		var memberxValues = [ "男", "女","不透漏"];
		var memberyValues = [ ${male}, ${female},3];
		var barColors = [ "#a7ccdb", "#f3747a","#ffdf91" ];

		new Chart("myChart1", {
			type : "doughnut",
			data : {
				labels : memberxValues,
				datasets : [ {
					backgroundColor : barColors,
					data : memberyValues
				} ]
			},
			options : {
				title : {
					display : false,
					text : ""
				}
			}
		});
		
		var xValues = [ "機票", "飯店", "景點"];
		var yValues = [ ${flightCount}, ${hotalCount}, ${attrCount}];
		var barColors = [ "#c7ecfb", "#ffb0e6", "#ffdf91" ];

		new Chart("myChart2", {
			type : "doughnut",
			data : {
				labels : xValues,
				datasets : [ {
					backgroundColor : barColors,
					data : yValues
				} ]
			},
			options : {
				title : {
					display : false,
					text : ""
				}
			}
		});

		var xValues = [ "機票", "飯店", "景點" ];
		var yValues = [ ${flightSale}, ${hotalSale}, ${attrSale} ];
		var barColors = [ "#c7ecfb", "#ffb0e6", "#ffdf91" ];

		new Chart("myChart3", {
			type : "bar",
			data : {
				labels : xValues,
				datasets : [ {
					label: '各訂單營業額',
					backgroundColor : barColors,
					data : yValues
				} ]
			},
			options : {
				legend : {
					display : false
				},
				title : {
					display : false
				}
			}
		});
		

	</script>
</body>
</html>