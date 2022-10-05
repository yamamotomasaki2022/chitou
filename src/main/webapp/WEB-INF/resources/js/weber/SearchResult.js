/**
 * 
 */
var des = ["台灣", "日本", "澳洲", "英國", "法國"];
$(document).ready(function () {
    for (var i = 0; i < des.length; i++) {
        let option = '"<option value="' + des[i] + '">' + des[i] + '</option>"';
        $('#destination').append(option);
    };
    let date = new Date().toISOString().split('T')[0];
    $('#dateStart').val(date);
    $('#dateEnd').val(date);
});
$("#date").daterangepicker({
    // "minDate": new Date(),
    locale: {
        applyLabel: "確定",
        cancelLabel: "取消",
        fromLabel: "開始日期",
        toLabel: "結束日期",
        daysOfWeek: ["日", "一", "二", "三", "四", "五", "六"],
        monthNames: ["1月", "2月", "3月", "4月", "5月", "6月",
            "7月", "8月", "9月", "10月", "11月", "12月"],
    }
});
$("#date").on('change', function () {
    let date = $(this).val().replace(" ", "").replace(" ", "").split('-');
    $('#dateStart').val(date[0]);
    $('#dateEnd').val(date[1]);
});
$("#search").on('click', function (e) {
    var formData = new FormData(e.target.closest('form'));
    var dateStart = 'dateStart=' + formData.get('dateStart');
    var dateEnd = '&dateEnd=' + formData.get('dateEnd');
    var destination = '&destination=' + formData.get('destination');
    var number = '&number=' + formData.get('number');
    console.log(formData);
    $.ajax({
        type: 'get',
        url: '/searchAjax?' + dateStart + dateEnd + destination + number,
        dataType: 'JSON',
        contentType: 'application/json',
        success: function (data) {
            $('#searchResult').empty();
            var result = '';
            $.each(data, function (index, ele) {
                result +=
                    `
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="single-awesome-project">
                            <a href="images/weber/hotel/hotelNB${ele.hotelID}/photo1.jpg" class="img"> 
                            <img src="images/weber/hotel/hotelNB${ele.hotelID}/photo1.jpg" alt="Image" class="img-fluid">
                            </a>

                            <div class="project-dec-2">
                                <div>
                                    <span class="d-block mb-2 text-black-50">
                                    <i class="fa-solid fa-location-dot"></i> ${ele.name}
                                    </span> 
                                    <span class="city d-block mb-3">${ele.address}</span>
                                    <div class="specs d-flex mb-4">
                                        <span class="d-block d-flex align-items-center me-3">
                                            <span class="icon-bed me-2"></span> 
                                            <span class="caption">
                                                平均房價:${ele.averagePrice}
                                            </span>
                                        </span>
                                    </div>

                                    <a href="/hotelPage?dateStart=${dateStart}&dateEnd=${dateEnd}&number=${number}&hotelID=${ele.hotelID}" class="btn btn-primary py-2 px-3" style="background-color: lightblue">詳細</a>
                                    <span style="color:blue">還剩${ele.amount}間房</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    `
            });
            $('#searchResult').append(result);
        }
    });
});