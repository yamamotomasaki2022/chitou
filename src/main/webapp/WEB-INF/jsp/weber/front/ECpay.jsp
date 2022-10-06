<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="allPayAPIForm" action="https://payment-stage.ecPay.com.tw/Cashier/AioCheckOut/V5" method="post">
	<input type="hidden" name="Redeem" value="N">
	<input type="hidden" name="MerchantID" value="2000132">
	<input type="hidden" name="TotalAmount" value="${TotalAmount}">
	<input type="hidden" name="InvoiceMark" value="N">
	<input type="hidden" name="PaymentType" value="aio">
	<input type="hidden" name="CheckMacValue" value="${checkMacValue}">
	<input type="hidden" name="NeedExtraPaidInfo" value="N">
	<input type="hidden" name="EncryptType" value="1">
	<input type="hidden" name="TradeDesc" value="test">
	<input type="hidden" name="ChoosePayment" value="ALL">
	<input type="hidden" name="ReturnURL" value="http://211.23.128.214:5000">
	<input type="hidden" name="ClientBackURL" value="${ClientBackURL}">
	<input type="hidden" name="ItemName" value="${ItemName}">
	<input type="hidden" name="MerchantTradeNo" value="${TradeNo}">
	<input type="hidden" name="MerchantTradeDate" value="${paymentDate}">
<script language="JavaScript">allPayAPIForm.submit()</script>
</form>
