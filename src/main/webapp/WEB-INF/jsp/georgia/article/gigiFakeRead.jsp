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
    
    <%@ include file="/WEB-INF/includes/coco/attraction/AttractionsDescriptionCSS.jsp"%>




	
</head>
<body>
<%@ include file="/WEB-INF/includes/coco/attraction/Header.jsp"%>
    <div class="content-wrapper">
        <div class="w-container">
            <div class="w-row">
                <div class="w-hidden-small w-hidden-tiny w-col w-col-3">
                    <div class="white-wrapper"><img id="img" src="images/georgia/picture/101.jpg" class="box">
                        <p class="site-description">臺灣（俗字寫作台灣；臺灣話：Tâi-oân，臺羅：Tâi-uân；客家話：Thòi-vàn），西方世界亦稱福爾摩沙（葡萄牙語：Formosa），是位於東亞、太平洋西北側的島嶼，地處琉球群島與菲律賓群島之間，西隔臺灣海峽與中國大陸相望，海峽距離約130公里，周圍海域從3點鐘方向以順時鐘排序分別為太平洋（菲律賓海）、巴士海峽、南海、臺灣海峽、東海所環繞，為東亞島弧中一島。</p>
                        <div class="grey-rule"></div>
                        <h2 class="small-heading">照片:<br>台北101大樓</h2>
                    </div>
                </div>
                <div class="content-column w-col w-col-9">
                    <h1 class="white-bg-heading">查詢文章</h1>
                    <div class="w-dyn-list">
                
                        <!--從這底下加-->
<%
				List<Article> list = (List) request.getAttribute("search");
				for (Article bean : list) {
					if(bean.getUserDelete()==1)
						continue;
					if(bean.getManageHidden()==1)
						continue;
					int title=bean.getContent().length();
					
				%> 
                        <div role="listitem" class="w-dyn-item">
                            <div data-w-id="53cc7567-513c-3103-cd72-dfb075f10bef" class="post-wrapper">
                                <div class="post-content">
                                    <div class="w-row">
                                        <div class="w-col w-col-4 w-col-medium-4"><img id="img" src="images/georgia/picture/<%=bean.getPhoto()%>" class="box"></div>
                                        <div class="w-col w-col-8 w-col-medium-8"><a
                                                href=""
                                                class="blog-title-link w-inline-block">
                                                <h1 foo="bar" class="blog-title"><%=bean.getTitle()%></h1>
                                            </a>
                                            <BR></BR>
                                            <a href=""
                                                class="blog-title-link w-inline-block">
                                                <h1 foo="bar" class="blog-title"><%=bean.getSubtitle()%></h1>
                                            </a>
                                            <div class="details-wrapper">
                                                <div class="post-info"><%=bean.getDate()%></div>
                                                <div class="post-info">|</div><a href="/categories/travel"
                                                    class="post-info when-link"><%=bean.getCategory().getType()%></a>
                                            </div>
                                            <div class="post-summary-wrapper"><form action="article.fake.detail" method="post">
                                                <p class="post-summary"><%=(title<20)?bean.getContent().substring(0,title):bean.getContent().substring(0,20)%></p>
                                                <INPUT TYPE="HIDDEN" value=<%=bean.getPostID()%> name="postID">
                                                <input type="submit" name="toShow" value="Read More..." class="btn btn-light">
					</form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
<%}%>

				<%@ include file="/WEB-INF/includes/coco/attraction/Footer.jsp"%>
		<%@ include file="/WEB-INF/includes/coco/attraction/AttractionsDescriptionJS.jsp"%>
</body>

</html>