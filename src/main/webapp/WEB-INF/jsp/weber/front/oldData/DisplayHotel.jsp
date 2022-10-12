<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>飯店房型</title>
	<link rel="stylesheet" href="/css/wei/hotel/bootstrap.min.css">
	<link rel="stylesheet" href="/css/wei/hotel/owl.carousel.min.css">
	<link rel="stylesheet" href="/css/wei/hotel/owl.theme.default.min.css">
	<link rel="stylesheet" href="/css/wei/hotel/jquery.fancybox.min.css">
	<link rel="stylesheet" href="/css/wei/hotel/jquery.fancybox.min.css">
	<link rel="stylesheet" href="/css/wei/hotel/style.css">
	<link rel="stylesheet" href="/css/wei/hotel/flaticon.css">
	<link rel="stylesheet" href="/css/wei/hotel/daterangepicker.css">
	<link rel="stylesheet" href="/css/wei/hotel/aos.css">
	<link rel="stylesheet" href="/css/wei/css/style.css">

	<link rel="stylesheet" href="/css/wei/hotel/feather.css">
	<link rel="stylesheet" href="/css/wei/hotel/themify-icons.css">
	<link rel="stylesheet" href="/css/wei/hotel/vendor.bundle.base.css">
	<link rel="stylesheet" href="/css/wei/hotel/dataTables.bootstrap4.css">
	<link rel="stylesheet" href="/css/wei/css/themify-icons.css">
	
	<link rel="stylesheet" href="/css/wei/hotel/select.dataTables.min.css">
	
		<link rel="stylesheet" href="/css/wei/css/style.css">
		<link rel="stylesheet" href="/css/wei/hotel/kang5.css">

		<link rel="stylesheet" href="/css/wei/css/bootstrap.min.css">
		<link rel="stylesheet" href="/css/wei/css/owl.carousel.min.css">
		<link rel="stylesheet" href="/css/wei/css/owl.theme.default.min.css">
		<link rel="stylesheet" href="/css/wei/css/jquery.fancybox.min.css">
		<link rel="stylesheet" href="/css/wei/css/wei/style.css">
		<link rel="stylesheet" href="/css/wei/css/flaticon.css">
		<link rel="stylesheet" href="/css/wei/css/daterangepicker.css">
		<link rel="stylesheet" href="/css/wei/css/aos.css">
		<link rel="stylesheet" href="/css/wei/css/fonts/style.css">
		<link rel="stylesheet" href="/css/wei/css/kang.css">
		<link rel="stylesheet" href="/css/wei/css/kang1.css">
		<link rel="stylesheet" href="/css/wei/css/kang2.css">
		<link rel="stylesheet" href="/css/wei/css/kang3.css">
		<link rel="stylesheet" href="/css/wei/css/kang6.css">
		
		<link rel="stylesheet" href="/css/wei/css/icomoon/style.css">
		<link rel="stylesheet" href="/css/wei/css/icomoon/flaticon.css">

