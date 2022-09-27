package tw.trista.flightticket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.trista.flightticket.model.FlightTicketService;


import tw.trista.flightticket.model.FlightTicket;



@Controller
@Transactional
public class FlightTicketController {
	

	
	@Autowired
	private FlightTicketService flightservice;
	
	//http://localhost:8080/flightticket.main;
	
	@RequestMapping(path = "/flightticket.main",method = RequestMethod.GET)
	public String processActionMain(Model m) {
		FlightTicket fly1 = new FlightTicket();
		m.addAttribute("flightTicket",fly1);
		return "trista/flightticket/flightTicket";
	} 
	
	//新增航班
	@RequestMapping(path = "/addFlightTicket",method = RequestMethod.POST)
	public String processInsertAction(@ModelAttribute("flightticket") FlightTicket fly, BindingResult result, Model m) {
		m.addAttribute("flightticket",fly);
		flightservice.insert(fly);
		

		List<FlightTicket> list = (List<FlightTicket>)flightservice.selectAll();
		m.addAttribute("insertflight", list);
		return "trista/flightticket/thanksFlight";
	}
	
	//修改航班
	@PostMapping(path = "/updateFlightTicket")
	public String processUpdateAction(@RequestParam("flightID") String flightID,@RequestParam("newfare") Integer fare,Model m) {
		FlightTicket ft = flightservice.selectByFlightid(flightID);
		FlightTicket ft_2 = new FlightTicket(ft.getFlightID(), ft.getClassID(), ft.getDepartureTime(), ft.getArrivalTime(), fare, ft.getAirline(),
				ft.getOriginID(), ft.getDestinationID());
		List<FlightTicket> selectAll = flightservice.selectAll();
		m.addAttribute("updateflight",selectAll);
		flightservice.updateOne(ft_2);
		return "trista/flightticket/thanksUpdate";
	}
	
	//刪除航班	
	@PostMapping(path = "/deleteFlightTicket")
	 public String processDeleteAction(@RequestParam("flightID") String flightID,Model m) {
	  if(flightID != null) {
		  flightservice.deleteOne(flightID);
	  }
	  List<FlightTicket> list = (List<FlightTicket>)flightservice.selectAll();
	  m.addAttribute("deleteflight", list);
	  return"trista/flightticket/thanksDelete";
	 }
		
	//查詢航班
	@RequestMapping(path = "/searchFlightTicket",method = RequestMethod.POST)
	public String processSearchAction(@RequestParam("originID")String originID,@RequestParam("destinationID")String destinationID,
									  @RequestParam("departureTime")String departureTime,@RequestParam("arrivalTime")String arrivalTime,
									  @RequestParam("classID")String classID,Model m) {
		if(originID != null && destinationID != null && departureTime != null && arrivalTime != null && classID != null ) {
			flightservice.findByOriginidAndDestinationidAndDeparturetimeAndArrivaltimeAndClassid(originID, destinationID, departureTime, arrivalTime, Integer.parseInt(classID));
		}
		List<FlightTicket> list = flightservice.findByOriginidAndDestinationidAndDeparturetimeAndArrivaltimeAndClassid(originID, destinationID, departureTime, arrivalTime, Integer.parseInt(classID));
		m.addAttribute("searchflight", list);
		return "trista/flightticket/thanksRead";
		 }
	}


