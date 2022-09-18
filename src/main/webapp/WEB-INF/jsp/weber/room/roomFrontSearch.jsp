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
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>

  </head>
<body>
	<h2 align="center">您想去哪裡?</h2>
    <div align="center">
	    <form action="searchRoom" action="hotelSearch" method="get" >
	    <select id="destination" name="type">
	    </select>
	    <input type="text" name="keyword">
	    <input type="submit" name="search" value="搜尋">
	    </form>
	</div>
	<script>
	var des = ["台灣","日本","澳洲","英國","法國"];
	var desName = ["台灣","日本","澳洲","英國","法國"];
    $(document).ready( function () {
        for(var i=0;i<type.length;i++){
        	let option = '"<option value="'+des[i]+'">'+desName[i]+'</option>"';
        	$('#destination').append(option);
        }
    }); 
	</script>
</body>
</html>