package tw.chitou.util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;

public class ECPayHelper {

	private AllInOne all = new AllInOne("");
	
	public String getECpayPage(String tradeNo,String totalAmount,String itemName,String backurl) {
		AioCheckOutOneTime creditCardPay = new AioCheckOutOneTime();
		creditCardPay.setMerchantTradeNo(tradeNo);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		creditCardPay.setMerchantTradeDate(dtf.format(LocalDateTime.now()));
		creditCardPay.setTotalAmount(totalAmount);
		creditCardPay.setTradeDesc("測試交易");
		creditCardPay.setItemName(itemName);
//		creditCardPay.setClientBackURL("http://localhost:8080/returnAfterSuccess");
		creditCardPay.setClientBackURL(backurl);
		creditCardPay.setReturnURL("http://211.23.128.214:5000");
//		creditCardPay.setReturnURL("https://3c0e-114-25-184-55.jp.ngrok.io/CheckMacValueForEC");
		creditCardPay.setNeedExtraPaidInfo("N");
//		creditCardPay.setOrderResultURL("http://localhost:8080/home");
		creditCardPay.setRedeem("N");
		return all.aioCheckOut(creditCardPay, null);
	}
}
