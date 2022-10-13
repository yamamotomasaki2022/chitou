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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>




<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>

</head>


<body>

	<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>


<div style="width:300px;height:300px;border:3px #cccccc dashed">

	<canvas id="myChart1" style="width:110%; max-width:600px"></canvas>
</div>
	
	
	<div style="width:700px;height:500px;border:3px #cccccc dashed">
	
	<canvas id="myChart2" style="width:100%;max-width:700px"></canvas>

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
	
// 	var welcome = ${welcome_message}
	
	
// 	if (welcome == 1) {
// 		Swal.fire(
// 				  'Welcome!',
// 				  'Admin!',
// 				  'success'
// 				)
// 	} else if (welcome == 2) {
// 		Swal.fire(
// 				  'Welcome!',
// 				  'Manager!',
// 				  'success'
// 				)

// 	} else if (welcome == 3) {
// 		Swal.fire(
// 				  'Welcome!',
// 				  'Boss!',
// 				  'success'
// 				)

// 	} else {
		
// 	}
	
	
	</script>


	<script>
	
	
// 	var crud = "${crud}";
	
// 	console.log("crud:" +crud)
	
// 	if (crud == 1) {
// 		Swal.fire(
// 				  '讚！',
// 				  '新增成功',
// 				  'success'
// 				).then((result) => 
// 				$.ajax({
// 				type:'get',
// 				url:'/manager/crudBean',
// 				success:function(data){
// 					console.log(data);
// 				}
				
// 				}
// 				)
				
				
// 				)
				
// 	} else if (crud == 2) {
// 		Swal.fire(
// 				  '',
// 				  'Manager!',
// 				  'success'
// 				)
// 	} else if (crud == 3) {
// 		Swal.fire(
// 				  '讚!',
// 				  '更新成功!',
// 				  'success'
// 				).then((result) => 
// 				$.ajax({
// 					type:'get',
// 					url:'/manager/crudBean',
// 					success:function(data){
// 						console.log(data);
// 					}
					
// 					}
// 					)
// 	} else if (crud == 4) {
// 		Swal.fire(
// 				  '讚！',
// 				  '刪除成功！',
// 				  'success'
// 				)
// 				.then((result) => 
// 				$.ajax({
// 				type:'get',
// 				url:'/manager/crudBean',
// 				success:function(data){
// 					console.log(data);
// 				}
				
// 				}
// 				)
				
// 	}else {
		
// 	}
	</script>


<script>
var xValues = ["Italy", "France", "Spain", "USA", "Argentina"];
var yValues = [55, 49, 44, 24, 15];
var barColors = [
  "#b91d47",
  "#00aba9",
  "#2b5797",
  "#e8c3b9",
  "#1e7145"
];

new Chart("myChart1", {
  type: "pie",
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

var xValues = [100,200,300,400,500,600,700,800,900,1000];

new Chart("myChart2", {
  type: "line",
  data: {
    labels: xValues,
    datasets: [{ 
      data: [860,1140,1060,1060,1070,1110,1330,2210,7830,2478],
      borderColor: "red",
      fill: false
    }, { 
      data: [1600,1700,1700,1900,2000,2700,4000,5000,6000,7000],
      borderColor: "green",
      fill: false
    }, { 
      data: [300,700,2000,5000,6000,4000,2000,1000,200,100],
      borderColor: "blue",
      fill: false
    }]
  },
  options: {
    legend: {display: false}
  }
});
</script>



</body>
</html>