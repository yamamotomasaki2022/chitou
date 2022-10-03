/**
 * 
 */

 $('#accountProfile').on('click',function(e){
    $.ajax({
        type:'get',
        url:'getAccountProfile',
        dataType:'JSON',
        contentType:'application/json',
        success:function(data){
            $('#account1').val(data.username);
        }
    });
});

$('#toEC').on('click',function(e){
    var form = new FormData(e.target.closest('form'));
});