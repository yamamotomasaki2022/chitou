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
  </head>
<body>
<%@ include file="/WEB-INF/includes/Header.jsp"  %>
	<h2 align="center">您想去哪裡?</h2>
    <div align="center">
	    <form action="searchHotel" method="get" >
	    目的地
	    <select id="destination" name="destination">
	    </select><br><br>
	    日期
	    <input type="text" id="date" name="date"><br><br>
	    <input type="hidden" id="dateStart" name="dateStart">
	    <input type="hidden" id="dateEnd" name="dateEnd">
	    旅客
	    <input type="number" name="number" style="width:50px">人<br><br>
	    <input type="submit" value="搜尋">
	    </form>
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
//     	"minDate": new Date(),
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