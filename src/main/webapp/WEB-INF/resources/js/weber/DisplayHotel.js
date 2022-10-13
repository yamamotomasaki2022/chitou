$(document).ready(function(){
	doSearch();
})

$("#searchButton").on('click', function (e) {
	doSearch();
})

$("#date").on('change', function () {
    let date = $(this).val().replace(" ", "").replace(" ", "").split('-');
    $('#dateStart').val(date[0]);
    $('#dateEnd').val(date[1]);
});

function doSearch(){
	var form = $('#searchRoom')[0];
	var formData = new FormData(form);
    var dateStart = 'dateStart=' + formData.get('dateStart');
    var dateEnd = 'dateEnd=' + formData.get('dateEnd');
    var hotelID = 'hotelID=' + formData.get('hotelID');
    var number = 'number=' + formData.get('number');
    $.ajax({
        type: 'get',
        url: 'searchHotelRoomAjax?' + dateStart + '&' + dateEnd + '&' + hotelID + '&' + number,
        dataType: 'JSON',
        contentType: 'application/json',
        success: function (data) {
            $('.custom-accordion').empty();
            var result = '';
            var collapse = ['One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten', 'Eleven', 'Twelve', 'Thirteen'];
            $.each(data, function (index, ele) {
                result +=
                    `
                    <div class="accordion-item">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse${collapse[index]}" aria-expanded="false" aria-controls="collapse${collapse[index]}">${ele.name}</button>
                        </h2>

                        <div id="collapse${collapse[index]}" class="collapse" aria-labelledby="heading${collapse[index]}" data-parent="#accordion_1">
                            <div class="accordion-body">
                                ・容納人數: ${ele.capacity}人
                                <br>
                                ・床位: ${ele.bed}
                                <br>
                                <div style="float:left;">
                                    <h3>&nbsp;&nbsp;NT$ ${ele.price}</h3>
                                </div>
                                <div style="float:left;">
                                    <h3 style="color:red;">&nbsp;&nbsp;還剩 ${ele.roomAmount} 間房間</h3>
                                </div>
                                <a href="bookingPage?${hotelID}&roomStyleID=${ele.styleID}&${dateStart}&${dateEnd}&${number}" style="float:right;" class="btn btn-primary text-white py-2 px-2">馬上訂房</a>
                                <br>
                            </div>
                        </div>
                    </div>
                    `
            });
            $('.custom-accordion').append(result);
        }
    });
}
