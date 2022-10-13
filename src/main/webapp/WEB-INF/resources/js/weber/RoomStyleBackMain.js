$('.searchRoomStatus').on('click', function(e) {
	console.log(e.target.closest('form'))
	var form = new FormData(e.target.closest('form'))
	var styleID = form.get('styleID')
	$.ajax({
		url: "searchRoomStatus?styleID=" + styleID,
		type: "get", //請求方式
		dataType: "JSON", //設置接受到的響應數據的格式
		success: function(data) {
			var result = ''
			var eachData = ''
			var eachRow = ''
			$.each(data, function(index, ele) {
				eachData += `<th>${ele.roomID}</th>`
				eachRow += "<td>空</td>"
			})
			result +=
				`
				<table id="table" class="table table-hover">
    				<thead>
              			<tr>
              			${eachData}
              			</tr>
            		</thead>
            		<tbody>
						<tr id="roomResultRow">
						${eachRow}
		              	</tr>
					</tbody>
				</table>
				<br>
				<form>
					<input type="hidden" name="styleID" value="${styleID}">
					<input type="date" name="date" id="dateSelect">
				</form>
				`
			Swal.fire({
				title: '當日預訂情況:',
				html: result,
				showConfirmButton: false
			})
		}
	})
})

$(document).on('change','#dateSelect',function(e){
	var form = new FormData(e.target.closest('form'))
	var styleID = form.get('styleID')
	var date = form.get('date')
	$.ajax({
		url: "searchRoomStatusByDate?styleID=" + styleID + "&date=" + date,
		type: "get", 
		dataType: "JSON", 
		success: function(data) {
			$('#roomResultRow').empty()
			console.log(data)
			var result = ''
			$.each(data,function(index,ele){
				if(ele.orderID != null){
					result += `<td><button id='showReservation' name="${ele.roomID}">詳細</button></td>`
				}else{
					result += "<td>空</td>"
				}
			})
			$('#roomResultRow').append(result)
		}
	})
})

$(document).on('click','#showReservation',function(e){
	console.log(e.target.getAttribute('name'))
	var roomID = e.target.getAttribute('name')
	var date = $('#dateSelect').val()
	console.log(date)
	$.ajax({
		url: "searchRoomStatusByRoomID?roomID=" + roomID + "&date=" + date,
		type: "get", 
		dataType: "JSON", 
		success: function(data) {
			var result = ''
			result +=
			`
			<table style="width: 300px;border: 3px solid gray;">
				<thead>
					<th></th><th>內容</th>
				</thead>
				<tbody>
					<tr style="border: 1px solid gray;"><td>項目編號</td><td>${data.reservationID}</td></tr>
					<tr style="border: 1px solid gray;"><td>訂單編碼</td><td>${data.orderId}</td></tr>
					<tr style="border: 1px solid gray;"><td>會員ID</td><td>${data.memberID}</td></tr>
					<tr style="border: 1px solid gray;"><td>定位人</td><td>${data.booker}</td></tr>
					<tr style="border: 1px solid gray;"><td>信箱</td><td>${data.email}</td></tr>
					<tr style="border: 1px solid gray;"><td>電話</td><td>${data.phone}</td></tr>
					<tr style="border: 1px solid gray;"><td>房間號碼</td><td>${data.roomID}</td></tr>
					<tr style="border: 1px solid gray;"><td>房間名稱</td><td>${data.roomName}</td></tr>
					<tr style="border: 1px solid gray;"><td>入住日期</td><td>${data.checkInDate}</td></tr>
					<tr style="border: 1px solid gray;"><td>退房日期</td><td>${data.checkInDate}</td></tr>
					<tr style="border: 1px solid gray;"><td>付款時間</td><td>${data.paymentDate}</td></tr>
					<tr style="border: 1px solid gray;"><td>是否加床</td><td>${data.addBed}</td></tr>
					<tr style="border: 1px solid gray;"><td>人數</td><td>${data.numberOfPeople}</td></tr>
					<tr style="border: 1px solid gray;"><td>飯店名稱</td><td>${data.hotelName}</td></tr>
					<tr style="border: 1px solid gray;"><td>狀態</td><td>${data.orderStatus}</td></tr>
					<tr style="border: 1px solid gray;"><td>旅館編號</td><td>${data.hotelID}</td></tr>
				</tbody>
			</table>
			`
			Swal.fire({
				title: '當日預訂情況:',
				html: result,
				showConfirmButton: false
			})
		}
	})
})