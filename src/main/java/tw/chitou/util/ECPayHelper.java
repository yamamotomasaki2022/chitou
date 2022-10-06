package tw.chitou.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class ECPayHelper {
	public String getCheckValue(String tradeNo,String itemName,String totalAmount,
			String merchantTradeDate,String tradeDesc,String clientBackURL) {
		String out = "HashKey=5294y06JbISpM5x9&ChoosePayment=ALL&"
				+ "ClientBackURL="+clientBackURL+"&"
				+ "EncryptType=1&InvoiceMark=N&ItemName="+itemName+"&"
				+ "MerchantID=2000132&MerchantTradeDate="+merchantTradeDate+"&"
				+ "MerchantTradeNo="+tradeNo+"&NeedExtraPaidInfo=N&"
				+ "PaymentType=aio&"
				+ "Redeem=N&ReturnURL=http://211.23.128.214:5000&"
				+ "TotalAmount="+totalAmount+"&TradeDesc="+tradeDesc+"&HashIV=v77hoKGq4kWxNNIS";
		String urlEncode = urlEncode(out).toLowerCase();
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
