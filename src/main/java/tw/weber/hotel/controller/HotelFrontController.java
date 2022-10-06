package tw.weber.hotel.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;
import tw.chitou.util.ECPayHelper;
import tw.jacky.login.model.MemberBasicInfo;
import tw.jacky.login.model.MemberDetailInfo;
import tw.luana.order.model.OrderList;
import tw.luana.order.model.OrderService;
import tw.weber.hotel.model.FrontBookingService;
import tw.weber.hotel.model.Hotel;
import tw.weber.hotel.model.HotelforSearch;
import tw.weber.hotel.model.Reservation;
import tw.weber.hotel.model.Room;
import tw.weber.hotel.model.RoomStyle;
import tw.weber.hotel.model.RoomStyleforSearch;

@Controller
@SessionAttributes({"memberbasicinfo","memberdetailinfo","CheckoutRoom"})
//@RequestMapping(path = "/member")
public class HotelFrontController {

	@Autowired
	private FrontBookingService fService;
	
	@Autowired
	private OrderService oService;
	
	private String suffix = "weber/front/";
	private String main = suffix + "FrontMain";
	private String searchPage = suffix + "SearchResult";
	private String hotelPage = suffix + "DisplayHotel";
	private String bookingPage = suffix + "orderHotel";
	private String finishOrderPage = suffix + "CheckoutInfo";
	
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
		System.err.println("ajax搜尋房間");
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
		RoomStyle style = fService.findStyle(dateStart,dateEnd,roomstyleID,number);
		Room room = fService.findEmptyRoom(dateStart, dateEnd, roomstyleID);
		model.addAttribute("hotel",hotel);
		model.addAttribute("style",style);
		model.addAttribute("room",room);
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
	
	@GetMapping(path = "getAccountDetail")
	@ResponseBody
	private MemberDetailInfo getAccountDetail(Model model) {
		return (MemberDetailInfo)model.getAttribute("memberdetailinfo");
	}
	
	@GetMapping(path = "member/yee")
	private String yee() {
		return "NewHome";
	}
	
	@PostMapping(path = "getECPay")
	@ResponseBody
	private String getECPay(@RequestBody Reservation reservation,Model model) {
		String tradeNo = "B"+Long.toHexString(System.currentTimeMillis());
		reservation.setOrderId(tradeNo);
		model.addAttribute("CheckoutRoom",reservation);
		ECPayHelper ecPayHelper = new ECPayHelper();
		String clientBackUrl = "http://localhost:8080/returnAfterSuccess";
		String checkoutPage = ecPayHelper.getECpayPage(tradeNo, reservation.getTotalAmount(), reservation.getRoomName(),clientBackUrl);
		return checkoutPage;
	}
	
	@GetMapping(path = "returnAfterSuccess")
	private String success(Model model) {
		Reservation checkOutRoom = (Reservation)model.getAttribute("CheckoutRoom");
		checkOutRoom.setOrderStatus("已付款");
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		checkOutRoom.setPaymentDate(dtf.format(LocalDateTime.now()));
		Reservation result = fService.finalCheckOut(checkOutRoom);
		OrderList orderList = new OrderList();
		orderList.setMemberid(result.getMemberID());
		orderList.setOrderdate(result.getPaymentDate());
		orderList.setOrderid(result.getOrderId());
		orderList.setOrderstatus(result.getOrderStatus());
		orderList.setOrdertype("飯店");
		orderList.setTotalprice(Integer.parseInt(result.getTotalAmount()));
		oService.addToOrderList(orderList);
		model.addAttribute("checkOutRoom",result);
		return finishOrderPage;
	}
	
	@PostMapping(path="CheckMacValueForEC")
	@ResponseBody
	private String checkMacValue() {
		System.out.println("被檢查了");
		return "1|OK";
	}
	
	
}
