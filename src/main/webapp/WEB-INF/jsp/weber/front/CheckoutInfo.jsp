<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>結帳資訊</title>
</head>
<body>
<div align="center">
	<h3>結帳完成!</h3>
	<h4>明細</h4>
	<form action="getECPay" id="form" method="post">
        <fieldset>
            <legend>基本資料</legend>
            <div class="st1">
                <label for="account1" class="t1">姓名:</label>
                <label>${checkOutRoom.booker}</label>
            </div>
            <div class="st1">
                <label for="" class="t1">E-Mail</label>
                <label>${checkOutRoom.email}</label>
            </div>
            <div class="st1">
                <label for="" class="t1">電話</label>
                <label>${checkOutRoom.phone}</label>
            </div>
        </fieldset>
        <fieldset>
            <legend>客房資訊</legend>
            <div class="st1">
                <label for="" class="t1">飯店名稱</label>
                <label>${checkOutRoom.hotelName}</label>
            </div>
            <div class="st1">
                <label for="" class="t1">房間</label>
                <label>${checkOutRoom.roomName}</label>
            </div>
            <div class="st1">
                <label for="" class="t1">人數</label>
                <label>${checkOutRoom.numberOfPeople}</label>
            </div>
            <div class="st1">
                <label for="" class="t1">入住時間</label>
                <label>${checkOutRoom.checkInDate}</label>
            </div>
            <div class="st1">
                <label for="" class="t1">退房時間</label>
                <label>${checkOutRoom.checkOutDate}</label>
            </div>
            <div class="st1">
                <label for="" class="t1">加床</label>
                <label>${checkOutRoom.addBed}</label>
            </div>
            <div class="st1">
                <label for="" class="t1">總價格</label>
                <label>${checkOutRoom.totalAmount}</label>
            </div>
            <div class="sub">
            	<a href="home">
                	<button type="button">返回</button>
                </a>
            </div>
        </fieldset>
    </form>
</div>    
</body>
</html>