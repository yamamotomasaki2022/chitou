package tw.trista.flightticket.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.regex.Matcher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import tw.cocokang.attraction.model.Attraction;
import tw.trista.flightticket.model.*;




@Controller
public class FlightTicketController {
	
	@Autowired
	private FlightTicketService flightservice;
	
	
	//http://localhost:8080/flightticket.main;

	//主畫面
	@GetMapping("/flightticket.main")
	public String processActionMain(Model m) {
		m.addAttribute("listFlightTicket",flightservice.getAll());
		return "trista/flightticket/flightTicket";
	} 
	
	//前往新增航班
	@GetMapping(path = "/addFlightTicket")
	public String newFlightticket(Model model) {
		FlightTicket flightTicket = new FlightTicket();
		model.addAttribute("flightticket",flightTicket);
		return "trista/flightticket/insertflight";
	}
	
	//新增航班
	@PostMapping("/addFlightTicketAction")
	public String insert(@ModelAttribute("flightticket") FlightTicket flightticket,
			@RequestParam("airline") String airline,@RequestParam("flightid") String flightid,
			@RequestParam("originid")String originID,@RequestParam("departuretime")String departureTime,
			@RequestParam("destinationid")String destinationID,@RequestParam("arrivaltime")String arrivalTime,
			@RequestParam("classid")String classID,@RequestParam("fare")Integer fare, Model m) { 
		m.addAttribute("flightticket", flightticket);
		flightservice.insert(flightticket);

		List<FlightTicket> flightticket1 = flightservice.getAll();
		m.addAttribute("listFlightTicket", flightticket1);
		return "trista/flightticket/flightTicket";
	}
	
	//前往修改航班
	@GetMapping("/updateFlightTicket")
	public String updateFlightticket(String flightid,Model m) {
		FlightTicket flightTicket1 = flightservice.selectByflightid(flightid);
		m.addAttribute("flightticket1",flightTicket1);
		return "trista/flightticket/updateflight";
	}
	//修改航班
	@PostMapping("/updateFlightTicketAction")
	public String processUpdateAction(@ModelAttribute("flightticket1") FlightTicket flightticket,
			@RequestParam("originid")String originid,@RequestParam("departuretime")String departuretime,
			@RequestParam("destinationid")String destinationid,@RequestParam("arrivaltime")String arrivaltime,
			@RequestParam("fare")Integer fare, Model m) { 
		
		FlightTicket originbean = flightservice.selectByflightid(flightticket.getFlightid());
		m.addAttribute("flightticket", flightticket);
		flightservice.updateOne(flightticket);
		
		List<FlightTicket> flightticket1 = flightservice.getAll();
		m.addAttribute("listFlightTicket", flightticket1);
		return "trista/flightticket/flightTicket";
	}
	
	//刪除航班	
	@GetMapping("/deleteFlightTicket")
	 public String processDeleteAction(@RequestParam("flightid") String flightid,Model m) {
	  if(flightid != null) {
		  flightservice.deleteOne(flightid);
	  }
	  List<FlightTicket> list = flightservice.getAll();
	  m.addAttribute("listFlightTicket", list);
	  return"trista/flightticket/flightTicket";
	 }
		
	//查詢航班
	@PostMapping("/searchFlightTicket")
	public String selectByFlightid(@RequestParam("search") String airline, Model m) {
		List<FlightTicket> list = flightservice.selectByAirline(airline);
		m.addAttribute("selectbyclassid", list);
		return "trista/flightticket/searchflight";
		 }
	}


