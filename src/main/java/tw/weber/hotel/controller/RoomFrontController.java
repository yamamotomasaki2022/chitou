package tw.weber.hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.weber.hotel.model.RoomBookingService;

@Controller
public class RoomFrontController {

	@Autowired
	private RoomBookingService bService;
	
	private String suffix = "weber/room/";
	private String main = suffix + "roomFront";
	
	@GetMapping(path = "hotel")
	private String frontPage() {
		return main;
	}
	
	@GetMapping(path = "searchHotelFront")
	@ResponseBody
	private String searchFront(@RequestParam("date")String date) {
		return date;
	}
}
