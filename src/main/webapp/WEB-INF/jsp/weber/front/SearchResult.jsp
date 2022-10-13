<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChiTou-飯店總覽</title>


<%@ include file="/WEB-INF/includes/weihan/hotels/HotelsListCSS.jsp"%>
	<%@ include file="/WEB-INF/includes/coco/attraction/AttractionsDescriptionCSS.jsp"%>


</head>
<body>
	<%@ include file="/WEB-INF/includes/coco/attraction/Header.jsp"%>
<div class="outerWrap">
        <!--==內頁區塊_開始==-->
        <div class="insideWrap">


            <!--==內容_開始==-->

            <div class="contentWrap">



                <div class="wrap clearfix">
               <br> <br><br> <br><br>
<!-- search bar -->
    	<%@ include file="/WEB-INF/includes/weihan/hotels/HotelsListSearch.jsp"%>

                   
                    <div class="videoBox">
                        <ul class="clearfix" id="searchResult">
							                        
						</ul>
                    </div>
                </div>


                <!--分頁-->

                <div class="pageBox">

                    <ul class="clearfix">



                        <li><a href="" class="active">1</a></li>


                        <li><a href="">2</a></li>


                        <li><a href="">3</a></li>


                        <li><a href="">4</a></li>


                        <li><a href="">5</a></li>


                        <li><a href="">6</a></li>


                        <li><a href="video_7.html">7</a></li>




                        <li><a href="video_2.html" class="function">next</a></li>

                        <li><a href="video_12.html" class="function">last</a></li>


                    </ul>

                </div>
            </div>
            <!--contentWrap-->

            <!--==內容_結束==-->


        </div>
        <!--insideWrap-->
        <!--==內頁區塊_結束==-->


    </div>
    <!--outerWrap-->
	<%@ include file="/WEB-INF/includes/coco/attraction/Footer.jsp"%>

    <!--wow-->

    
      		<%@ include file="/WEB-INF/includes/coco/attraction/AttractionsDescriptionJS.jsp"%>
      	<%@ include file="/WEB-INF/includes/weihan/hotels/HotelsListJS.jsp"%>
      		
      	
      	
  	<script type="text/javascript" src="/js/weber/SearchResult.js"></script>
</body>
</html>