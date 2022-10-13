<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChiTou-景點門票-飯店房型</title>
    
	<%@ include file="/WEB-INF/includes/weihan/style/HotelsStyleCSS.jsp"%>

      

</head>
<body>
	<%@ include file="/WEB-INF/includes/coco/attraction/Header.jsp"%>
<div class="untree_co-section">
    <div class="container">
      <div class="row">
        <div class="col-lg-7">
          <div class="owl-single dots-absolute owl-carousel">
            <img src="/images/weber/hotel/hotelNB${hotel.hotelID}/photo1.jpg" alt="Free HTML Template by Untree.co" class="img-fluid rounded-20" height="300px">
            <img src="/images/weber/hotel/hotelNB${hotel.hotelID}/photo2.jpg" alt="Free HTML Template by Untree.co" class="img-fluid rounded-20" height="300px">
            <img src="/images/weber/hotel/hotelNB${hotel.hotelID}/photo3.jpg" alt="Free HTML Template by Untree.co" class="img-fluid rounded-20" height="300px">
            <img src="/images/weber/hotel/hotelNB${hotel.hotelID}/photo4.jpg" alt="Free HTML Template by Untree.co" class="img-fluid rounded-20" height="300px">
            <img src="/images/weber/hotel/hotelNB${hotel.hotelID}/photo5.jpg" alt="Free HTML Template by Untree.co" class="img-fluid rounded-20" height="300px">
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
	    <form id="searchRoom">
	    <input type="hidden" name="hotelID" value="${hotelID}">
	    入住日期
	    <input type="text" id="date" name="date">
	    <input type="hidden" id="dateStart" name="dateStart" value="${dateStart}">
	    <input type="hidden" id="dateEnd" name="dateEnd" value="${dateEnd}">
	    人數
	    <input type="number" name="number" style="width:50px;" value="${number}">人
	    <button type="button" id="searchButton" class="btn btn-primary text-white py-2 px-2">搜尋房間</button>
	    </form>
	</div>
	
  <div class="row justify-content-center">
    <div class="col-lg-0">
      <h3 class="title">｜房型選擇</h3>
      <div class="custom-block" data-aos="fade-up">
        <div class="custom-accordion" id="accordion_1">

        </div>
      </div> <!-- END .custom-block -->


      <div class="untree_co-section testimonial-section mt-5">
        <div class="container">
          <div class="row justify-content-center">
