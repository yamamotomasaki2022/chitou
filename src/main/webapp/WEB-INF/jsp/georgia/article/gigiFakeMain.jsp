<%@page import="tw.jacky.login.model.*"%>
<%@page import="javax.management.MBeanAttributeInfo"%>
<%@page
	import="java.sql.Connection, java.util.*, javax.sql.*, javax.servlet.*,  javax.naming.*,java.io.*,java.sql.* ,tw.georgia.article.model.*,tw.georgia.article.controller.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html><!-- This site was created in Webflow. https://www.webflow.com -->
<!-- Last Published: Thu Nov 12 2020 22:33:24 GMT+0000 (Coordinated Universal Time) -->
<html data-wf-domain="denali-template.webflow.io" data-wf-page="5e4b1a54e48aed7a171ff230"
    data-wf-site="5e4b1a54e48aed761d1ff229" data-wf-status="1">

<head>
    <meta charset="utf-8" />
    <title>All posts</title>
    <meta content="All posts" property="og:title" />
    <meta content="All posts" property="twitter:title" />
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="Webflow" name="generator" />
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/georgia/article.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>
    <script
        type="text/javascript">WebFont.load({ google: { families: ["Lato:100,100italic,300,300italic,400,400italic,700,700italic,900,900italic"] } });</script>
    <!--[if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js" type="text/javascript"></script><![endif]-->
    <script
        type="text/javascript">!function (o, c) { var n = c.documentElement, t = " w-mod-"; n.className += t + "js", ("ontouchstart" in o || o.DocumentTouch && c instanceof DocumentTouch) && (n.className += t + "touch") }(window, document);</script>
    <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=5e4b1a54e48aed761d1ff229"
        type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
    <script src="https://assets.website-files.com/5e4b1a54e48aed761d1ff229/js/webflow.bf6a5095c.js"
        type="text/javascript"></script>
        
    <link href="https://img.onl/DOO7l" rel="icon" type="image/png" />
    <link href="https://assets.website-files.com/img/webclip.png" rel="apple-touch-icon" />
    <style type="text/css">
    	.accordion-body p{
    		font-size: 30px;
    	}
    	
    	.accordion-body a{
    		font-size: 25px;
    	}
    	.accordion-body a:hover{
    		color:rgb(150,84,85);
    		font-weight:bold;
    		font-size: 30px
    	}
    	
    	.bigFont{
    		font-size: 20px;
    	}
    	#BackTop	{
				position:fixed;				
				bottom:60px;
				right:10px;
				}
#ToBottom	{
				position:fixed;				
				bottom:10px;
				right:10px;
				}
.jiantou	{
				width: 2.7rem;
				height: 2.7rem;
				color:rgb(69,71,155);
				}
.background-w{
			background-color: #FFFFFF;"
}
    </style>
    <%@ include file="/WEB-INF/includes/coco/attraction/AttractionsDescriptionCSS.jsp"%>
