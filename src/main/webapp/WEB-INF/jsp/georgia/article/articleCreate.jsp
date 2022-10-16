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
文章內文：<textarea id="contentInput" name="content"></textarea>
<INPUT TYPE="SUBMIT" value="發表文章" name="sentarticle" class="btn btn-primary mr-2">
</form>
<button  onclick="oneInput();" class="btn btn-light">一鍵輸入</button>

<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>

<script src="/js/georgia/ckeditorGeorgia.js"></script>

<script>
var myEditor;
	ClassicEditor
	.create( document.querySelector( '#contentInput' ) )
	.then( editor => {
		myEditor = editor ;
	} )
	.catch( error => {
	    console.error( error );
	} );
	


function back(){
	history.back();
}
$('#upload').on('change',function(e){
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
	   
$('#fastInput').click(function(){
	//$('#posterIDInput').val('6666');
	
})

function oneInput(){
	
	
	
	$('#titleInput').val('中壢必吃牛排店');
	$('#subtitleInput').val('好牛排，不吃嗎？');
	myEditor.setData('132');
	
	
	
/*	document.form.contentInput.value = CKEDITOR.instances.contentInput.insertHtml
	  ( ' <p>椒麻雞主食與飯有分隔 （大推👍<br/>'+
	'回家吃雞腿皮還是脆口的！<br />'+
	'椒麻雞醬汁的味道有添加檸檬增加清爽口感<br />'+
	'該有的花椒香也沒有忘記唷！<br />'+
	'<br />'+
	'綠咖哩雞的雞肉帶皮口感很好<br />'+
	'椰奶的風味完全完美的巴在雞腿肉上面不放了！<br />'+
	'<br />'+
	'今天吃的配菜裡面的番茄炒蛋🍅<br />'+
	'好好吃！！！！！<br />'+
	'許願常常出現❤️❤️❤️<br />'+
	'<br />'+
	'泰式香蘭豆花店裡頭的招牌特色！<br />'+
	'外面從未吃過的口味！值得一試<br />'+
	'<br />'+
	'泰式奶茶也好好喝 不會過甜～<br />'+
	'符合我們的口味🥤</p>'+
	'<img alt="" height="300" src="http://localhost:8080/EatWorld/photo/post11.PNG" width="300" />  ' ) ;*/
	
}
</script>

<script>
// ClassicEditor
// .create(document.querySelector('#contentInput'),{
// 	    ckfinder: {
// 	        uploadUrl: '/ckUploadGeorgia'
// 	    },
// 	}).then(editor => {
//  	  console.log("editor1 success");
// });
</script>
</body>
</html>