<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="tw.georgia.article.model.* , java.util.*, java.sql.*, javax.servlet.* , javax.naming.*, java.sql.*, javax.sql.*"%> 
    
    <%
Article tt=(Article)request.getAttribute("findByID");
%>
<!DOCTYPE html><!-- This site was created in Webflow. https://www.webflow.com -->
<!-- Last Published: Thu Nov 12 2020 22:33:24 GMT+0000 (Coordinated Universal Time) -->
<html data-wf-domain="denali-template.webflow.io" data-wf-page="5e4b1a54e48aed23c21ff22d"
    data-wf-site="5e4b1a54e48aed761d1ff229" data-wf-status="1">

<head>
    <meta charset="utf-8" />
    <title><%=tt.getTitle() %> | Blog</title>
    <meta
        content="Single shot cultivar beans as chicory caffeine. Medium brewed, milk extra that froth pumpkin spice mocha. Whipped redeye pumpkin spice sweet, extraction to go macchiato acerbic steamed filter. Robusta grounds decaffeinated."
        name="description" />
    <meta content="According a funnily until pre-set or arrogant well cheerful" property="og:title" />
    <meta
        content="Single shot cultivar beans as chicory caffeine. Medium brewed, milk extra that froth pumpkin spice mocha. Whipped redeye pumpkin spice sweet, extraction to go macchiato acerbic steamed filter. Robusta grounds decaffeinated."
        property="og:description" />
    <meta
        content="https://assets.website-files.com/5e4b1a54e48aed65701ff226/5e4b1a54e48aedf5821ff248_photo-1416934625760-d56f5e79f6fe.jpg"
        property="og:image" />
    <meta content="According a funnily until pre-set or arrogant well cheerful" property="twitter:title" />
    <meta
        content="Single shot cultivar beans as chicory caffeine. Medium brewed, milk extra that froth pumpkin spice mocha. Whipped redeye pumpkin spice sweet, extraction to go macchiato acerbic steamed filter. Robusta grounds decaffeinated."
        property="twitter:description" />
    <meta
        content="https://assets.website-files.com/5e4b1a54e48aed65701ff226/5e4b1a54e48aedf5821ff248_photo-1416934625760-d56f5e79f6fe.jpg"
        property="twitter:image" />
    <meta property="og:type" content="website" />
    <meta content="summary_large_image" name="twitter:card" />
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="Webflow" name="generator" />
    <link href="https://assets.website-files.com/5e4b1a54e48aed761d1ff229/css/denali-template.webflow.170e98de3.css"
        rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>
    <script
        type="text/javascript">WebFont.load({ google: { families: ["Lato:100,100italic,300,300italic,400,400italic,700,700italic,900,900italic"] } });</script>
    <!--[if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js" type="text/javascript"></script><![endif]-->
    <script
        type="text/javascript">!function (o, c) { var n = c.documentElement, t = " w-mod-"; n.className += t + "js", ("ontouchstart" in o || o.DocumentTouch && c instanceof DocumentTouch) && (n.className += t + "touch") }(window, document);</script>
    <link href="https://assets.website-files.com/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="https://assets.website-files.com/img/webclip.png" rel="apple-touch-icon" />
</head>

<body>

    <div class="content-wrapper">
        <div class="w-container">
            <div class="w-row">

                <div class="content-column w-col w-col-11">
                    <div class="post-wrapper">

                        <div class="post-content">
                            <h1><%=tt.getTitle() %></h1>
                            <div class="details-wrapper">
                                <div class="post-info"><%=tt.getDate() %></div>
                                <div class="post-info">|</div><a href="/categories/music"
                                    class="post-info when-link"><%=tt.getCategory().getType() %></a>
                            </div>
                            <div class="grey-rule"></div>
                            <div class="body-copy w-richtext">
								<%=tt.getContent() %>
                            </div>
                        </div>
                    </div>
                    <div class="button-wrapper"><input TYPE="Button" value="← All posts" name="goBack" class="button w-button" onclick="back()"></div>
                    <div class="sidebar-on-mobile">
                        <div class="white-wrapper"><img
                                src="https://assets.website-files.com/5e4b1a54e48aed761d1ff229/5e4b1a54e48aed65841ff2a5_photo-1443180236447-432ea00e6ead.jpg"
                                alt="" class="circle-profile" />
                            <p class="site-description">Denali is a simple responsive blog template. Easily add new
                                posts using the Editor or change layout and design using the Designer.</p>
                            <div class="grey-rule"></div>
                            <h2 class="small-heading">Featured Posts:</h2>
                            <div class="feature-posts-list w-dyn-list">
                                <div role="list" class="w-dyn-items">
                                    <div role="listitem" class="w-dyn-item"><a
                                            href="/posts/half-and-half-variety-milk-viennese-body-cappuccino"
                                            aria-current="page" class="small-post-link w--current">According a funnily
                                            until pre-set or arrogant well cheerful</a></div>
                                    <div role="listitem" class="w-dyn-item"><a
                                            href="/posts/steamed-siphon-froth-mazagran-cafe-au-lait"
                                            class="small-post-link">Overlaid the jeepers uselessly much excluding</a>
                                    </div>
                                </div>
                            </div>
                            <div class="grey-rule"></div>
                            <div class="social-link-group"><a href="#" class="social-icon-link w-inline-block"><img
                                        src="https://assets.website-files.com/5e4b1a54e48aed761d1ff229/5e4b1a54e48aed39811ff2c6_social-03.svg"
                                        width="25" alt="" /></a><a href="#" class="social-icon-link w-inline-block"><img
                                        src="https://assets.website-files.com/5e4b1a54e48aed761d1ff229/5e4b1a54e48aed1ad11ff2da_social-07.svg"
                                        width="25" alt="" /></a><a href="#" class="social-icon-link w-inline-block"><img
                                        src="https://assets.website-files.com/5e4b1a54e48aed761d1ff229/5e4b1a54e48aed1f5b1ff2bf_social-18.svg"
                                        width="25" alt="" /></a><a href="#" class="social-icon-link w-inline-block"><img
                                        src="https://assets.website-files.com/5e4b1a54e48aed761d1ff229/5e4b1a54e48aed7e751ff288_social-09.svg"
                                        width="25" alt="" /></a></div>
                            <p class="built-with-webflow">Built with <a target="_blank" href="https://webflow.com"
                                    class="webflow-link">Webflow</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=5e4b1a54e48aed761d1ff229"
        type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
    <script src="https://assets.website-files.com/5e4b1a54e48aed761d1ff229/js/webflow.bf6a5095c.js"
        type="text/javascript"></script>
    <!--[if lte IE 9]><script src="//cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->
<script type="text/javascript">
function back(){
	history.go(-2);}
</script>
</body>

</html>