</head>
<body>
<%@ include file="/WEB-INF/includes/coco/attraction/Header.jsp"%>
<br><br>
    <div class="content-wrapper">
        <div class="w-container">
            <div class="w-row">
                <div class="w-hidden-small w-hidden-tiny w-col w-col-3">
                    <div class="white-wrapper">
                    <!-- 國家表單 -->
                    <div class="custom-block" data-aos="fade-up">
        <div class="custom-accordion" id="accordion_1">
        <!-- *******************************************國家：亞洲******************************************************* -->
            <div class="accordion-item">
                <h2 class="mb-0">
                    <button class="btn" type="button" data-toggle="collapse" data-target="#collapseOne"
                        aria-expanded="true" aria-controls="collapseOne" onclick="country();" style="font-size: 35px;">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" style="width:30px;height:30px;"><!--! Font Awesome Pro 6.2.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M565.6 36.24C572.1 40.72 576 48.11 576 56V392C576 401.1 569.8 410.9 560.5 414.4L392.5 478.4C387.4 480.4 381.7 480.5 376.4 478.8L192.5 417.5L32.54 478.4C25.17 481.2 16.88 480.2 10.38 475.8C3.882 471.3 0 463.9 0 456V120C0 110 6.15 101.1 15.46 97.57L183.5 33.57C188.6 31.6 194.3 31.48 199.6 33.23L383.5 94.52L543.5 33.57C550.8 30.76 559.1 31.76 565.6 36.24H565.6zM48 421.2L168 375.5V90.83L48 136.5V421.2zM360 137.3L216 89.3V374.7L360 422.7V137.3zM408 421.2L528 375.5V90.83L408 136.5V421.2z"/></svg>
                        亞洲</button>
                </h2>

                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion_1">
                    <div class="accordion-body background-w">
                        <p>・ 東亞</p>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="101" >台灣</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >日本</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >韓國</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >北韓</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >中國</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >香港</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >澳門</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >蒙古</a><br>
                        <p>・ 東南亞</p>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="101" >新加坡</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="101" >馬來西亞</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >泰國</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >越南</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >菲律賓</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >柬埔寨</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >寮國</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >緬甸</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >汶萊</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >東帝汶</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >沙巴</a><br>
                        <p>・ 南亞</p>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="101" >馬爾地夫</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="101" >印度</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="101" >斯里蘭卡</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >尼泊爾</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >不丹</a><br>
                        <p>・ 西亞</p>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="101" >杜拜</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="101" >土耳其</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >俄羅斯</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >烏克蘭</a><br>
                    </div>
                </div>
            </div>
        <!-- *******************************************國家：歐洲******************************************************* -->
            <div class="accordion-item">
                <h2 class="mb-0">
                    <button class="btn collapsed" type="button" data-toggle="collapse"
                        data-target="#collapseTwo" aria-expanded="false"
                        aria-controls="collapseTwo" style="font-size: 35px;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" style="width:30px;height:30px;"><!--! Font Awesome Pro 6.2.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M565.6 36.24C572.1 40.72 576 48.11 576 56V392C576 401.1 569.8 410.9 560.5 414.4L392.5 478.4C387.4 480.4 381.7 480.5 376.4 478.8L192.5 417.5L32.54 478.4C25.17 481.2 16.88 480.2 10.38 475.8C3.882 471.3 0 463.9 0 456V120C0 110 6.15 101.1 15.46 97.57L183.5 33.57C188.6 31.6 194.3 31.48 199.6 33.23L383.5 94.52L543.5 33.57C550.8 30.76 559.1 31.76 565.6 36.24H565.6zM48 421.2L168 375.5V90.83L48 136.5V421.2zM360 137.3L216 89.3V374.7L360 422.7V137.3zM408 421.2L528 375.5V90.83L408 136.5V421.2z"/></svg>
                        歐洲</button>
                </h2>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion_1">
                    <div class="accordion-body background-w">
                        <p>・ 西歐</p>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="101" >英國</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >荷蘭</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >愛爾蘭</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >比利時</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="101" >盧森堡</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="101" >摩納哥</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >德國</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >瑞士</a><br>
                        <p>・ 北歐</p>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >挪威</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >瑞典</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >丹麥</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >芬蘭</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >冰島</a><br>
                        <p>・ 南歐</p>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="101" >法國</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="101" >義大利</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >葡萄雅</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >西班牙</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >希臘</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >賽普勒斯</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >馬爾他</a><br>
                    	<p>・ 東歐</p>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="101" >羅馬尼亞</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="101" >匈牙利</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >捷克</a><br>
                        <a style="visibility:hidden;">這裡是空格</a><a class="country" name="102" >波蘭</a><br>
                    </div>
                </div>
            </div>
        <!-- *******************************************國家：北美洲******************************************************* -->
            <div class="accordion-item">
                <h2 class="mb-0">
                    <button class="btn collapsed" type="button" data-toggle="collapse"
                        data-target="#collapseThree" aria-expanded="false"
                        aria-controls="collapseThree" style="font-size: 35px;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" style="width:30px;height:30px;"><!--! Font Awesome Pro 6.2.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M565.6 36.24C572.1 40.72 576 48.11 576 56V392C576 401.1 569.8 410.9 560.5 414.4L392.5 478.4C387.4 480.4 381.7 480.5 376.4 478.8L192.5 417.5L32.54 478.4C25.17 481.2 16.88 480.2 10.38 475.8C3.882 471.3 0 463.9 0 456V120C0 110 6.15 101.1 15.46 97.57L183.5 33.57C188.6 31.6 194.3 31.48 199.6 33.23L383.5 94.52L543.5 33.57C550.8 30.76 559.1 31.76 565.6 36.24H565.6zM48 421.2L168 375.5V90.83L48 136.5V421.2zM360 137.3L216 89.3V374.7L360 422.7V137.3zM408 421.2L528 375.5V90.83L408 136.5V421.2z"/></svg>
                        北美洲</button>
                </h2>

                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion_1">
                    <div class="accordion-body background-w">
                    
                    </div>
                </div>
            </div> 
        <!-- *******************************************國家：南美洲******************************************************* -->
            <div class="accordion-item">
                <h2 class="mb-0">
                    <button class="btn collapsed" type="button" data-toggle="collapse"
                        data-target="#collapseFour" aria-expanded="false"
                        aria-controls="collapseFour" style="font-size: 35px;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" style="width:30px;height:30px;"><!--! Font Awesome Pro 6.2.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M565.6 36.24C572.1 40.72 576 48.11 576 56V392C576 401.1 569.8 410.9 560.5 414.4L392.5 478.4C387.4 480.4 381.7 480.5 376.4 478.8L192.5 417.5L32.54 478.4C25.17 481.2 16.88 480.2 10.38 475.8C3.882 471.3 0 463.9 0 456V120C0 110 6.15 101.1 15.46 97.57L183.5 33.57C188.6 31.6 194.3 31.48 199.6 33.23L383.5 94.52L543.5 33.57C550.8 30.76 559.1 31.76 565.6 36.24H565.6zM48 421.2L168 375.5V90.83L48 136.5V421.2zM360 137.3L216 89.3V374.7L360 422.7V137.3zM408 421.2L528 375.5V90.83L408 136.5V421.2z"/></svg>
                        南美洲</button>
                </h2>

                <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion_1">
                    <div class="accordion-body background-w">
                        
                    </div>
                </div>
            </div> 
        
        <!-- *******************************************國家：大洋洲******************************************************* -->
            <div class="accordion-item">
                <h2 class="mb-0">
                    <button class="btn collapsed" type="button" data-toggle="collapse"
                        data-target="#collapseFive" aria-expanded="false"
                        aria-controls="collapseFive" style="font-size: 35px;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" style="width:30px;height:30px;"><!--! Font Awesome Pro 6.2.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M565.6 36.24C572.1 40.72 576 48.11 576 56V392C576 401.1 569.8 410.9 560.5 414.4L392.5 478.4C387.4 480.4 381.7 480.5 376.4 478.8L192.5 417.5L32.54 478.4C25.17 481.2 16.88 480.2 10.38 475.8C3.882 471.3 0 463.9 0 456V120C0 110 6.15 101.1 15.46 97.57L183.5 33.57C188.6 31.6 194.3 31.48 199.6 33.23L383.5 94.52L543.5 33.57C550.8 30.76 559.1 31.76 565.6 36.24H565.6zM48 421.2L168 375.5V90.83L48 136.5V421.2zM360 137.3L216 89.3V374.7L360 422.7V137.3zM408 421.2L528 375.5V90.83L408 136.5V421.2z"/></svg>
                        大洋洲</button>
                </h2>

                <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordion_1">
                    <div class="accordion-body background-w">
                        
                    </div>
                </div>
            </div> 
      
        <!-- *******************************************國家：非洲******************************************************* -->
            <div class="accordion-item">
                <h2 class="mb-0">
                    <button class="btn collapsed" type="button" data-toggle="collapse"
                        data-target="#collapseSix" aria-expanded="false"
                        aria-controls="collapseSix" style="font-size: 35px;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" style="width:30px;height:30px;"><!--! Font Awesome Pro 6.2.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M565.6 36.24C572.1 40.72 576 48.11 576 56V392C576 401.1 569.8 410.9 560.5 414.4L392.5 478.4C387.4 480.4 381.7 480.5 376.4 478.8L192.5 417.5L32.54 478.4C25.17 481.2 16.88 480.2 10.38 475.8C3.882 471.3 0 463.9 0 456V120C0 110 6.15 101.1 15.46 97.57L183.5 33.57C188.6 31.6 194.3 31.48 199.6 33.23L383.5 94.52L543.5 33.57C550.8 30.76 559.1 31.76 565.6 36.24H565.6zM48 421.2L168 375.5V90.83L48 136.5V421.2zM360 137.3L216 89.3V374.7L360 422.7V137.3zM408 421.2L528 375.5V90.83L408 136.5V421.2z"/></svg>
                        非洲</button>
                </h2>

                <div id="collapseSix" class="collapse" aria-labelledby="headingSix" data-parent="#accordion_1">
                    <div class="accordion-body background-w">
                        
                    </div>
                </div>
            </div> 
        <!-- *******************************************國家：南極洲******************************************************* -->
            <div class="accordion-item">
                <h2 class="mb-0">
                    <button class="btn collapsed" type="button" data-toggle="collapse"
                        data-target="#collapseSeven" aria-expanded="false"
                        aria-controls="collapseSeven" style="font-size: 35px;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" style="width:30px;height:30px;"><!--! Font Awesome Pro 6.2.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M565.6 36.24C572.1 40.72 576 48.11 576 56V392C576 401.1 569.8 410.9 560.5 414.4L392.5 478.4C387.4 480.4 381.7 480.5 376.4 478.8L192.5 417.5L32.54 478.4C25.17 481.2 16.88 480.2 10.38 475.8C3.882 471.3 0 463.9 0 456V120C0 110 6.15 101.1 15.46 97.57L183.5 33.57C188.6 31.6 194.3 31.48 199.6 33.23L383.5 94.52L543.5 33.57C550.8 30.76 559.1 31.76 565.6 36.24H565.6zM48 421.2L168 375.5V90.83L48 136.5V421.2zM360 137.3L216 89.3V374.7L360 422.7V137.3zM408 421.2L528 375.5V90.83L408 136.5V421.2z"/></svg>
                        南極洲</button>
                </h2>

                <div id="collapseSeven" class="collapse" aria-labelledby="headingSeven" data-parent="#accordion_1">
                    <div class="accordion-body background-w">
                        
                    </div>
                </div>
            </div> 
        </div>
    </div>
                    </div>
                </div>
        <!-- *******************************///////國家表單 *********************************************************-->
                <div class="content-column w-col w-col-9">
                    <h1 class="white-bg-heading">所有文章</h1>
                    <div class="w-dyn-list">
                        <!--從這底下加-->
