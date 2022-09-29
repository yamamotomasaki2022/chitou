package tw.weber.hotel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.weber.hotel.model.FrontBookingService;
import tw.weber.hotel.model.Room;

@Controller
public class HotelFrontController {

	@Autowired
	private FrontBookingService fService;
	
	private String suffix = "weber/front/";
	private String main = suffix + "FrontMain";
	private String searchPage = suffix + "SearchResult";
	
	@GetMapping(path = "hotel")
	private String frontPage() {
		return main;
	}
	
	@GetMapping(path = "searchHotel")
	private String searchFront(@RequestParam("dateStart")String dateStart,
								@RequestParam("dateEnd")String dateEnd,
								@RequestParam("destination")String destination,
								@RequestParam("number")int number,Model model) {
		List<Room> result = fService.crazy();
		model.addAttribute("result",result);
		return searchPage;
	}
}
