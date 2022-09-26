package tw.weber.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RoomBookingController {
	
	private String suffix = "weber/bookRoom/";
	private String main = suffix + "simpleBooking" ;
	
	
	
	@GetMapping(path = "/booking")
	public String bookingMain() {
		return main;
	}
}
