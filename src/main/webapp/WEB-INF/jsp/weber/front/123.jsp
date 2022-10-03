aioCheckOutOneTime:
<form id="allPayAPIForm"
	action="https://payment-stage.ecPay.com.tw/Cashier/AioCheckOut/V5"
	method="post">
	<input type="hidden" name="ChooseSubPayment" value=""> 
	<input
		type="hidden" name="Redeem" value="Y">
		<input type="hidden" name="MerchantID" value="3002607">
		<input type="hidden" name="ClientBackURL" value="">
		<input type="hidden" name="CustomField4" value="">
		<input type="hidden" name="CustomField3" value="">
		<input type="hidden" name="CustomField2" value="">
		<input type="hidden" name="MerchantMemberID" value="">
		<input type="hidden" name="TotalAmount" value="50">
		<input type="hidden" name="OrderResultURL" value="">
		<input type="hidden" name="CustomField1" value="">
		<input type="hidden" name="UnionPay" value="">
		<input type="hidden" name="InvoiceMark" value="N">
		<input type="hidden" name="IgnorePayment" value="">
		<input type="hidden" name="PaymentType" value="aio">
		<input type="hidden" name="CheckMacValue" value="9B14636DC439E5B2FECB2C3A6DCF3CF67FB7801751574263C398EECAE3D25158">
		<input type="hidden" name="NeedExtraPaidInfo" value="N">
		<input type="hidden" name="ItemURL" value="">
		<input type="hidden" name="BidingCard" value="">
		<input type="hidden" name="DeviceSource" value="">
		<input type="hidden" name="EncryptType" value="1">
		<input type="hidden" name="TradeDesc" value="test Description">
		<input type="hidden" name="ChoosePayment" value="Credit">
		<input type="hidden" name="StoreID" value="">
		<input type="hidden" name="Remark" value="">
		<input type="hidden" name="Language" value="">
		<input
		type="hidden" name="PlatformID" value="">
		<input type="hidden" name="ReturnURL" value="http://211.23.128.214:5000">
		<input type="hidden" name="ItemName" value="TestItem">
		<input type="hidden" name="MerchantTradeNo" value="testCompany0008">
		<input type="hidden" name="MerchantTradeDate" value="2017/01/01 08:05:23">
	<script language="JavaScript">
		allPayAPIForm.submit()
	</script>
</form>
