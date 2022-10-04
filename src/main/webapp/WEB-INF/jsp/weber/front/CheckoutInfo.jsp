<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>結帳資訊</title>
<script src="/css/wei/js/jquery-3.4.1.min.js"></script>
<style>
        fieldset {
            width: 500px;
            border: 2px solid black;
            border-radius: 15px;
            margin: 15px;
        }

        legend {
            /* text-align: center; */
            margin-left: 50px;
        }

        .st1 {
            width: 450px;
            border-bottom: 3px dashed #ADADAD;
            margin: 20px;
            padding-bottom: 10px;
        }

        .sub {
            width: 450px;
            margin: 20px;
            text-align: center;
        }

        .t1 {
            width: 100px;
            float: left;
            /* border: 1px solid red; */
            text-align: right;
        }

        textarea {
            resize: none;
        }
    </style>
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
                <input type="reset" value="返回" disabled>
            </div>
        </fieldset>
    </form>
</div>    
</body>
</html>