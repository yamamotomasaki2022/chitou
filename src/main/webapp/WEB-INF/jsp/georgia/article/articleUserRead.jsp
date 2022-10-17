<%@page import="tw.georgia.article.model.ArticleService"%>
<%@page import="javax.management.MBeanAttributeInfo"%>
<%@page
	import="java.sql.Connection, java.util.*, javax.sql.*, javax.servlet.*,  javax.naming.*,java.io.*,java.sql.* ,tw.georgia.article.model.*,tw.georgia.article.controller.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查詢文章</title>
<link href="https://img.onl/DOO7l" rel="icon" type="image/png" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript"></script>
<style>
* {
	font-size: 102%;
}

table {
	
	width: 100%;
	height: 50px;
	margin: 10 auto;
	border-radius: 5px;
}


button, .btn {
	background-color: #FFFDD0;
	border-color: #FFFDD0;
	color: #265D7E;
	border-radius: 25px;
	font-size: 150%;
}

.centre {
	text-align: center;
}

#BackTop	{
				position:fixed;				
				bottom:60px;
				right:10px;
				}
#ToBottom	{
				position:fixed;				
				bottom:10px;
				right:10px;
				}
.jiantou	{
				width: 2.7rem;
				height: 2.7rem;
				color:rgb(69,71,155);
				}
.bigFont{
	font-size: 20px;
}

.table_class tr td{
	font-size: 20px;
}

.table_class thead tr th{
	font-size: 25px;
}
</style>

<%@ include file="/WEB-INF/includes/coco/attraction/AttractionsDescriptionCSS.jsp"%>

</head>

<body>


	<%@ include file="/WEB-INF/includes/coco/attraction/Header.jsp"%>



	<br><br><br><br>
	<form action="article.user" method="get">
<INPUT TYPE="SUBMIT" value="返回文章管理首頁" name="goBack" class="btn btn-primary mr-2" onclick="back()"><br>
</form>
<br>
	<div class="bigFont">
	<form action="article.user.read" method="post">
	<input type="hidden" name="_method" value="POST">
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
		</select> 選擇文章類型<select name="chooseType">
			<option value="">全部</option>
			<option value=91>遊記</option>
			<option value=92>食記</option>
			<option value=93>資訊</option>
			<option value=94>問題</option>
			<option value=95>攻略</option>
		</select> <INPUT TYPE="SUBMIT" value="查詢" name="chooseArticle" class="btn btn-primary mr-2"><br>
		<br>
	</form>
	</div>
<div class="table-responsive">
		<table class="table table-hover table_class">
			<thead id="tableHead">
				<tr>
					<!--  <th class="card-title text-primary">會員ID</th>-->
					<th class="card-title text-primary">國家</th>
					<th class="card-title text-primary">文章類型</th>
					<th class="card-title text-primary">預覽縮圖</th>
					<th class="card-title text-primary">文章標題</th>
					<th class="card-title text-primary">發布日期</th>
					<th class="card-title text-primary">文章內文</th>
					<th class="card-title text-primary">文章管理</th>
				</tr>
			</thead>
			<tbody>
<%
List<Article> list=(List)request.getAttribute("search");
for (Article bean : list) {
	if(bean.getUserDelete()==1)
		continue;
	if(bean.getManageHidden()==1)
		continue;
	int title=bean.getTitle().length();
	
		%>
				<tr>
					<td class=""><%=bean.getCategory().getCountry()%></td>
					<td class=""><%=bean.getCategory().getType()%></td>
					<td class=""><img id="img" src="images/georgia/picture/<%=bean.getPhoto()%>" class="box" style="width:100px;height:100px"></td>
					<td><%=(title<20)?bean.getTitle().substring(0,title):bean.getTitle().substring(0,20)%><HR><%=bean.getSubtitle()%></td>
					<td class=""><%=bean.getDate()%></td>
					<td>
					<button type="button" name="toShow" value="<%=bean.getPostID()%>" class="btn btn-light readClass" style="" data-bs-toggle="modal" data-bs-target="#exampleModal">Read More...</button>
					</td>
					<td class="">

						<form action="article.renew" method="post" style="">
							<INPUT TYPE="HIDDEN" value=<%=bean.getPostID()%> name="postID">
							<input type="submit" name="update" value="修改" class="btn btn-primary mr-2"
								id="update" style="font-size: 18px;">
						</form>

						<!--  <input type="hidden" name="_method" value="DELETE">--> 
							<button type="button" name="" class="btn btn-light"
								id="check" style="font-size: 18px;" onclick="delete_data(<%=bean.getPostID()%>);">刪除</button>

					</td>
				</tr>
			<%
}
%>
</tbody>
		</table>
		</div>
		
<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="detailTitle"></h3>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <div id="hiddenValue">
      </div>
		<div id="detailContent">
		</div>
		<div id="detailReply" style="background-color: rgb(240, 240, 240);">
     	 </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
		
				<%@ include file="/WEB-INF/includes/coco/attraction/Footer.jsp"%>
		<%@ include file="/WEB-INF/includes/coco/attraction/AttractionsDescriptionJS.jsp"%>
		
