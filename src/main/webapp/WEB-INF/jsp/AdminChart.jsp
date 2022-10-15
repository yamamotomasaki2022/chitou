<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@page import="java.util.*, javax.sql.*,tw.jacky.login.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>AdminHomePage</title>
<link href="https://img.onl/DOO7l" rel="icon" type="image/png" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>

<!-- chart js api -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>

<style>

.chartdiv {
  color: #26b72b;
  border:10px;
  margin-top : 30px;
  text-align: center;
}


</style>





<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>

</head>


<body>

	<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>


<h1 style="text-align:center">統計數據</h1>


<div class="chartdiv" style="width:300px;height:330px;border:3px #cccccc dashed;float: right">
	<span>各洲旅游人口比例</span>	
<canvas id="myChart2" style="width:100%;max-width:300px"></canvas>
	
</div>

	
	<div  class="chartdiv" style="width:400px;height:320px;border:3px #cccccc dashed;float: left">
	<span>男女會員人數</span>	
	<canvas id="myChart3" width="300px" height="200px" ></canvas>
	
<!-- 	style="width:100%;max-width:800px -->

	</div>




	<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>






	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script>
		var status = "${session_status}";

		if (status == 1) {
			document.getElementById('aaa').setAttribute("style",
					"display : none")
		}else if(status==2){
			document.getElementById('aaa').setAttribute("style",
			"display : '' ")
		}else if(status==3){
			document.getElementById('aaa').setAttribute("style",
			"display : '' ")
		}
		
	</script>






<script>





var xValues = ["北美洲", "南美洲", "歐洲", "亞洲", "非洲"];
var yValues = [30, 20, 45, 44, 15];
var barColors = [
  "#FF9797",
  "#CA8EFF",
  "#79FF79",
  "#1AFD9C",
  "#9AFF02"
];

new Chart("myChart2", {
  type: "doughnut",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
    title: {
      display: true,
      text: "World Wide Wine Production 2018"
    }
  }
});


</script>

<script>
var xValues = ["男","女"];
var yValues = [55, 49];
var barColors = ["blue","red"];

new Chart("myChart3", {
  type: "bar",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
    legend: {display: true},
    title: {
      display: false
    }
  }
});
</script>


<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
	
	var welcome = ${welcome_message}
	
	
	if (welcome == 1) {
		Swal.fire(
				  'Welcome!',
				  'Admin!',
				  'success'
				)
	} else if (welcome == 2) {
		Swal.fire(
				  'Welcome!',
				  'Manager!',
				  'success'
				)

	} else if (welcome == 3) {
		Swal.fire(
				  'Welcome!',
				  'Boss!',
				  'success'
				)

	} else {
		
	}
	
	
	</script>


</body>
</html>