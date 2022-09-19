<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<title>加入飯店資料</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
	.box {
		width: 100px;
		height: 100px;
		border: 1px solid black;
		overflow: hidden;
		
	}
</style>
</head>
<body>
<%@ include file="/WEB-INF/includes/Header.jsp"  %>
	<div align="center">
	    <form:form action="insertHotel" method="post" modelAttribute="hotel" enctype="multipart/form-data">
	        飯店名稱:
	        <form:input type="text" path="name" name="name" id="name"/><br>
	        地址:
	        <form:input type="text" path="address" name="address" id="address"/><br>
	        類型:
	        <form:input type="text" path="type" name="type" id="type"/><br>
	        介紹:
	        <form:input type="text" path="intro" name="intro" id="intro"/><br>
	        國家:
	        <form:input type="text" path="country" name="country" id="country"/><br>
	        電話:
	        <form:input type="text" path="phone" name="phone" id="phone"/><br>
	        狀態:
	        <form:input type="text" path="status" name="status" id="status"/><br>
	        可容納人數:
	        <form:input type="text" path="capacity" name="capacity" id="capacity"/><br>
	        業主名稱:
	        <form:input type="text" path="owner" name="owner" id="owner"/><br>
	        平均房價:
	        <form:input type="text" path="averagePrice" name="averagePrice" id="averagePrice"/><br>
	    </form:form>
	    照片:<br>
	    <form id="formPhoto">
			<label for="exampleInputEmail1">頭像</label>
			<input type="button" value="上傳圖片" onclick="upload.click()"/><br>
			<p><input type="file" id="upload" name="upload" onchange="sc(this);" style="display:none"/></p>
		</form>
		<div id="box" class="box"></div>
	        <input type="file" name="photo1" id="photo1"/><br>
<!-- 	        <input type="file" name="photo1" accept="image/*"> -->
			<div class=box><img src="images/hotelPhotos/hotelNB18/photo1.jpg" width="100" height="100" ></div>
	        <input type="submit" name="insert" value="加入一筆資料">
	        
    </div>
    <script>
    function sc(){
        var animateimg = $("#upload").val(); //獲取上傳的圖片名 帶//
        console.log(animateimg);
        var imgarr=animateimg.split('\\'); //分割
        var myimg=imgarr[imgarr.length-1]; //去掉 // 獲取圖片名
        var houzui = myimg.lastIndexOf('.'); //獲取 . 出現的位置
        var ext = myimg.substring(houzui, myimg.length).toUpperCase();  //切割 . 獲取檔案字尾
        
        var file = $('#upload').get(0).files[0]; //獲取上傳的檔案
        var fileSize = file.size;           //獲取上傳的檔案大小
        var maxSize = 1048576;              //最大1MB
        if(ext !='.PNG' && ext !='.GIF' && ext !='.JPG' && ext !='.JPEG' && ext !='.BMP'){
            parent.layer.msg('檔案型別錯誤,請上傳圖片型別');
            return false;
        }else if(parseInt(fileSize) >= parseInt(maxSize)){
            parent.layer.msg('上傳的檔案不能超過1MB');
            return false;
        }else{  
            var data = new FormData($('#formPhoto')[0]); 
            $.ajax({  
                url: "/hotelPhotoAjax", 
                type: 'POST',  
                data: data,  
                dataType: 'text',  
                cache: false,  
                processData: false,  
                contentType: false  
            }).done(function(ret){ 
            	var show = '<img src="images/hotelPhotos/hotel/'+ret+'" width="100" height="100" >';
            	$('#box').append(show);
//                 if(ret['isSuccess']){
//                     var result = '';
//                     var result1 = '';
//                     // $("#show").attr('value',+ ret['f'] +);
//                     result += '<img src="' + '__ROAD__' + ret['f']  + '" width="100">';
//                     result1 += '<input value="' + ret['f']  + '" name="user_headimg" style="display:none;">';
//                     $('#result').html(result);
//                     $('#show').html(result1);
//                     layer.msg('上傳成功');
//                 }else{  
//                     layer.msg('上傳失敗');
//                 }  
            });  
            return false;
           }  
		}
    </script>
</body>
</html>