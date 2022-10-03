package tw.weber.hotel.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;
import tw.jacky.login.model.MemberBasicInfo;
import tw.weber.hotel.model.FrontBookingService;
import tw.weber.hotel.model.Hotel;
import tw.weber.hotel.model.HotelforSearch;
import tw.weber.hotel.model.Room;
import tw.weber.hotel.model.RoomStyle;
import tw.weber.hotel.model.RoomStyleforSearch;

@Controller
@SessionAttributes({"memberbasicinfo","memberdetailinfo","roomForCheckout"})
//@RequestMapping(path = "/member")
public class HotelFrontController {

	@Autowired
	private FrontBookingService fService;
	
	private String suffix = "weber/front/";
	private String main = suffix + "FrontMain";
	private String searchPage = suffix + "SearchResult";
	private String hotelPage = suffix + "DisplayHotel";
	private String bookingPage = suffix + "orderHotel";
	private String finishOrderPage = suffix + "ShowOrderContent";
	
	@GetMapping(path = "hotel")
	private String frontPage() {
		return main;
	}
	
	@GetMapping(path = "searchHotel")
	private String searchFront(@RequestParam("dateStart")String dateStart,
								@RequestParam("dateEnd")String dateEnd,
								@RequestParam("destination")String destination,
								@RequestParam("number")int number,Model model) {
		List<HotelforSearch> result = fService.crazy(dateStart,dateEnd,destination,number);
		model.addAttribute("result",result);
		model.addAttribute("dateStart",dateStart);
		model.addAttribute("dateEnd",dateEnd);
		model.addAttribute("destination",destination);
		model.addAttribute("number",number);
		return searchPage;
	}
	
	@GetMapping(path = "searchAjax")
	@ResponseBody
	private List<HotelforSearch> searchAjax(@RequestParam("dateStart")String dateStart,
											@RequestParam("dateEnd")String dateEnd,
											@RequestParam("destination")String destination,
											@RequestParam("number")int number){
		
		return fService.crazy(dateStart, dateEnd, destination, number);
	}
	
	@GetMapping(path = "searchHotelRoomAjax")
	@ResponseBody
	private List<RoomStyleforSearch> searchHotelAjax(@RequestParam("dateStart")String dateStart,
												@RequestParam("dateEnd")String dateEnd,
												@RequestParam("hotelID")int hotelID,
												@RequestParam("number")int number){
		System.err.println("阿斯");
		return fService.getRoomStyle(dateStart, dateEnd, hotelID, number);
	}
	
	@GetMapping(path = "hotelPage")
	private String displayHotelPage(@RequestParam("dateStart")String dateStart,
									@RequestParam("dateEnd")String dateEnd,
									@RequestParam("number")int number,
									@RequestParam("hotelID")int hotelID,Model model) {
		model.addAttribute("dateStart",dateStart);
		model.addAttribute("dateEnd",dateEnd);
		model.addAttribute("number",number);
		model.addAttribute("hotelID",hotelID);
		Hotel hotel = fService.selectHotel(hotelID);
		model.addAttribute("hotel",hotel);
		return hotelPage;
	}
	
	@GetMapping(path = "bookingPage")
	private String bookingPage(@RequestParam("roomStyleID")int roomstyleID,
							   @RequestParam("hotelID")int hotelID,
							   @RequestParam("dateStart")String dateStart,
							   @RequestParam("dateEnd")String dateEnd,
							   @RequestParam("number")int number,Model model) {
		Hotel hotel = fService.selectHotel(hotelID);
		RoomStyle style = fService.findRoomData(roomstyleID);
		model.addAttribute("hotel",hotel);
		model.addAttribute("style",style);
		model.addAttribute("checkInDate",dateStart);
		model.addAttribute("checkOutDate",dateEnd);
		model.addAttribute("number",number);
		return bookingPage;
	}
	
	@GetMapping(path = "getAccountProfile")
	@ResponseBody
	private MemberBasicInfo getAccountProfile(Model model) {
		return (MemberBasicInfo)model.getAttribute("memberbasicinfo");
	}
	
	@GetMapping(path = "form")
	private String display() {
		return suffix+"form";
	}
	
	@GetMapping(path = "yee")
	private String yee() {
		return "NewHome";
	}
	@GetMapping(path = "test/test")
	@ResponseBody
	private Hotel test() {
		return fService.selectHotel(1);
	}
	
	@PostMapping(path = "getECPay")
	@ResponseBody
	private String getECPay(@RequestParam("TotalAmount")String totalAmount,
							@RequestParam("ItemName")String itemName) {
		AllInOne all = new AllInOne("");
		AioCheckOutOneTime creditCardPay = new AioCheckOutOneTime();
		String merchantTradeNo = "HotelBooking" + System.currentTimeMillis();
		creditCardPay.setMerchantTradeNo(merchantTradeNo);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		creditCardPay.setMerchantTradeDate(dtf.format(LocalDateTime.now()));
		creditCardPay.setTotalAmount(totalAmount);
		creditCardPay.setTradeDesc("test Description");
		creditCardPay.setItemName(itemName);
		creditCardPay.setClientBackURL("http://localhost:8080/returnAfterSuccess");
		creditCardPay.setReturnURL("http://211.23.128.214:5000");
		creditCardPay.setNeedExtraPaidInfo("N");
//		creditCardPay.setOrderResultURL("http://localhost:8080/home");
		creditCardPay.setRedeem("N");
		String checkoutPage = all.aioCheckOut(creditCardPay, null);
		return checkoutPage;
	}
	
	@GetMapping(path = "returnAfterSuccess")
	private String success() {
		return finishOrderPage;
	}
	
//	@PostMapping(path="CheckMacValueForEC")
//	@ResponseBody
//	private String checkMacValue() {
//		System.out.println("被檢查了");
//		return "1|OK";
//	}
	
//	@GetMapping(path = "getECpay")
//	@ResponseBody
//	private String getECPay() {
//		AllInOne all = new AllInOne("");
//		AioCheckOutOneTime creditCardPay = new AioCheckOutOneTime();
//		creditCardPay.setMerchantTradeNo("testCompany0009");
//		creditCardPay.setMerchantTradeDate("2017/01/01 08:05:23");
//		creditCardPay.setTotalAmount("50");
//		creditCardPay.setTradeDesc("test Description");
//		creditCardPay.setItemName("TestItem");
//		creditCardPay.setReturnURL("http://211.23.128.214:5000");
//		creditCardPay.setNeedExtraPaidInfo("N");
//		creditCardPay.setRedeem("Y");
//		String form = all.aioCheckOut(creditCardPay, null);
//		return form;
//	}
	
}