</head>
<body>
<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
      <a class="navbar-brand brand-logo mr-5" href="index.html"><img src="images/logo3.png" class="mr-2" alt="logo" />
        <img src="images/logo2.png" class="mr-2" alt="logo" /></a>
    </div>
    <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">

      <ul class="navbar-nav mr-lg-2">
        <li class="nav-item nav-search d-none d-lg-block">
          <div class="input-group">
            <div class="input-group-prepend hover-cursor" id="navbar-search-icon">
              <span class="input-group-text" id="search">
                <i class="icon-search"></i>
              </span>
            </div>
            <input type="text" class="form-control" id="navbar-search-input" placeholder="探索全球目的地/活動"
              aria-label="search" aria-describedby="search">


            &emsp;
            <button type="button" class="btn btn-outline-primary btn-sm"><i
                class="fa-solid fa-location-dot"></i>&nbsp;景點門票</button>
            &emsp;&emsp;&emsp;&emsp;

            <button type="button" class="btn btn-outline-primary btn-sm"><i
                class="fa-solid fa-hotel"></i>&nbsp;住宿酒店</button>

            &emsp;&emsp;&emsp;&emsp;

            <button type="button" class="btn btn-outline-primary btn-sm"><i
                class="fa-solid fa-plane"></i>&nbsp;交通機票</button>
            <!-- <button type="button" class="btn btn-outline-light btn-sm"><i
            class="fa-solid fa-plane"></i>&nbsp;交通機票</button> -->
            &emsp;&emsp;&emsp;&emsp;

            <button type="button" class="btn btn-outline-primary btn-sm"><i
                class="fa-solid fa-comment"></i>&nbsp;討論區</button>
            &emsp;&emsp;&emsp;&emsp;

            <div>


            </div>
          </div>

        </li>
      </ul>
      <ul class="navbar-nav navbar-nav-right">
        <li class="nav-item dropdown">
          <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown">
            <i class="fa-solid fa-cart-shopping"></i>
            <span class="count"></span>
          </a>
          <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
            aria-labelledby="notificationDropdown">
            <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
            <a class="dropdown-item preview-item">
              <div class="preview-thumbnail">
                <div class="preview-icon bg-success">
                  <i class="ti-info-alt mx-0"></i>
                </div>
              </div>
              <div class="preview-item-content">
                <h6 class="preview-subject font-weight-normal">Application Error</h6>
                <p class="font-weight-light small-text mb-0 text-muted">
                  Just now
                </p>
              </div>
            </a>
            <a class="dropdown-item preview-item">
              <div class="preview-thumbnail">
                <div class="preview-icon bg-warning">
                  <i class="ti-settings mx-0"></i>
                </div>
              </div>
              <div class="preview-item-content">
                <h6 class="preview-subject font-weight-normal">Settings</h6>
                <p class="font-weight-light small-text mb-0 text-muted">
                  Private message
                </p>
              </div>
            </a>
            </a>
          </div>
        </li>
        <li class="nav-item nav-profile dropdown">
          <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
            <img src="../../images/faces/face28.jpg" alt="profile" />
          </a>
          <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
            <a class="dropdown-item">
              <i class="ti-settings text-primary"></i>
              Settings
            </a>
            <a class="dropdown-item">
              <i class="ti-power-off text-primary"></i>
              Logout
            </a>
          </div>
        </li>
        <li class="nav-item nav-settings d-none d-lg-flex">
          <a class="nav-link" href="#">
            <i class="icon-ellipsis"></i>
          </a>
        </li>
      </ul>
      <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button"
        data-toggle="offcanvas">
        <span class="icon-menu"></span>
      </button>
    </div>
  </nav>



  <div class="untree_co-section">
    <div class="container">
      <div class="row">
        <div class="col-lg-7">
          <div class="owl-single dots-absolute owl-carousel">
            <img src="images/weber/hotel/hotelNB${hotel.hotelID}/photo1.jpg" alt="Free HTML Template by Untree.co" class="img-fluid rounded-20">
            <img src="images/weber/hotel/hotelNB${hotel.hotelID}/photo2.jpg" alt="Free HTML Template by Untree.co" class="img-fluid rounded-20">
            <img src="images/weber/hotel/hotelNB${hotel.hotelID}/photo3.jpg" alt="Free HTML Template by Untree.co" class="img-fluid rounded-20">
            <img src="images/weber/hotel/hotelNB${hotel.hotelID}/photo4.jpg" alt="Free HTML Template by Untree.co" class="img-fluid rounded-20">
            <img src="images/weber/hotel/hotelNB${hotel.hotelID}/photo5.jpg" alt="Free HTML Template by Untree.co" class="img-fluid rounded-20">
          </div>
        </div>
        <div class="col-lg-5 pl-lg-5 ml-auto">
          <br>
          <h2 class="section-title mb-4">${hotel.name}</h2>
          <p>${hotel.intro}</p>
          <ul class="list-unstyled two-col clearfix">
            <li>無障礙設施</li>
            <li>接駁服務（收費）</li>
            <li>全面禁煙</li>
            <li>Cruise Lines</li>
            <li>Hotels</li>
            <li>Railways</li>
            <li>Travel Insurance</li>
            <li>Package Tours</li>
            <li>Insurance</li>
            <li>Guide Books</li>
          </ul>
        </div>
      </div>
    </div>
  </div>

	<div align="center">
	    <form>
	    <input type="hidden" name="hotelID" value="${hotel.hotelID}">
	    入住日期
	    <input type="text" id="date" name="date">
	    <input type="hidden" id="dateStart" name="dateStart">
	    <input type="hidden" id="dateEnd" name="dateEnd">
	    人數
	    <input type="number" name="number" style="width:50px;">人
	    <button type="button" id="searchRoom">搜尋房間</button>
	    </form>
	</div>

  <div class="row justify-content-center">
    <div class="col-lg-0">
      <h3 class="title">｜房型選擇</h3>
      <div class="custom-block" data-aos="fade-up">
        <div class="custom-accordion" id="accordion_1">
          <div class="accordion-item">
            <h2 class="mb-0">
              <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne"
                aria-expanded="true" aria-controls="collapseOne">單日票</button>
            </h2>

            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion_1">
              <div class="accordion-body">
                ・ 費用包含:1張六福村主題遊樂園門票（含動物園）
                <br>
                ・ 費用不包含:交通費、其他個人消費
                <br>
                <div style="float:left;">
                  <h3>&nbsp;&nbsp;NT$ 599</h3>
                </div>
                <a href="#" style="float:right;" class="btn btn-primary text-white py-2 px-2">加入購物車</a>
                <br>
              </div>
            </div>
          </div> <!-- .accordion-item -->

          <div class="accordion-item">
            <h2 class="mb-0">
              <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo"
                aria-expanded="false" aria-controls="collapseTwo">午後票（限13:00後入園）</button>
            </h2>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion_1">
              <div class="accordion-body">
                ・ 費用包含:1張午後門票(含動物園) *限13:00後入園
                <br>
                ・ 費用不包含:交通費、其他個人消費
                <br>
                <div style="float:left;">
                  <h3>&nbsp;&nbsp;NT$ 599</h3>
                </div>
                <a href="#" style="float:right;" class="btn btn-primary text-white py-2 px-2">加入購物車</a>
                <br>
              </div>
            </div>
          </div> <!-- .accordion-item -->
          <div class="accordion-item">
            <h2 class="mb-0">
              <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree"
                aria-expanded="false" aria-controls="collapseThree">雙人單日票＋輕食套餐</button>
            </h2>

            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion_1">
              <div class="accordion-body">
                ・ 費用包含:1張午後門票(含動物園) *限13:00後入園
                <br>
                ・ 費用不包含:交通費、其他個人消費
                <br>
                <div style="float:left;">
                  <h3>&nbsp;&nbsp;NT$ 599</h3>
                </div>
                <a href="#" style="float:right;" class="btn btn-primary text-white py-2 px-2">加入購物車</a>
                <br>
              </div>
            </div>

          </div> <!-- .accordion-item -->

        </div>
      </div> <!-- END .custom-block -->

      <div class="untree_co-section">
        <div class="container">
          <div class="row justify-content-center mb-5">
            <div class="col-md-6 text-center">
              <h2 class="section-title mb-3 text-center">Team</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the
                blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language
                ocean.</p>
            </div>
          </div>

          <div class="row">
            <div class="col-lg-3 mb-4">
              <div class="team">
                <img src="images/person_1.jpg" alt="Image" class="img-fluid mb-4 rounded-20">
                <div class="px-3">
                  <h3 class="mb-0">James Watson</h3>
                  <p>Co-Founder &amp; CEO</p>
                </div>
              </div>
            </div>
            <div class="col-lg-3 mb-4">
              <div class="team">
                <img src="images/person_2.jpg" alt="Image" class="img-fluid mb-4 rounded-20">
                <div class="px-3">
                  <h3 class="mb-0">Carl Anderson</h3>
                  <p>Co-Founder &amp; CEO</p>
                </div>
              </div>
            </div>

            <div class="col-lg-3 mb-4">
              <div class="team">
                <img src="images/person_4.jpg" alt="Image" class="img-fluid mb-4 rounded-20">
                <div class="px-3">
                  <h3 class="mb-0">Michelle Allison</h3>
                  <p>Co-Founder &amp; CEO</p>
                </div>
              </div>
            </div>
            <div class="col-lg-3 mb-4">
              <div class="team">
                <img src="images/person_3.jpg" alt="Image" class="img-fluid mb-4 rounded-20">
                <div class="px-3">
                  <h3 class="mb-0">Drew Wood</h3>
                  <p>Co-Founder &amp; CEO</p>
                </div>
              </div>
            </div>

          </div>

        </div>
      </div>




      <div class="untree_co-section testimonial-section mt-5">
        <div class="container">
          <div class="row justify-content-center">
            <!-- <div class="col-lg-7 text-center">  -->
            <h2 class="section-title text-center mb-5">附近飯店</h2>

            <div class="section">
              <div class="container">
                <div class="row1 mb-5 align-items-center">
                  <div class="col-lg-6">
                  </div>
                </div>

                <div class="row1">
                  <div class="col-12">

                    <div class="property-slider-wrap">



                      <div class="property-slider">

                        <div class="property-item">

                          <a href="property-single.html" class="img">
                            <img src="images/image-1.jpg" alt="Image" class="img-fluid">
                          </a>

                          <div class="property-content">
                            <div class="price mb-2"><span>$1,740</span></div>
                            <div>
                              <span class="d-block mb-2 text-black-50"><i class="fa-solid fa-location-dot"></i>
                                320桃園市中壢區民權路398號</span>
                              <span class="city d-block mb-3">古華花園飯店 Hotel Kuva Chateau</span>

                              <div class="specs d-flex mb-4">
                                <span class="d-block d-flex align-items-center me-3">
                                  <span class="icon-bed me-2"></span>
                                  <span class="caption">1 bed</span>
                                </span>
                                <span class="d-block d-flex align-items-center">
                                  <span class="icon-bath me-2"></span>
                                  <span class="caption">1 bath</span>
                                </span>
                              </div>

                              <a href="" class="btn btn-link py-2 px-3">詳細</a>
                            </div>
                          </div>
                        </div>

                        <!-- .item -->

                        <div class="property-item">

                          <a href="property-single.html" class="img">
                            <img src="images/image-2.jpg" alt="Image" class="img-fluid">
                          </a>

                          <div class="property-content">
                            <div class="price mb-2"><span>$1,200,0</span></div>
                            <div>
                              <span class="d-block mb-2 text-black-50"><i class="fa-solid fa-location-dot"></i>
                                110台北市信義區忠孝東路五段10號</span>
                              <span class="city d-block mb-3">台北W飯店</span>

                              <div class="specs d-flex mb-4">
                                <span class="d-block d-flex align-items-center me-3">
                                  <span class="icon-bed me-2"></span>
                                  <span class="caption">2 beds</span>
                                </span>
                                <span class="d-block d-flex align-items-center">
                                  <span class="icon-bath me-2"></span>
                                  <span class="caption">2 baths</span>
                                </span>
                              </div>

                              <a href="" class="btn btn-link py-2 px-3">詳細</a>
                            </div>
                          </div>
                        </div> <!-- .item -->

                        <div class="property-item">

                          <a href="property-single.html" class="img">
                            <img src="images/image-3.jpg" alt="Image" class="img-fluid">
                          </a>

                          <div class="property-content">
                            <div class="price mb-2"><span>$4,840</span></div>
                            <div>
                              <span class="d-block mb-2 text-black-50"><i class="fa-solid fa-location-dot"></i>
                                880澎湖縣馬公市同和路168號</span>
                              <span class="city d-block mb-3">澎澄飯店 Discovery Hotel</span>

                              <div class="specs d-flex mb-4">
                                <span class="d-block d-flex align-items-center me-3">
                                  <span class="icon-bed me-2"></span>
                                  <span class="caption">2 beds</span>
                                </span>
                                <span class="d-block d-flex align-items-center">
                                  <span class="icon-bath me-2"></span>
                                  <span class="caption">1 bath</span>
                                </span>
                              </div>

                              <a href="" class="btn btn-link py-2 px-3">詳細</a>
                            </div>
                          </div>
                        </div> <!-- .item -->

                        <div class="property-item">

                          <a href="property-single.html" class="img">
                            <img src="images/japan-1.jpg" alt="Image" class="img-fluid">
                          </a>

                          <div class="property-content">
                            <div class="price mb-2"><span>$1,247,5</span></div>
                            <div>
                              <span class="d-block mb-2 text-black-50"><i class="fa-solid fa-location-dot"></i> 2
                                Chome-1-1 Nihonbashimuromachi,
                                Chuo City, Tokyo 103-8328日本</span>
                              <span class="city d-block mb-3">東京文華東方酒店</span>

                              <div class="specs d-flex mb-4">
                                <span class="d-block d-flex align-items-center me-3">
                                  <span class="icon-bed me-2"></span>
                                  <span class="caption">2 beds</span>
                                </span>
                                <span class="d-block d-flex align-items-center">
                                  <span class="icon-bath me-2"></span>
                                  <span class="caption">1 bath</span>
                                </span>
                              </div>

                              <a href="" class="btn btn-link py-2 px-3">詳細</a>
                            </div>
                          </div>
                        </div> <!-- .item -->

                        <div class="property-item">

                          <a href="property-single.html" class="img">
                            <img src="images/japan-2.jpg" alt="Image" class="img-fluid">
                          </a>

                          <div class="property-content">
                            <div class="price mb-2"><span>$1,291,000</span></div>
                            <div>
                              <span class="d-block mb-2 text-black-50"><i class="fa-solid fa-location-dot"></i>
                                163-1055 東京都 新宿區Nishishinjuku
                                3-7-1-2 Nishi Shinjuku</span>
                              <span class="city d-block mb-3">東京凱悅花園酒店</span>

                              <div class="specs d-flex mb-4">
                                <span class="d-block d-flex align-items-center me-3">
                                  <span class="icon-bed me-2"></span>
                                  <span class="caption">2 beds</span>
                                </span>
                                <span class="d-block d-flex align-items-center">
                                  <span class="icon-bath me-2"></span>
                                  <span class="caption">2 baths</span>
                                </span>
                              </div>

                              <a href="" class="btn btn-link py-2 px-3">詳細</a>
                            </div>
                          </div>
                        </div> <!-- .item -->

                        <div class="property-item">

                          <a href="property-single.html" class="img">
                            <img src="images/japan-2.jpg" alt="Image" class="img-fluid">
                          </a>

                          <div class="property-content">
                            <div class="price mb-2"><span>$1,632,4</span></div>
                            <div>
                              <span class="d-block mb-2 text-black-50"><i class="fa-solid fa-location-dot"></i> 1
                                Chome-1-1 Marunouchi, Chiyoda
                                City, Tokyo 100-0005日本</span>
                              <span class="city d-block mb-3"> 東京皇宮酒店</span>

                              <div class="specs d-flex mb-4">
                                <span class="d-block d-flex align-items-center me-3">
                                  <span class="icon-bed me-2"></span>
                                  <span class="caption">2 beds</span>
                                </span>
                                <span class="d-block d-flex align-items-center">
                                  <span class="icon-bath me-2"></span>
                                  <span class="caption">2 baths</span>
                                </span>
                              </div>

                              <a href="" class="btn btn-link py-2 px-3">詳細</a>
                            </div>
                          </div>
                        </div> <!-- .item -->

                        <div class="property-item">

                          <a href="property-single.html" class="img">
                            <img src="images/usa-2.jpg" alt="Image" class="img-fluid">
                          </a>

                          <div class="property-content">
                            <div class="price mb-2"><span>$5,691</span></div>
                            <div>
                              <span class="d-block mb-2 text-black-50"><i class="fa-solid fa-location-dot"></i> 400
                                West 42nd Street, NY
                                10036</span>
                              <span class="city d-block mb-3">Pod Times Square（龐德時代酒店）</span>

                              <div class="specs d-flex mb-4">
                                <span class="d-block d-flex align-items-center me-3">
                                  <span class="icon-bed me-2"></span>
                                  <span class="caption">1 bed</span>
                                </span>
                                <span class="d-block d-flex align-items-center">
                                  <span class="icon-bath me-2"></span>
                                  <span class="caption">1 bath</span>
                                </span>
                              </div>

                              <a href="" class="btn btn-link py-2 px-3">詳細</a>
                            </div>
                          </div>
                        </div> <!-- .item -->

                        <div class="property-item">

                          <a href="property-single.html" class="img">
                            <img src="images/usa-2.jpg" alt="Image" class="img-fluid">
                          </a>

                          <div class="property-content">
                            <div class="price mb-2"><span>$6,590</span></div>
                            <div>
                              <span class="d-block mb-2 text-black-50"><i class="fa-solid fa-location-dot"></i> 140
                                West 28th Street</span>
                              <span class="city d-block mb-3">SpringHill Suites by Marriott New York Manhattan
                                Chelsea</span>

                              <div class="specs d-flex mb-4">
                                <span class="d-block d-flex align-items-center me-3">
                                  <span class="icon-bed me-2"></span>
                                  <span class="caption">2 beds</span>
                                </span>
                                <span class="d-block d-flex align-items-center">
                                  <span class="icon-bath me-2"></span>
                                  <span class="caption">1 bath</span>
                                </span>
                              </div>

                              <a href="" class="btn btn-link py-2 px-3">詳細</a>
                            </div>
                          </div>
                        </div> <!-- .item -->

                        <div class="property-item">

                          <a href="property-single.html" class="img">
                            <img src="images/usa-3.jpg" alt="Image" class="img-fluid">
                          </a>

                          <div class="property-content">
                            <div class="price mb-2"><span>$6,141</span></div>
                            <div>
                              <span class="d-block mb-2 text-black-50"><i class="fa-solid fa-location-dot"></i> 481
                                Eighth Avenue,</span>
                              <span class="city d-block mb-3">The New Yorker, A Wyndham Hotel（溫德姆紐約客飯店）</span>

                              <div class="specs d-flex mb-4">
                                <span class="d-block d-flex align-items-center me-3">
                                  <span class="icon-bed me-2"></span>
                                  <span class="caption">1 bed</span>
                                </span>
                                <span class="d-block d-flex align-items-center">
                                  <span class="icon-bath me-2"></span>
                                  <span class="caption">1 bath</span>
                                </span>
                              </div>

                              <a href="" class="btn btn-link py-2 px-3">詳細</a>
                            </div>
                          </div>
                        </div> <!-- .item -->


                      </div>


                      <div id="property-nav" class="controls" tabindex="0" aria-label="Carousel Navigation">
                        <span class="prev" data-controls="prev" aria-controls="property" tabindex="-1">往前</span>
                        <span class="next" data-controls="next" aria-controls="property" tabindex="-1">往後</span>
                      </div>

                    </div>
                  </div>

                </div>
              </div>
            </div>




          </div>
        </div>
      </div>
    </div>

    <div class="untree_co-section">
      <div class="container">
        <div class="row justify-content-between align-items-center">




        </div>
      </div>
    </div>


  </div>

  <!--footer-->
  <div class="site-footer">
    <div class="inner first">
      <div class="container">
        <div class="row">
          <div class="col-md-6 col-lg-4">
            <div class="widget">
              <h3 class="heading">About ChiTou</h3>
              <p>Far far away, behind the word mountains, far from the
                countries
                Vokalia and Consonantia,
                there live the blind texts.</p>
            </div>
            <div class="widget">
              <ul class="list-unstyled social">
                <li><a href="#"><span class="icon-twitter"></span></a>
                </li>
                <li><a href="#"><span class="icon-instagram"></span></a>
                </li>
                <li><a href="#"><span class="icon-facebook"></span></a>
                </li>
                <li><a href="#"><span class="icon-linkedin"></span></a>
                </li>
                <li><a href="#"><span class="icon-dribbble"></span></a>
                </li>
                <li><a href="#"><span class="icon-pinterest"></span></a>
                </li>
                <li><a href="#"><span class="icon-apple"></span></a>
                </li>
                <li><a href="#"><span class="icon-google"></span></a>
                </li>
              </ul>
            </div>
          </div>
          <div class="col-md-6 col-lg-2 pl-lg-5">
            <div class="widget">
              <h3 class="heading">Pages</h3>
              <ul class="links list-unstyled">
                <li><a href="#">Blog</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-6 col-lg-2">
            <div class="widget">
              <h3 class="heading">Resources</h3>
              <ul class="links list-unstyled">
                <li><a href="#">Blog</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-3 col-sm-5 col-xs-5">
            <h4>付款方式</h4>
            <div class="footer_payment_channels">
              <img src="https://cdn.kkday.com/pc-web/assets/img/footer/payment/visa.svg" alt="visa" />
              <img src="https://cdn.kkday.com/pc-web/assets/img/footer/payment/mastercard.svg" alt="mastercard" />
              <img src="https://cdn.kkday.com/pc-web/assets/img/footer/payment/jcb.svg" alt="jcb" />
              <img src="https://cdn.kkday.com/pc-web/assets/img/footer/payment/jko_pay.svg" alt="jko_pay" />
              <img src="https://cdn.kkday.com/pc-web/assets/img/footer/payment/apple_pay.svg" alt="apple_pay" />
              <img src="https://cdn.kkday.com/pc-web/assets/img/footer/payment/google_pay.svg" alt="google_pay" />
              <img src="https://cdn.kkday.com/pc-web/assets/img/footer/payment/line_pay.svg" alt="line_pay" />
              <img src="https://cdn.kkday.com/pc-web/assets/img/footer/payment/pi_wallet.svg" alt="pi_wallet" />
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>





  </div>
  </div>
  </div>
  </div>
  
  
  <script src="https://kit.fontawesome.com/6c4c414686.js" crossorigin="anonymous"></script>
  
    
  
  
  <script src="/css/wei/js/vendor.bundle.base.js"></script>
  <script src="/css/wei/js/Chart.min.js"></script>
  <script src="/css/wei/js/jquery.dataTables.js"></script>
  <script src="/css/wei/js/dataTables.bootstrap4.js"></script>
  <script src="/css/wei/js/dataTables.select.min.js"></script>
  
  <script src="/css/wei/js/off-canvas.js"></script>
  <script src="/css/wei/js/hoverable-collapse.js"></script>
  <script src="/css/wei/js/template.js"></script>
  <script src="/css/wei/js/settings.js"></script>
  <script src="/css/wei/js/todolist.js"></script>


  <script src="/css/wei/js/dashboard.js"></script>
 
  <script src="/css/wei/js/jquery-3.4.1.min.js"></script>
  <script src="/css/wei/js/popper.min.js"></script>
  <script src="/css/wei/js/bootstrap.min.js"></script>
  <script src="/css/wei/js/owl.carousel.min.js"></script>
  <script src="/css/wei/js/jquery.animateNumber.min.js"></script>
  <script src="/css/wei/js/jquery.waypoints.min.js"></script>
  <script src="/css/wei/js/jquery.fancybox.min.js"></script>
  <script src="/css/wei/js/aos.js"></script>
  <script src="/css/wei/js/moment.min.js"></script>
  <script src="/css/wei/js/daterangepicker.js"></script>

  <script src="/css/wei/js/typed.js"></script>

  <script src="/css/wei/js/bootstrap.bundle.min.js"></script>
  <script src="/css/wei/js/tiny-slider.js"></script>
  <script src="/css/wei/js/style/aos.js"></script>
  <script src="/css/wei/js/navbar.js"></script>
  <script src="/css/wei/js/counter.js"></script>
  <script src="/css/wei/js/custom.js"></script>
  <script src="/css/wei/js/style/custom.js"></script>


  <script src="css/kang/js/bootstrap.bundle.min.js"></script>
  <script src="css/kang/js/tiny-slider.js"></script>
  <script src="css/kang/js/aos.js"></script>
  <script src="css/kang/js/navbar.js"></script>
  <script src="css/kang/js/counter.js"></script>
  <script src="css/kang/js/custom.js"></script>
  <script src="js/custom.js"></script>
<script type="text/javascript" src="/js/weber/DisplayHotel.js"></script>
	
</body>
</html>