<%
				List<Article> list = (List) request.getAttribute("list");
				for (Article bean : list) {
					if(bean.getUserDelete()==1)
						continue;
					if(bean.getManageHidden()==1)
						continue;
					
				%> 
                        <div role="listitem" class="w-dyn-item w-col-12">
                            <div data-w-id="53cc7567-513c-3103-cd72-dfb075f10bef" class="post-wrapper">
                                <div class="post-content">
                                    <div class="w-row">
                                        <div class="w-col w-col-4 w-col-medium-4"><img id="img" src="images/georgia/picture/<%=bean.getPhoto()%>" class="box" style="height:165px;"></div>
                                        <div class="w-col w-col-8 w-col-medium-8"><a
                                                href="/posts/coffee-variety-macchiato-as-organic-ut-variety-caffeine-americano"
                                                class="blog-title-link w-inline-block">
                                                <h1 foo="bar" class="blog-title"><%=bean.getTitle()%></h1>
                                            </a>
                                            <BR></BR>
                                            <a href="/posts/coffee-variety-macchiato-as-organic-ut-variety-caffeine-americano"
                                                class="blog-title-link w-inline-block">
                                                <h1 foo="bar" class="blog-title"><%=bean.getMember().getUsername()%>說：<%=bean.getSubtitle()%></h1>
                                            </a>
                                            <BR></BR>
                                            <div class="details-wrapper">
                                                <div class="post-info bigFont bigFont"><%=bean.getDate()%></div>
                                                <div class="post-info bigFont">|</div><a href="/categories/travel"
                                                    class="post-info bigFont when-link"><%=bean.getCategory().getCountry()%></a>
                                                <div class="post-info bigFont">|</div><a href="/categories/travel"
                                                    class="post-info bigFont when-link"><%=bean.getCategory().getType()%></a>
                                            </div>
                                            <div class="post-summary-wrapper">
                                                <button type="button" name="toShow" value="<%=bean.getPostID()%>" class="btn btn-light readClass" style="float:right;" data-bs-toggle="modal" data-bs-target="#exampleModal">Read More...</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
<%}%>
      </div>
                            </div>
                        </div>