<!--             <div class="col-lg-7 text-center">  -->
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
                            <img src="images/coco/newhomepage/japan-3.jpg" alt="Image" class="img-fluid">
                          </a>

                          <div class="property-content">
                            <div class="price mb-2"><span>$1,740</span></div>
                            <div>
                              <span class="d-block mb-2 text-black-50"><i class="fa-solid fa-location-dot"></i>
                                320桃園市中壢區民權路398號</span>
                              <span class="city d-block mb-3">古華花園飯店 Hotel Kuva Chateau</span>

                              <div class="specs d-flex mb-4">
                                <span class="d-block d-flex align-items-center me-3">
                                  <i class="fa-solid fa-bed"></i>
                                  <span class="caption">1 bed</span>
                                </span>
                                <span class="d-block d-flex align-items-center">
                                  <i class="fa-solid fa-bath"></i>
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
                            <img src="images/coco/newhomepage/japan-2.jpg"  alt="Image" class="img-fluid">
                          </a>

                          <div class="property-content">
                            <div class="price mb-2"><span>$1,200,0</span></div>
                            <div>
                              <span class="d-block mb-2 text-black-50"><i class="fa-solid fa-location-dot"></i>
                                110台北市信義區忠孝東路五段10號</span>
                              <span class="city d-block mb-3">台北W飯店</span>

                              <div class="specs d-flex mb-4">
                                <span class="d-block d-flex align-items-center me-3">
                                  <i class="fa-solid fa-bed"></i>
                                  <span class="caption">2 beds</span>
                                </span>
                                <span class="d-block d-flex align-items-center">
                                 <i class="fa-solid fa-bath"></i>
                                  <span class="caption">2 baths</span>
                                </span>
                              </div>

                              <a href="" class="btn btn-link py-2 px-3">詳細</a>
                            </div>
                          </div>
                        </div> <!-- .item -->

                        <div class="property-item">

                          <a href="property-single.html" class="img">
                            <img src="images/coco/newhomepage/japan-1.jpg" alt="Image" class="img-fluid">
                          </a>

                          <div class="property-content">
                            <div class="price mb-2"><span>$4,840</span></div>
                            <div>
                              <span class="d-block mb-2 text-black-50"><i class="fa-solid fa-location-dot"></i>
                                880澎湖縣馬公市同和路168號</span>
                              <span class="city d-block mb-3">澎澄飯店 Discovery Hotel</span>

                              <div class="specs d-flex mb-4">
                                <span class="d-block d-flex align-items-center me-3">
                                  <i class="fa-solid fa-bed"></i>
                                  <span class="caption">2 beds</span>
                                </span>
                                <span class="d-block d-flex align-items-center">
                                 <i class="fa-solid fa-bath"></i>
                                  <span class="caption">1 bath</span>
                                </span>
                              </div>

                              <a href="" class="btn btn-link py-2 px-3">詳細</a>
                            </div>
                          </div>
                        </div> <!-- .item -->

                        <div class="property-item">

                          <a href="property-single.html" class="img">
                            <img src="images/coco/newhomepage/japan-1.jpg"  alt="Image" class="img-fluid">
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
                                 <i class="fa-solid fa-bed"></i>
                                  <span class="caption">2 beds</span>
                                </span>
                                <span class="d-block d-flex align-items-center">
                                 <i class="fa-solid fa-bath"></i>
                                  <span class="caption">1 bath</span>
                                </span>
                              </div>

                              <a href="" class="btn btn-link py-2 px-3">詳細</a>
                            </div>
                          </div>
                        </div> <!-- .item -->

                        <div class="property-item">

                          <a href="property-single.html" class="img">
                            <img src="images/coco/newhomepage/japan-2.jpg" alt="Image" class="img-fluid">
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
                                 <i class="fa-solid fa-bed"></i>
                                  <span class="caption">2 beds</span>
                                </span>
                                <span class="d-block d-flex align-items-center">
                                <i class="fa-solid fa-bath"></i>
                                  <span class="caption">2 baths</span>
                                </span>
                              </div>

                              <a href="" class="btn btn-link py-2 px-3">詳細</a>
                            </div>
                          </div>
                        </div> <!-- .item -->

                        <div class="property-item">

                          <a href="property-single.html" class="img">
                            <img src="images/coco/newhomepage/japan-3.jpg"  alt="Image" class="img-fluid">
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
                                  <i class="fa-solid fa-bed"></i>
                                  <span class="caption">2 beds</span>
                                </span>
                                <span class="d-block d-flex align-items-center">
                                 <i class="fa-solid fa-bath"></i>
                                  <span class="caption">2 baths</span>
                                </span>
                              </div>

                              <a href="" class="btn btn-link py-2 px-3">詳細</a>
                            </div>
                          </div>
                        </div> <!-- .item -->

                        <div class="property-item">

                          <a href="property-single.html" class="img">
                            <img  src="images/coco/newhomepage/japan-3.jpg"  alt="Image" class="img-fluid">
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
                                 <i class="fa-solid fa-bed"></i>
                                  <span class="caption">1 bed</span>
                                </span>
                                <span class="d-block d-flex align-items-center">
                               <i class="fa-solid fa-bath"></i>
                                  <span class="caption">1 bath</span>
                                </span>
                              </div>

                              <a href="" class="btn btn-link py-2 px-3">詳細</a>
                            </div>
                          </div>
                        </div> <!-- .item -->

                        <div class="property-item">

                          <a href="property-single.html" class="img">
                            <img src="images/coco/newhomepage/japan-2.jpg"  alt="Image" class="img-fluid">
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
                                  <i class="fa-solid fa-bed"></i>
                                  <span class="caption">2 beds</span>
                                </span>
                                <span class="d-block d-flex align-items-center">
                                  <i class="fa-solid fa-bed"></i>
                                  <span class="caption">1 bath</span>
                                </span>
                              </div>

                              <a href="" class="btn btn-link py-2 px-3">詳細</a>
                            </div>
                          </div>
                        </div> <!-- .item -->

                        <div class="property-item">

                          <a href="property-single.html" class="img">
                            <img src="images/coco/newhomepage/japan-1.jpg" alt="Image" class="img-fluid">
                          </a>

                          <div class="property-content">
                            <div class="price mb-2"><span>$6,141</span></div>
                            <div>
                              <span class="d-block mb-2 text-black-50"><i class="fa-solid fa-location-dot"></i> 481
                                Eighth Avenue,</span>
                              <span class="city d-block mb-3">The New Yorker, A Wyndham Hotel（溫德姆紐約客飯店）</span>

                              <div class="specs d-flex mb-4">
                                <span class="d-block d-flex align-items-center me-3">
                                  <i class="fa-solid fa-bed"></i>
                                  <span class="caption">1 bed</span>
                                </span>
                                <span class="d-block d-flex align-items-center">
                                 <i class="fa-solid fa-bath"></i>
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
      	<%@ include file="/WEB-INF/includes/coco/attraction/Footer.jsp"%>
      	<%@ include file="/WEB-INF/includes/weihan/style/HotelsStyleJS.jsp"%>

<script>
$("#date").daterangepicker({
	<c:if test="${dateStart!=null}">
    "startDate": "${dateStart}",
    </c:if>
    <c:if test="${dateEnd!=null}">
    "endDate": "${dateEnd}",
    </c:if>
    // "minDate": new Date(),
    locale: {
        applyLabel: "確定",
        cancelLabel: "取消",
        fromLabel: "開始日期",
        toLabel: "結束日期",
        daysOfWeek: ["日", "一", "二", "三", "四", "五", "六"],
        monthNames: ["1月", "2月", "3月", "4月", "5月", "6月",
            "7月", "8月", "9月", "10月", "11月", "12月"],
    }
});
<c:if test="${dateStart==null&&dateEnd==null}">
let date = new Date().toISOString().split('T')[0];
$('#dateStart').val(date);
$('#dateEnd').val(date);
</c:if>
</script>

<script type="text/javascript" src="/js/weber/DisplayHotel.js"></script>



  
</body>
</html>