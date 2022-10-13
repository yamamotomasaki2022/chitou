$(document).ready(function(){
	$('#checkin_date').val(new Date().toISOString().split('T')[0]);
	$('#checkout_date').val(new Date().toISOString().split('T')[0]);
	console.log(new Date().toISOString().split('T')[0]);
	doSearch();
})

$("#searchButton").on('click', function (e) {
	doSearch();
})

function doSearch(){
	var form = $('#searchHotel')[0];
	var formData = new FormData(form);
    var dateStart = 'dateStart=' + formData.get('dateStart');
    var dateEnd = '&dateEnd=' + formData.get('dateEnd');
    var destination = '&destination=' + formData.get('destination');
    var number = '&number=' + formData.get('number');
    $.ajax({
        type: 'get',
        url: 'searchAjax?' + dateStart + dateEnd + destination + number,
        dataType: 'JSON',
        contentType: 'application/json',
        success: function (data) {
            $('#searchResult').empty();
            var result = '';
            $.each(data, function (index, ele) {
                result +=
                    `
					<li>
						<div class="itemBox">
							<div class="imgBox">
								<a href="hotelPage?${dateStart}${dateEnd}${number}&hotelID=${ele.hotelID}">
									<img src="images/weber/hotel/hotelNB${ele.hotelID}/photo1.jpg" 
										alt="" width="100%" height="261px">
								</a>
							</div>
							<div class="txtBox">
								<a href="hotelPage?${dateStart}${dateEnd}${number}&hotelID=${ele.hotelID}">
                            		<span style="font-size:20px;font-weight:bold;">${ele.name}</span>
                            	</a>
								<span class="text"><i class="fa-solid fa-location-dot"></i>
									${ele.address}
								</span>
								<div class="stars">
                           			<i class="fas fa-star"></i>
                           			<i class="fas fa-star"></i>
                           			<i class="fas fa-star"></i>
                           			<i class="fas fa-star"></i>
                           			<i class="fas fa-star"></i>
                       			</div>   	
                       			<div style="float:left;">
                           			<h3>&nbsp;&nbsp;NT$ ${ele.averagePrice}</h3>
                       			</div>
								<div class="tagging-tag_custom"
                               		style="max-width:auto;float:right;color:#ffffff;
                               		border-color:#eba2a2;background-color:#d61d1d;border-radius:4px;">
									<span class="tagging-tag_text">&emsp;還剩下${ele.amount}間房&emsp;</span>
								</div>
							</div>
						</div>
					</li>
                    `
            });
            $('#searchResult').append(result);
        }
    });
}
