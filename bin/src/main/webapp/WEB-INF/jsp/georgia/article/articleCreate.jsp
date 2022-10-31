<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<title>新增文章</title>
<link href="https://img.onl/DOO7l" rel="icon" type="image/png" />
<script type="text/javascript"></script>
<style type="text/css">
*{
font-size: 102%;
}
button, .btn {
	background-color: #FFFDD0;
	border-color: #FFFDD0;
	color: #265D7E;
	border-radius: 25px;
	font-size: 150%;
}
.error{
		color:red;
	}
</style>

<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/35.2.0/super-build/ckeditor.js"></script>
</head>
<body>


<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>

<br>
<INPUT TYPE="Button" value="取消" name="goBack" class="btn btn-primary mr-2" onclick="back()"><br><br>
<form action="article.insert" method="post" enctype="multipart/form-data" id="check">
<!--  會員ID:  <BR><INPUT TYPE="TEXT" NAME="posterID" VALUE="" id="posterIDInput"><BR>-->
文章標題: <BR><INPUT TYPE="TEXT" NAME="title" VALUE="" id="titleInput" style="width: 100%;"><BR>
文章副標題: <BR><INPUT TYPE="TEXT" NAME="subtitle" VALUE="" id="subtitleInput" style="width: 100%;"><BR><BR>
選擇縮圖:<BR><INPUT TYPE="FILE" NAME="photo" ID="upload"><BR>
	   <div id="picPreview"></div><BR>

		選擇國家<select name="chooseCountry">
			<optgroup label="亞洲">
				<option value=101>台灣</option>
				<option value=102>日本</option>
				<option value=103>韓國</option>
				<option value=108>新加坡</option>
				<option value=109>印尼</option>
			</optgroup>
			<optgroup label="美洲">
				<option value=201>美國</option>
				<option value=202>加拿大</option>
			</optgroup>
			<optgroup label="歐洲">
				<option value=301>英國</option>
				<option value=302>法國</option>
				<option value=304>義大利</option>
				<option value=307>土耳其</option>
				<option value=308>聖托里尼</option>
				<option value=309>阿爾巴尼亞</option>
			</optgroup>
			<optgroup label="大洋洲">
				<option value=401>澳洲</option>
			</optgroup>
			<optgroup label="非洲">
				<option value=501>埃及</option>
			</optgroup>
		</select> 
			<br><br>
		選擇文章類型<select name="chooseType">
			<option value=91>遊記</option>
			<option value=92>食記</option>
			<option value=93>資訊</option>
			<option value=94>問題</option>
			<option value=95>攻略</option>
			</select> 
		<br><br>
<!--國家編號:  <BR><INPUT TYPE="TEXT" NAME="bigClassID" VALUE="" id="bigClassIDInput"><BR>-->
<!--文章類型編號:  <BR><INPUT TYPE="TEXT" NAME="articleClassID" VALUE="" id="articleClassIDInput"><BR>-->
<!-- 文章內文：<BR><INPUT TYPE="TEXT" NAME="content" VALUE="" id="contentInput"><BR> -->
文章內文：<textarea id="editor" name="content"></textarea>
<INPUT TYPE="SUBMIT" value="發表文章" name="sentarticle" class="btn btn-primary mr-2">
</form>
<button  onclick="oneInput();" class="btn btn-light">一鍵輸入</button>

<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>
  <script src="/js/coco/ckeditor.js"></script>
<script src="/js/georgia/ckeditorGeorgia.js"></script>
<script>

	


function back(){
	history.back();
}

$('#upload').on('change',function(e){
	console.log('');
	$('#picPreview').empty();
	var photos = this.files;
	for(let i=0;i<photos.length;i++){
		var file = photos[i];
		var fr = new FileReader();
		fr.onload = function(e){
			$('#picPreview').append('<img id="img" src="'+e.target.result+'" class="box" style="height:100px">');
		};
		fr.readAsDataURL(file);
	};
});

$(function() {
	
	
	$('#check').validate({
		onkeyup : function(element, event) {
			var value = this.elementValue(element).replace(/^\s+/g, "");
			$(element).val(value);
			},
		rules : {
			title : {required : true},
			subtitle : {required : true},
			photo : {required : true},
			content : {required : true},
				},
			messages : {
			title : {required : '必填'},
			photo : {required : '必填'},
			content : {required : '必填'},
			subtitle : {required : '必填'},
			},
		submitHandler : function(form) {
			form.submit();
				}
			});
	   });

function oneInput(){
	
	$('#titleInput').val('想吃辣就吃嚮辣');
	$('#subtitleInput').val('給朋友去美國留學的歡送餐~');
	myEditor.setData('<h3>朋友要出國讀書了</h3>'+
			'<h3>跟另一個朋友打算幫她辦個歡送會(沒有很盛大 大家都好難約QQ</h3>'+
					'<h3>本來因為另一個朋友是餐飲業，所以要找開比較晚的火鍋店</h3>'+
					'<h3>心想好像只剩海底撈這個選擇</h3>'+
					'<h3>結果要出國的朋友說每次有人生日都吃海底撈覺得很膩XD</h3>'+
					'<h3>後來她看KOL分享決定歡送會來吃「嚮辣」</h3>'+
					'<h3>說營業到兩點又是吃到飽</h3><h3>是歡送會的好選擇😋💝</h3>'+
					'<p><img class="image_resized" style="width:35.51%;" src="https://imgur.dcard.tw/T0eUIGWh.jpg" alt="imgur"></p>'+
					'<h3>雖然嚮辣價格有點偏高</h3><h3>但如果喜歡吃辣、和牛或宵夜想找地方聚餐還是推推~~</h3>'+
					'<h3>最後就祝我的朋朋順飛</h3><h3>一路平安順利 I’ll miss u ❤❤❤</h3>'+
					'<p><img class="image_resized" style="width:34.88%;" src="https://imgur.dcard.tw/QppagLDh.jpg" alt="imgur"></p>');
}

</script>
</body>
</html>