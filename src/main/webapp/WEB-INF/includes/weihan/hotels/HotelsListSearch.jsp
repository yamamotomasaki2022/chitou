<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <section class="section pb-0 ">
                        <div class="container">

                            <div class="row check-availabilty" id="next">
                                <div class="block-32" data-aos="fade-up" data-aos-offset="-200">

                                    <form id="searchHotel">
                                        <div class="row">
	                                            <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
	                                                <label for="checkin_date"
	                                                    class="font-weight-bold text-black">入住日期</label>
	                                                <div class="field-icon-wrap">
	                                                    <div class="icon"><i class="fa-solid fa-calendar-days"></i></div>
	                                                    <input type="text" name="dateStart" id="checkin_date" class="form-control">
	                                                </div>
	                                            </div>
	                                            <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
	                                                <label for="checkout_date"
	                                                    class="font-weight-bold text-black">退住日期</label>
	                                                <div class="field-icon-wrap">
	                                                    <div class="icon"><i class="fa-solid fa-calendar-days"></i></div>
	                                                    <input type="text" name="dateEnd" id="checkout_date" class="form-control">
	                                                </div>
	                                            </div>
                                            <div class="col-md-6 mb-3 mb-md-0 col-lg-3">
                                                <div class="row">
                                                    <div class="col-md-6 mb-3 mb-md-0">
                                                        <label for="adults"
                                                            class="font-weight-bold text-black">目的地</label>
                                                        <div class="field-icon-wrap">
                                                            <div class="icon"><i class="fa-solid fa-chevron-down"></i>
                                                            </div>
                                                            <select name="destination" id="location" class="form-control">
                                                                <option value="台灣" selected>台灣</option>
                                                                <option value="日本">日本</option>
                                                                <option value="美國">美國</option>
                                                                <option value="英國">英國</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 mb-3 mb-md-0">
                                                        <label for="children"
                                                            class="font-weight-bold text-black">旅客</label>
                                                        <div class="field-icon-wrap">
                                                            <div class="icon"><i class="fa-solid fa-chevron-down"></i>
                                                            </div>
                                                            <select name="number" id="number" class="form-control">
                                                                <option value="1">1</option>
                                                                <option value="2">2</option>
                                                                <option value="3">3</option>
                                                                <option value="4">4+</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-3 align-self-end">
                                                <button type="button" id="searchButton" class="btn btn-primary btn-block text-white">尋找房源</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>


                            </div>
                        </div>
                    </section>