<svg type="button" id="BackTop" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-circle-fill jiantou" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 0 0 8a8 8 0 0 0 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
</svg>
<svg type="button" id="ToBottom" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-circle-fill jiantou" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z"/>
</svg>

		<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">
		$(function(){
			var post_id=0;
			$('#BackTop').click(function(){ 
				$('html,body').animate({scrollTop:0},10);
			});
			$('#ToBottom').click(function(){ 
				$('html,body').animate({scrollTop:document.body.scrollHeight}, 10);
			});
			
			$(".country").click(function(){
				let countryNo = $(this).attr("name");
				console.log(countryNo);
				let form=$(document.createElement('form')).css({display:'none'}).attr("method","POST").attr("action","article.country");
				  let eleFileName=$(document.createElement('input')).attr('name','countryID').val(countryNo);
				  form.append(eleFileName);
				  $("body").append(form);
				  form.submit();
			});
		
			
			$(".readClass").click(function(){
				let postID=$(this).val();
				console.log(postID);
				$.getJSON({
                    type: "GET",
                    url: "/article.fake.detail",
                    async: "true",
                    data: "postID=" + postID,
                    success: function (data) {
                        console.log("讀取成功");
                        post_id=data.postID;
                        //
                        $('#detailTitle').html(data.title);
                        $('#detailContent').html(data.content);
                        /*$('#hiddenValue').append(
           	                 $('<tr/>')
           	                     .append(
           	                         $('<td/>')
           	                             .append(
           	                                 $('<input/>')
           	                                     .attr('type', 'hidden')
           	                                     .attr('value', data.postID)
           	                                     .attr('id', 'postID')
           	                             )
           	                     )
           	             );*/

                        
                    }, error: function (data) {
                        console.log("讀取失敗");
                    }
                });
				$.getJSON({
                    type: "GET",
                    url: "/article.comment",
                    async: "true",
                    data: "postID=" + postID,
                    success: function (data) {
                        console.log("讀取成功");
                        detailComment(data);
                        
                    }, error: function (data) {
                        console.log("讀取失敗");
                    }
                });
				
			})
			
			$(document).on("click",".btn_comment_user_s",function(){
				let comment = $(this).closest('td').prev().find('#comment').val();
				console.log("US"+comment);
				var postID=$('#postID').val();
				
				$.ajax({
				      type: "POST",
				      url: "/article.commentinsert",
				      data: "postID=" + post_id+"&comment="+comment,
				      async: "false",//等他回來
				      success: function (resopnse, status, xhr) {
				        console.log("連線成功");
				        console.log(xhr.status);
				        console.log(xhr.readyState);
				        //判斷新增是否成功
				        if (xhr.readyState == 4 && xhr.status == 200) {
				          if (xhr.responseText == "ok") {
				            console.log("新增成功!");
				            $.getJSON({
			                    type: "GET",
			                    url: "/article.comment",
			                    async: "true",
			                    data: "postID=" + post_id,
			                    success: function (data) {
			                        console.log("讀取成功");
			                        //清空商品列表
			                        detailComment(data);
			                    }, error: function (data) {
			                        console.log("讀取失敗");
			                    }
			                });
				          } else {
				            console.log("新增分類失敗!");
				          }
				        }
				      }
				    })
			})
			
			
		})
		
		
		//會員刪除
 function delete_data(post_id){
    swal.fire({
       title: '確定刪除此文章嗎?',
       icon: 'warning',
       showCancelButton: true,
       confirmButtonText: '好',
       cancelButtonText: '不要',
       reverseButtons: true
     }).then((result) => {
       if (result.isConfirmed) {
         swal.fire(
           'Deleted!',
           '已成功刪除',
           'success'
         )
          
    let form=$(document.createElement('form')).css({display:'none'}).attr("method","POST").attr("action","article.userDelete");
    let manageHidden=$(document.createElement('input')).attr('name','postID').val(post_id);
    //let eleAction=$(document.createElement('input')).attr('name','action').val("delete_combo");
     form.append(manageHidden);
     $("body").append(form);
     form.submit();
         
       } else if (
         /* Read more about handling dismissals below */
          result.dismiss === Swal.DismissReason.cancel
       ) 
       {
         swal.fire(
           '取消刪除',
           '已取消'
         )
       }
     }) 
 }
		
			function detailComment(data) {
			    console.log('123');
			    $("#detailReply").empty();
			    let floor=0;
			    $.each(data, function (index, value) {
			    	floor++;
	    		 $('#detailReply').append(
	                 $('<tr/>')
	                     .append(
	                         $('<td/>')
	                             .append(
	                                 $('<img/>')
	                                     .attr('src', value.member.photo)
	                                     .css("height", '100px')
	                                     .css("width", '100px')
	                             )
	                     )
	                     .append(
	                         $('<td/>').addClass('edit_td')
	                             .text(floor+'樓的 '+value.member.username+'說：'+value.comment)
	                     )
	                     .append(
	                         $('<td/>')
	                             
	                     )
	             )
        });
	    $('#detailReply').append(
                $('<tr/>')
                    .append(
                        $('<td/>')
                            .append(
                                $('<img/>')
                                    .attr('src', 'images/georgia/picture/留言.png')
                                    .css("height", '100px')
                                    .css("width", '100px')
                            )
                    )
                    .append(
                        $('<td/>').addClass('edit_td')
                            .append(
                                $('<input/>')
                                    .attr('type', 'text')
                                    .attr('id', 'comment')
                            )
                    )
                    .append(
                        $('<td/>')
                            .append(
                                $('<input/>').addClass("btn_comment_user_s")
                                    .attr('type', 'button')
                                    .attr('value', '送出')
                                    .attr('id', 'commentNew')
                                    
                            )
                    )
            );
	} 

		

</script>
		
</body>
</html>

