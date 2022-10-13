<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>ChiTou- 探索熱門景點、獨特體驗、交通、飯店住宿、租車、美食</title>

<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>
<%@ include file="/WEB-INF/includes/newhomepage/CSSandJS.jsp"%>


</head>
<body>
	<%@ include file="/WEB-INF/includes/coco/attraction/Header.jsp"%>

	<%@ include file="/WEB-INF/includes/newhomepage/HeroImages.jsp"%>

	<%@ include file="/WEB-INF/includes/newhomepage/AttractionsRow.jsp"%>
	<%-- <%@ include file="/WEB-INF/includes/newhomepage/Row1.jsp"%> --%>


	<%@ include file="/WEB-INF/includes/newhomepage/HotelsRow.jsp"%>

	<%@ include file="/WEB-INF/includes/newhomepage/articlesRow.jsp"%>






	<%@ include file="/WEB-INF/includes/coco/attraction/Footer.jsp"%>

	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	
	<script>
		var logout = ${logout}
		console.log('logout:' + logout)

		if (logout == 1) {
			Swal.fire('Thanks!', 'You have logged out!', 'success')
			$('#img1').attr('src','/images/jacky/login/default1.png')
		}else{
			$('#img1').attr('src','/${memberbasicinfo.photo}')}
		
	</script>
	
	<script>
	
	
	
	</script>
	

</body>
</html>