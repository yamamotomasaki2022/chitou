package tw.weber.hotel.controller;

import java.util.ArrayList;
import java.util.Collections;
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

import tw.jacky.login.model.MemberBasicInfo;
import tw.weber.hotel.model.FrontBookingService;
import tw.weber.hotel.model.Hotel;
import tw.weber.hotel.model.HotelforSearch;
import tw.weber.hotel.model.Room;
import tw.weber.hotel.model.RoomStyle;
import tw.weber.hotel.model.RoomStyleforSearch;

@Controller
@SessionAttributes("memberBean")
@RequestMapping(path = "/member")
public class HotelFrontController {

	@Autowired
	private FrontBookingService fService;
	
	private String suffix = "weber/front/";
	private String main = suffix + "FrontMain";
	private String searchPage = suffix + "SearchResult";
	private String hotelPage = suffix + "DisplayHotel";
	private String bookingPage = suffix + "orderHotel";
	
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
	private String bookingPage() {
		return bookingPage;
	}
	
	@GetMapping(path = "getAccountProfile")
	@ResponseBody
	private MemberBasicInfo getAccountProfile(Model model) {
		return (MemberBasicInfo)model.getAttribute("memberBean");
	}
	
	@GetMapping(path = "display")
	private String display() {
		return "Hotelstyle";
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
	
}
