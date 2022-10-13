<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChiTou-景點門票-飯店訂單資料</title>
	<%@ include file="/WEB-INF/includes/weihan/orders/HotelsOrdersCSS.jsp"%>

</head>
<body>
	<%@ include file="/WEB-INF/includes/coco/attraction/Header.jsp"%>
<br>
    <br>
    <br>
    <br>
     <div itemscope itemtype="http://schema.org/WebPage" class="resp-section" id="main-content">
        <main class="inner-section">
            <div id="content-wrapper" class="">
                <div id="headline" class="resp-row ph-default-cont pv-base pv-none--xs">
                    <h2 class="hidden--xs hidden--s-m mt-small">${hotel.name}</h2>
                </div>
                <div id="aside-col">
                    <div class="common-error-message-container hidden--ml hidden--l-xl"></div>
                    <div id="booking-summary-and-discounts-cont"
                        class="module bgc-hds-white br-spider bd-rad-none--xs bw-ant bdwh-none--xs bs-solid bc-hds-arch-5 mt-mouse mt-none--ml-xl"  style="margin-top:12px">
                        <div id="booking-summary">
                            <div id="booking-details-wrapper" class="p-spider pa-none--xs">
                                <div id="booking-details"
                                    class="pv-mouse ph-spider fs-base bgc-hds-canvas-3 bdra-big bd-rad-none--xs">
                                    <div id="booking-details-hotel-details"
                                        class="clearfix large-hotel-image with-carousel ">
                                        <div id="property-images-carousel"
                                            class="property-images-carousel widget-carousel di-t w-full mb-mouse bw-bee bs-solid bc-hds-colour-white">
                                            <div class="cont-bd widget-carousel-enabled">
                                                <ul role="listbox">
                                                    <li role="option"
                                                        style="background-image: url('https://exp.cdn-hotels.com/hotels/10000000/9340000/9338900/9338802/55a69f7f_z.jpg?impolicy=fcrop&w=702&h=468&q=high');">
                                                    </li>
                                                    <li role="option"
                                                        style="background-image: url('https://exp.cdn-hotels.com/hotels/10000000/9340000/9338900/9338802/62af0104_z.jpg?impolicy=fcrop&w=702&h=468&q=high');">
                                                    </li>
                                                    <li role="option"
                                                        style="background-image: url('https://exp.cdn-hotels.com/hotels/10000000/9340000/9338900/9338802/731de6c9_z.jpg?impolicy=fcrop&w=702&h=468&q=high');">
                                                    </li>
                                                    <li role="option"
                                                        style="background-image: url('https://exp.cdn-hotels.com/hotels/10000000/9340000/9338900/9338802/856dc31b_z.jpg?impolicy=fcrop&w=702&h=468&q=high');">
                                                    </li>
                                                    <li role="option"
                                                        style="background-image: url('https://exp.cdn-hotels.com/hotels/10000000/9340000/9338900/9338802/8201a982_z.jpg?impolicy=fcrop&w=702&h=468&q=high');">
                                                    </li>
                                                </ul>
                                            </div>
                    
                                        </div>
                                        <div id="hotel-info">
                                            <h3 class="ma-none "><span class="hotel-name">${hotel.name}</span></h3>
                                            <p class="hotel-address">${hotel.address}</p>
                                        </div>
                                    </div>
                                    <div class="guest-rating ta-l mt-mouse highlighted very_good">
                                        <div class="rating-score di-ib">
                                            <div
                                                class="rating-score-icon di-ib fw-bold fs-cat c-hds-Grey-1 p-bee mr-spider bgc-hds-white bdra-big bs-solid bw-ant bdc-default">
                                                8.2</div>
                                            <div class="rating-score-wording di-ib fs-bunny fw-bold c-hds-Grey-1">
                                                非常好
                                            </div>
                                        </div>
                                        <p class="c-note fs-mouse mt-spider"><span class="c-brand fw-bold di-ib"><img
                                                    class="brand-logo" src="images/logo3.png" alt=""
                                                    aria-hidden="true" /><img class="brand-logo" src="images/logo2.png"
                                                    alt="" aria-hidden="true" /></span> 202 則旅客評語</p>
                                    </div>
                                    <div id="top-rated-inline-message"
                                        class="ai-center di-flex fs-bee jc-start c-hds-Green-2 mt-mouse"><img
                                            src="https://a.cdn-hotels.com/uswest2/da/assets/s/63.0.11045/images/common/pages/pda/rosette.svg"
                                            alt="" height="22" />
                                        <div class="top-rated-text ml-spider">人氣：<em
                                                class="fs-spider fw-bold">8.8/10</em></div>
                                    </div>
                                    <div class="price-change-message-placeholder mt-mouse"></div>
                                    <div
                                        class="booking-details-travel-details-wrapper fs-base clear bg-white mb-none--xs bd-all bdra-big mt-mouse">
                                        <table class="travel-details w-full table-bc-s ph-base mt-mouse mb-tiny">
                                            <tr>
                                                <td class="col-description va-t pv-tiny">入住</td>
                                                <td class="col-value va-t ta-r pv-tiny travel-dates-check-in fw-bold">
                                                    ${checkInDate}</td>
                                            </tr>
                                            <tr>
                                                <td class="col-description va-t pv-tiny">退房</td>
                                                <td class="col-value va-t ta-r pv-tiny travel-dates-check-out fw-bold">
                                                    ${checkOutDate}</td>
                                            </tr>
                                            <tr class="merged ">
                                                <td colspan="2" class="col-merged va-t pv-tiny"><span
                                                        class="booking-details-nights-to-stay fl-r mb-bee pv-bee ph-spider br-spider bs-solid bw-ant bdc-discount">1
                                                        晚, 1 間客房</span></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div id="vipvap-placeholder"></div>
                            <div id="financial-details-wrapper">
                                <div
                                    class="mt-spider mt-none--xs ph-bird pv-mouse fw-bold fs-bird ta-c c-hds-white bgc-hds-arch-3 hidden--s-xl">
                                    摘要</div>
                                <section id="financial-details" class="c-hds-arch-1 pb-bird">
                                    <div class="room-summary pv-bunny ph-bird fs-mouse-compact clearfix">
                                        <p class="room-type-name"><span class="fw-bold mr-spider">${style.name}</span>
                                        </p>
                                    </div>
                                    <hr class="mh-bird">
                                    <div class="price-breakdown pv-bunny">
                                        <div class="room-financial-info clearfix ph-bird ">
                                            <div class="nightly-breakdown-wrapper ">
                                                <div class="nightly-breakdown fs-mouse">
                                                    <div
                                                        class="description-value-row clearfix  hidden-in-points-payment">
                                                        <div class="col-value ws-nw va-t ta-r float-r ml-mouse">
                                                            NT$${style.price}</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="total-price" class="bgc-hds-canvas-3 bwt-ant bs-solid bc-hds-arch-5">
                                        <div id="financial-details-drr"
                                            class="description-value-row clearfix p-bird fs-mouse ">
                                            <div class="col-value ws-nw va-t ta-r float-r ml-mouse td-lt"
                                                id="financial-details-pre-deal-price"></div>
                                        </div>
                                        <hr class="mh-bird hidden-in-points-payment">
                                        <div class="p-bird clearfix hidden-in-points-payment">
                                            <div id="financial-details-total-price-container"
                                                class="description-value-row clearfix fs-bunny total-price hidden-in-points-payment">
                                                <div class="col-value ws-nw va-t ta-r float-r ml-mouse fw-bold va-m"
                                                    id="financial-details-total-price">NT$${style.price}</div>
                                                <div
                                                    class="col-description va-t hidden-in-points-payment va-m fs-mouse">
                                                    <strong>總價</strong>
                                                </div>
                                            </div>
                                            <div
                                                class="w-full  ta-r fs-bee fw-bold c-hds-arch-1 mt-bee float-r hidden-in-points-payment">
                                                1 房，${number} 人</div>
                                            <div
                                                class="financial-details-includes-text ta-r fs-bee fw-normal c-hds-arch-3 mt-bee hidden-in-points-payment">
                                                <span class="di-ib vat-message">含稅金和服務費</span>
                                            </div>
                                        </div>
                                    </div>

                                    <hr />
                                    <div id="pre-pay-notice"
                                        class="description-value-row ph-bird c-note fs-bee mt-spider ta-c">
                                        我們會在今天確認您的預訂並收取費用。</div>
                                </section>
                            </div>
                        </div>

                        <div id="aside-progress-overlay" class="bdra-big bd-rad-none--xs hidden"><em
                                id="aside-progress-message" class="ph-bird fw-bold ta-c"></em></div>
                    </div>

                </div>
                <div id="main-col">
                    <div id="main-box">
                        <div class="common-error-message-container hidden--xs hidden--s-m"></div>



						<!-- 主要的form -->
                        <form id="booking-form" novalidate="true">
                        	<input type="hidden" id="memberID" value="${memberbasicinfo.memberid}">
                        	<input type="hidden" id="checkInDate" value="${checkInDate}">
                        	<input type="hidden" id="checkOutDate" value="${checkOutDate}">
                        	<input type="hidden" id="roomID" value="${room.roomID}">
                        	<input type="hidden" id="numberOfPeople" value="${number}">
                        	<input type="hidden" id="totalAmount" value="${style.price}">
                        	<input type="hidden" id="hotelID" value="${hotel.hotelID}">
                        	<input type="hidden" id="addBed" value="1張標準雙人床">
                        	<input type="hidden" id="hotelName" value="${hotel.name}">
                        	<input type="hidden" id="roomName" value="${style.name}">
                            <div id="contact-details"
                                class="module bgc-hds-white br-spider bd-rad-none--xs bw-ant bdwh-none--xs bs-solid bc-hds-arch-5 mt-mouse mt-bird--xs">
                                <h3 id="contact-details-header"
                                    class="module-header pv-bird ph-mouse ph-bird--m ph-bunny--l bs-solid bwb-ant bc-hds-arch-5 mb-none di-flex ai-center jc-sb">
                                    <span class="title-text"><i class="fa-solid fa-user"></i>
                                        <span class="booking-steps-indicator hidden--xs hidden--s-m">&nbsp;步驟
                                            1：輸入您的個人資料</span></span><button id="accountProfile" type="button" class="cta" tabindex="0">會員資料輸入</button>
                                </h3>
                                <div
                                    class="contact-details-body module-body pt-bird pb-cat ph-mouse ph-bird--m ph-bunny--l">
                                    <p class="identification-warning ">請輸入旅客的英文姓名，必須與護照或其他身分證明文件相同。</p>
                                    <div class="required-fields-label"><span
                                            class="c-hds-brand-1 fs-mouse fw-normal va-t">*</span><span
                                            class="c-note pl-bee">必填欄位</span></div>
                                    <div id="room-details-room-0-name-fields" class="mt-mouse">
                                        <div class="main-guest-name-fields mt-mouse">
                                            <div class="field-container mt-bird"><label
                                                    for="room-details-room-0-first-name" class="fw-bold mb-tiny">姓名<span
                                                        class="c-hds-brand-1 fs-base fw-normal va-t">*</span></label><input
                                                    type="text" id="booker"
                                                    class="replay-reveal" maxlength="25" aria-required="true" /><span
                                                    class="state-indicator validation-state-indicator"></span></div>
                                        </div>
                                    </div>
                                    <div class="field-container mt-mouse"><label for="contact-details-email"
                                            class="fw-bold mb-tiny">電子郵件地址<span
                                                class="c-hds-brand-1 fs-base fw-normal va-t">*</span><br><i
                                                class="field-explanation c-note fw-normal">我們會將確認信寄到這裡</i></label><input
                                            type="email" id="email"
                                            name="email" value=""
                                            autocomplete="section-contact email" class="replay-reveal" maxlength="50"
                                            aria-required="true" /><span
                                            class="state-indicator validation-state-indicator"></span><span
                                            class="state-indicator kickbox-state-indicator"></span></div>
                                    <div class="field-container mt-bird"><label for="contact-details-phone"
                                            class="fw-bold mb-tiny">行動電話<span
                                                class="c-hds-brand-1 fs-base fw-normal va-t">*</span><br><i
                                                class="field-explanation c-note fw-normal">我們只會在緊急情況下才與您聯絡</i></label><input
                                            type="text" id="phone"
                                            name="bookingContact.contactDetails.phoneNumber" value=""
                                            autocomplete="section-contact tel" maxlength="17"
                                            aria-required="true" /><span
                                            class="state-indicator validation-state-indicator"></span></div>
                                    <div id="update-billing-details"></div>

                                </div>
                            </div>
                            <div id="room-details"
                                class="module bgc-hds-white br-spider bd-rad-none--xs bw-ant bdwh-none--xs bs-solid bc-hds-arch-5 mt-mouse mt-bird--xs">
                                <h3 id="room-details-header"
                                    class="module-header pv-bird ph-mouse ph-bird--m ph-bunny--l bs-solid bwb-ant bc-hds-arch-5 mb-none di-flex ai-center jc-sb">
                                    <span class="title-text">


                                        <i class="fa-solid fa-bed"></i><span
                                            class="booking-steps-indicator hidden--xs hidden--s-m">&nbsp;步驟
                                            2：客房資訊</span><span
                                            class="section-header-without-step-indicator di-n">客房資訊</span></span><span></span>
                                </h3>
                                <div
                                    class="room-details-body module-body pt-bird pb-cat ph-mouse ph-bird--m ph-bunny--l">
                                    <div class="property-amenities null">
                                        <h3>住宿設施服務</h3>
                                        <ul class="amenity-list di-flex jc-sb fl-wrap mt-bee">
                                            <li class="amenity-item di-flex pv-bee"><i
                                                    class="fa-solid fa-wifi"></i><span class="fs-bee">免費無線上網</span></li>
                                            <li class="amenity-item di-flex pv-bee"><i class="fa-solid fa-p"></i><span
                                                    class="fs-bee">附停車場</span></li>
                                        </ul>
                                    </div>
                                    <div class="room-details-room mt-bird">
                                        <h3 class="room-description-and-occupancy mb-none"><span
                                                class="property-description">${style.name}</span></h3>
                                        <div
                                            class="msg bdra-big  bdc-default bg-light c-text ph-base pv-small room-amenities-highlight-box fs-mouse mt-spider">
                                            <div class=""><span class=""><i
                                                        class="fa-solid fa-user-tie"></i>客房設施服務：</span> <span
                                                    class="c-hds-success-1"><span><span
                                                            class="amenity  with-small-icon di-ib"><i
                                                                class="fa-solid fa-wifi"></i>免費無線上網</span><span
                                                            class="amenity  with-small-icon di-ib"><i
                                                                class="fa-solid fa-bed"></i>1
                                                            張標準雙人床</span><span class="amenity with-small-icon di-ib"><i
                                                                class="fa-solid fa-ban-smoking"></i>非吸煙房</span></span></span>
                                            </div>
                                        </div>
                                        <div class="widget-toggle room-details-special-requests fs-mouse mt-bunny ">
                                            <div class="widget-toggle-bd">
                                                <div class="room-details-special-requests">
                                                    <p>請列出所需的特別要求，我們會轉達給住宿。我們無法保證一定能滿足您的要求，如果沒有收到回覆，請直接聯絡住宿進行確認。</p>
                                                    <ul></ul>
                                                    <div class="field-container mt-mouse"
                                                        data-for="room-details-room-0-special-request"><label
                                                            for="room-details-room-0-special-request"
                                                            class="fw-bold mb-tiny offscreen">特殊需求</label><textarea
                                                            id="room-details-room-0-special-request"
                                                            name="shoppingCartOrderDetails.travelDetails[0].hotelData.roomDetails[0].roomType.roomOccupations[0].specialRequests"
                                                            maxlength="250" data-error-title="特殊需求"></textarea><span
                                                            class="state-indicator validation-state-indicator"
                                                            data-for="room-details-room-0-special-request"></span></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="room-details-collapsed-placeholder"></div>

                            <div id="hcc-cta-placeholder"></div>

                            <div id="loyalty-rewards-dial-up-create-account-placeholder"></div>

                            <div id="final-review-section"
                                class="module bgc-hds-white br-spider bd-rad-none--xs bw-ant bdwh-none--xs bs-solid bc-hds-arch-5 module-body pt-bird pb-cat ph-mouse ph-bird--m ph-bunny--l mt-mouse mt-bird--xs">
                                <div class="mt-bee">
                                    <div id="final-step-container" class="of-h clear ta-l hidden--xs">
                                        <div class="final-step mt-bird pl-none fs-mouse fw-bold di-ib">就快完成了！這是最後一步。
                                        </div>
                                    </div>
                                </div>
                                <div class="value-proposition-section">
                                    <div id="free-cancellation-reassurance-wrapper"
                                        class="value-proposition-item reassurance-message mt-bird">
                                        <div class="di-ib c-hds-arch-2 fs-base fw-bold">
                                            <i class="fa-solid fa-star"></i> 計劃有變時可全額退款
                                        </div>
                                    </div>
                                </div>
                                <div id="terms-of-booking" class="fs-mouse mt-cat">
                                    <h2 class="fs-bird">訂房條款</h2>


                                    <div id="book-button-area" class="fs-small clearfix">
                                        <div class="book-button-row di-flex jc-end w-full--xs">
                                            <div class="button-container float-r float-none--xs mt-bird"><button
                                                    id="toEC" type="button" class="cta" title="按一下這裡完成購買程序。" tabindex="0"><i
                                                        class="fa-solid fa-check"></i>預訂</button>
                                                <div id="google-pay-button-container"
                                                    aria-controls="book-button-tooltip-container" aria-hidden="true"
                                                    clas="hidden"></div>
                                                <div id="book-button-tooltip-container" class="button-tooltip-container"
                                                    role="alert"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="sing-message-container"></div>

        </main>
    </div>
    	<%@ include file="/WEB-INF/includes/coco/attraction/Footer.jsp"%>
    
      	<%@ include file="/WEB-INF/includes/weihan/orders/HotelsOrdersJS.jsp"%>
  	    <script type="text/javascript" src="/js/weber/ecPay.js"></script>
</body>
</html>