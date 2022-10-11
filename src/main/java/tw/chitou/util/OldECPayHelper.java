package tw.chitou.util;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Hashtable;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.ATMRequestObj;
import ecpay.payment.integration.domain.AioCheckOutALL;
import ecpay.payment.integration.domain.AioCheckOutATM;
import ecpay.payment.integration.domain.AioCheckOutApplePay;
import ecpay.payment.integration.domain.AioCheckOutBARCODE;
import ecpay.payment.integration.domain.AioCheckOutCVS;
import ecpay.payment.integration.domain.AioCheckOutDevide;
import ecpay.payment.integration.domain.AioCheckOutOneTime;
import ecpay.payment.integration.domain.AioCheckOutPeriod;
import ecpay.payment.integration.domain.AioCheckOutWebATM;
import ecpay.payment.integration.domain.CVSOrBARCODERequestObj;
import ecpay.payment.integration.domain.InvoiceObj;
import ecpay.payment.integration.ecpayOperator.EcpayFunction;
import ecpay.payment.integration.errorMsg.ErrorMessage;
import ecpay.payment.integration.exception.EcpayException;
import ecpay.payment.integration.verification.VerifyAioCheckOut;

public class OldECPayHelper {

//	private AllInOne all = new AllInOne("");
	
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
	
	public AioCheckOutOneTime getECbean(String tradeNo,String totalAmount,String itemName,String backurl) {
		AioCheckOutOneTime creditCardPay = new AioCheckOutOneTime();
//		creditCardPay.setMerchantID("2000132");
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
		return creditCardPay;
	}
	
	public String getCheckValue(String itemName,String merchantTradeDate,String tradeNo,
			String tradeDesc,String totalAmount) {
		String out = "HashKey=5294y06JbISpM5x9&ChoosePayment=Credit&"
				+"EncryptType=1&InvoiceMark=N&ItemName="+itemName+"&"
				+ "MerchantID=2000132&MerchantTradeDate="+merchantTradeDate+"&"
				+ "MerchantTradeNo="+tradeNo+"&NeedExtraPaidInfo=N&PaymentType=aio&"
				+ "Redeem=N&ReturnURL=http://211.23.128.214:5000&"
				+ "TotalAmount="+totalAmount+"&TradeDesc="+tradeDesc+"&HashIV=v77hoKGq4kWxNNIS";
		System.out.println(out);
		String urlEncode = urlEncode(out).toLowerCase();
		urlEncode = netUrlEncode(urlEncode);
		return hash(urlEncode.getBytes(), "SHA-256");
	}
	
//	/**
//	 * 產生訂單Html form的方法
//	 * @param aioCheckOutObj
//	 * @param invoice
//	 * @param String
//	 */
//	public String aioCheckOut(AioCheckOutOneTime obj){
//		StringBuilder out = new StringBuilder();
//		String ignoreParam = "";
//		try {
//			VerifyAioCheckOut verify = new VerifyAioCheckOut();
//			verify.verifyParams(obj);
//			out.append(genCheckOutHtmlCode(obj));
//		} catch (EcpayException e) {
//			e.ShowExceptionMessage();
//			throw new EcpayException(e.getNewExceptionMessage());
//		}
//		return out.toString();
//	}
//	
//	/**
//	 * 產生HTML code
//	 * @param aio object
//	 * @param invoice obj
//	 * @return string
//	 */
//	private String genCheckOutHtmlCode(AioCheckOutOneTime aio){
//		StringBuilder builder = new StringBuilder();
//		Hashtable<String, String> fieldValue = EcpayFunction.objToHashtable(aio);
//		Hashtable<String, String> invoiceField = new Hashtable<String, String>();
//		String CheckMacValue = EcpayFunction.genCheckMacValue("5294y06JbISpM5x9", "v77hoKGq4kWxNNIS", fieldValue);
//		fieldValue.put("CheckMacValue", CheckMacValue);
//		Set<String> key = fieldValue.keySet();
//		String name[] = key.toArray(new String[key.size()]);
//		builder.append("<form id=\"allPayAPIForm\" action=\""+"https://payment-stage.ecPay.com.tw/Cashier/AioCheckOut/V5" + "\" method=\"post\">");
//		for(int i = 0 ; i < name.length ; i++) {
//			builder.append("<input type=\"hidden\" name=\""+name[i]+"\" value=\""+fieldValue.get(name[i])+"\">");
//		}
//		builder.append("<script language=\"JavaScript\">");
//		builder.append("allPayAPIForm.submit()");
//		builder.append("</script>");
//		builder.append("</form>");
//		return builder.toString();
//	}
	
	//////////////////////////////////////////////////////////////////////////////////////////
	public final static String genCheckMacValue(String key, String iv, Hashtable<String, String> params){
		Set<String> keySet = params.keySet();
		TreeSet<String> treeSet = new TreeSet<String>(String.CASE_INSENSITIVE_ORDER);
		treeSet.addAll(keySet);
		String name[] = treeSet.toArray(new String[treeSet.size()]);
		String paramStr = "";
		for(int i = 0; i < name.length; i++){
			if(!name[i].equals("CheckMacValue")){
				paramStr += "&" + name[i] + "=" + params.get(name[i]);
			}
		}
		String urlEncode = urlEncode("Hashkey=" + key + paramStr + "&HashIV=" + iv).toLowerCase();
		urlEncode = netUrlEncode(urlEncode);
		return hash(urlEncode.getBytes(), "SHA-256");
	}
	
	/**
	 * 將資料做 urlEncode編碼
	 * @param data
	 * @return url encoded string
	 */
	public static String urlEncode(String data){
		String result = "";
		try{
			result = URLEncoder.encode(data, "UTF-8");
		} catch(UnsupportedEncodingException e){
			
		}
		return result; 
	}
	
	/**
	 * 將做完的urlEncode字串做轉換符合 .NET語言的轉換規則
	 * @param url
	 * @return .Net url encoded string
	 */
	private static String netUrlEncode(String url){
		String netUrlEncode = url.replaceAll("%21", "\\!").replaceAll("%28", "\\(").replaceAll("%29", "\\)");
		return netUrlEncode;
	}
	
	/**
	 * 將 byte array 資料做 hash md5或 sha256 運算，並回傳 hex值的字串資料
	 * @param data
	 * @param isMD5
	 * @return string
	 */
	private final static String hash(byte data[], String mode){
		MessageDigest md = null;
		try{
			if(mode == "MD5"){
				md = MessageDigest.getInstance("MD5");
			}
			else if(mode == "SHA-256"){
				md = MessageDigest.getInstance("SHA-256");
			}
		} catch(NoSuchAlgorithmException e){
		}
		return bytesToHex(md.digest(data));
	}
	
	/**
	 * 將 byte array 資料轉換成 hex字串值
	 * @param bytes
	 * @return string
	 */
	private final static String bytesToHex(byte[] bytes) {
	    char[] hexChars = new char[bytes.length * 2];
	    for ( int j = 0; j < bytes.length; j++ ) {
	        int v = bytes[j] & 0xFF;
	        hexChars[j * 2] = "0123456789ABCDEF".toCharArray()[v >>> 4];
	        hexChars[j * 2 + 1] = "0123456789ABCDEF".toCharArray()[v & 0x0F];
	    }
	    return new String(hexChars);
	}
	
	
}
