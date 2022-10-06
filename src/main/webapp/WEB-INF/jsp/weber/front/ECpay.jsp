<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="allPayAPIForm" action="https://payment-stage.ecPay.com.tw/Cashier/AioCheckOut/V5" method="post">
<!-- 	<input type="hidden" name="ChooseSubPayment" value=""> -->
	<input type="hidden" name="Redeem" value="Y">
	<input type="hidden" name="MerchantID" value="2000132">
<!-- 	<input type="hidden" name="ClientBackURL" value=""> -->
<!-- 	<input type="hidden" name="CustomField4" value=""> -->
<!-- 	<input type="hidden" name="CustomField3" value=""> -->
<!-- 	<input type="hidden" name="CustomField2" value=""> -->
<!-- 	<input type="hidden" name="MerchantMemberID" value=""> -->
	<input type="hidden" name="TotalAmount" value="${TotalAmount}">
<!-- 	<input type="hidden" name="OrderResultURL" value=""> -->
<!-- 	<input type="hidden" name="CustomField1" value=""> -->
<!-- 	<input type="hidden" name="UnionPay" value=""> -->
	<input type="hidden" name="InvoiceMark" value="N">
<!-- 	<input type="hidden" name="IgnorePayment" value=""> -->
	<input type="hidden" name="PaymentType" value="aio">
<!-- 	<input type="hidden" name="CheckMacValue" value="24ED8BB27ABDA958A023FE70C73B73A13A168954954852E754EE7778F68045CA"> -->
	<input type="hidden" name="CheckMacValue" value="${checkMacValue}">
	<input type="hidden" name="NeedExtraPaidInfo" value="N">
<!-- 	<input type="hidden" name="ItemURL" value=""> -->
<!-- 	<input type="hidden" name="BidingCard" value=""> -->
<!-- 	<input type="hidden" name="DeviceSource" value=""> -->
	<input type="hidden" name="EncryptType" value="1">
	<input type="hidden" name="TradeDesc" value="yee">
	<input type="hidden" name="ChoosePayment" value="Credit">
<!-- 	<input type="hidden" name="StoreID" value=""> -->
<!-- 	<input type="hidden" name="Remark" value=""> -->
<!-- 	<input type="hidden" name="Language" value=""> -->
<!-- 	<input type="hidden" name="PlatformID" value=""> -->
	<input type="hidden" name="ReturnURL" value="http://211.23.128.214:5000">
	<input type="hidden" name="ItemName" value="${ItemName}">
	<input type="hidden" name="MerchantTradeNo" value="${TradeNo}">
	<input type="hidden" name="MerchantTradeDate" value="${paymentDate}">
<script language="JavaScript">allPayAPIForm.submit()</script>
</form>