<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="detailTitle"></h3>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <div id="hiddenValue">
      </div>
		<div id="detailContent">
		</div>
		<div id="detailReply" style="background-color: rgb(240, 240, 240);">
     	 </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
                        
                        
                        
                        
                        
                        
				<%@ include file="/WEB-INF/includes/coco/attraction/Footer.jsp"%>
				<%@ include file="/WEB-INF/includes/coco/attraction/AttractionsDescriptionJS.jsp"%>

<svg type="button" id="BackTop" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-circle-fill jiantou" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 0 0 8a8 8 0 0 0 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
</svg>
<svg type="button" id="ToBottom" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-circle-fill jiantou" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z"/>
</svg>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
<script type="text/javascript">
		$(function(){
			
			var post_id=0;
			$('#BackTop').click(function(){ 
				$('html,body').animate({scrollTop:0},10);
			});
			$('#ToBottom').click(function(){ 
				$('html,body').animate({scrollTop:document.body.scrollHeight}, 10);
			});
			
			$(".country").click(function(){
				let countryNo = $(this).attr("name");
				console.log(countryNo);
				let form=$(document.createElement('form')).css({display:'none'}).attr("method","POST").attr("action","article.country");
				  let eleFileName=$(document.createElement('input')).attr('name','countryID').val(countryNo);
				  form.append(eleFileName);
				  $("body").append(form);
				  form.submit();
			});
		
			
			$(".readClass").click(function(){
				let postID=$(this).val();
				console.log(postID);
				$.getJSON({
                    type: "GET",
                    url: "/article.fake.detail",
                    async: "true",
                    data: "postID=" + postID,
                    success: function (data) {
                        console.log("讀取成功");
                        post_id=data.postID;
                        //
                        $('#detailTitle').html(data.title);
                        $('#detailContent').html(data.content);
                        /*$('#hiddenValue').append(
           	                 $('<tr/>')
           	                     .append(
           	                         $('<td/>')
           	                             .append(
           	                                 $('<input/>')
           	                                     .attr('type', 'hidden')
           	                                     .attr('value', data.postID)
           	                                     .attr('id', 'postID')
           	                             )
           	                     )
           	             );*/
                        
                    }, error: function (data) {
                        console.log("讀取失敗");
                    }
                });
				$.getJSON({
                    type: "GET",
                    url: "/article.comment",
                    async: "true",
                    data: "postID=" + postID,
                    success: function (data) {
                        console.log("讀取成功");
                        detailComment(data);
                        
                    }, error: function (data) {
                        console.log("讀取失敗");
                    }
                });
				
			})
			
			$(document).on("click",".btn_comment_overview_l",function(){
				let comment = $(this).closest('td').prev().find('#comment').val();
				console.log("OL"+comment);
				//var postID=$('#postID').val();
				
				$.ajax({
				      type: "POST",
				      url: "/article.commentinsert",
				      data: "postID=" + post_id+"&comment="+comment,
				      async: "false",//等他回來
				      success: function (resopnse, status, xhr) {
				        console.log("連線成功");
				        console.log(xhr.status);
				        console.log(xhr.readyState);
				        //判斷新增是否成功
				        if (xhr.readyState == 4 && xhr.status == 200) {
				          if (xhr.responseText == "ok") {
				            console.log("新增成功!");
				            $.getJSON({
			                    type: "GET",
			                    url: "/article.comment",
			                    async: "true",
			                    data: "postID=" + post_id,
			                    success: function (data) {
			                        console.log("讀取成功");
			                        //清空商品列表
			                        detailComment(data);
			                    }, error: function (data) {
			                        console.log("讀取失敗");
			                    }
			                });
				          } else {
				            console.log("新增分類失敗!");
				          }
				        }
				      }
				    })
			})
			
			
		})
			function detailComment(data) {
			    console.log('123');
			    $("#detailReply").empty();
			    let floor=0;
			    $.each(data, function (index, value) {
			    	floor++;
	    		 $('#detailReply').append(
	                 $('<tr/>')
	                     .append(
	                         $('<td/>')
	                             .append(
	                                 $('<img/>')
	                                     .attr('src', value.member.photo)
	                                     .css("height", '100px')
	                                     .css("width", '100px')
	                             )
	                     )
	                     .append(
	                         $('<td/>').addClass('edit_td')
	                             .text(floor+'樓的 '+value.member.username+'說：'+value.comment)
	                     )
	                     .append(
	                         $('<td/>')
	                             
	                     )
	             )
        });
	    $('#detailReply').append(
                $('<tr/>')
                    .append(
                        $('<td/>')
                            .append(
                                $('<img/>')
                                    .attr('src', 'images/georgia/picture/留言.png')
                                    .css("height", '100px')
                                    .css("width", '100px')
                            )
                    )
                    .append(
                        $('<td/>').addClass('edit_td')
                            .append(
                                $('<input/>')
                                    .attr('type', 'text')
                                    .attr('id', 'comment')
                            )
                    )
                    .append(
                        $('<td/>')
                            .append(
                                $('<input/>').addClass("btn_comment_overview_l")
                                    .attr('type', 'button')
                                    .attr('value', '送出')
                                    .attr('id', 'commentNew')
                                    
                            )
                    )
            );
	} 

		

</script>
</body>

</html>