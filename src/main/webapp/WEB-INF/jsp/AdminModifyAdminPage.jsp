<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="javax.management.MBeanAttributeInfo"%>
<%@page import=" java.util.*,tw.jacky.login.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChiTou後台管理系統-管理員資料更改</title>
<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	function getTime() {
		var currentTime = new Date();
		return currentTime
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>
		<h4 class="card-title text-primary">會員資料表</h4>
	
	
	
	
	
	
	
	
	
	
	
	
	
	<button type="submit" class="btn btn-primary mr-2" id="createmember" name="submit">提交</button>
					<a href="listAttractions"><button class="btn btn-light">返回</button></a> 
				<!-- herf=總攬連結 -->
	<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>

</body>
</html>