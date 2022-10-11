package tw.trista.flightticket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.trista.flightticket.model.FlightTicket;
import tw.trista.flightticket.model.FlightTicketService;

@Controller
public class FlightTicketFrontController {

	@Autowired
	private FlightTicketService ffservice;
	
	//http://localhost:8080/chitou.flightticket;
	
	//前台主畫面
	@GetMapping("/chitou.flightticket")
	public String processActionMain(Model m) {
		m.addAttribute("listFlightTicket",ffservice.getAll());
		return "trista/front/front";
	} 
	
	//前台前往查詢航班
//	@PostMapping("/searchFlightTicket")
//	public String selectByFlightid(@RequestParam("originid") String originid,@RequestParam("destinationid") String destinationid,@RequestParam("departuretime") String departuretime,@RequestParam("arrivaltime") String arrivaltime, Model m) {
//		List<FlightTicket> list = ffservice.selectByAirline(originid,destinationid,departuretime,arrivaltime);
//		m.addAttribute("selectbyclassid", list);
//		return "trista/flightticket/searchflight";
//		 }
	
	//前台查詢航班
	@PostMapping("/frontsearchflightticket")
		public String processSearchAction(@RequestParam("originid")String originid,@RequestParam("destinationid")String destinationid,
										  @RequestParam("departuretime")String departuretime,@RequestParam("arrivaltime")String arrivaltime,Model m) {
			if(originid != null && destinationid != null && departuretime != null && arrivaltime != null ) {
				ffservice.findByOriginidAndDestinationidAndDeparturetimeAndArrivaltime(originid, destinationid, departuretime, arrivaltime);
			}
			List<FlightTicket> list = ffservice.findByOriginidAndDestinationidAndDeparturetimeAndArrivaltime(originid, destinationid, departuretime, arrivaltime);
			m.addAttribute("searchflight", list);
			return "trista/front/frontsearchflight";
			 }
	
	//前台新增航班訂單
	@GetMapping(path = "/addFlightTicketOrder")
	public String newFlightticket(Model model) {
		FlightTicket flightTicket = new FlightTicket();
		model.addAttribute("flightticket",flightTicket);
		return "trista/front/frontinsertflight";
	}
}
