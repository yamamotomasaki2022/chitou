package tw.trista.flightticket.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;

import org.hibernate.sql.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import net.bytebuddy.asm.Advice.This;
import tw.chitou.gmail.controller.GmailController;
import tw.jacky.login.model.MemberBasicInfo;
import tw.luana.order.model.OrderList;
import tw.luana.order.model.OrderService;
import tw.trista.flightticket.model.FlightTicket;
import tw.trista.flightticket.model.FlightTicketService;
import tw.trista.flightticket.model.flightticketorder;
import tw.trista.flightticket.model.flightticketorderservice;

@Controller
@SessionAttributes("memberbasicinfo")
public class FlightTicketFrontController {

	@Autowired
	private FlightTicketService ffservice;
	
	@Autowired
	private flightticketorderservice ooservice;
	
	@Autowired
	private OrderService orderService;
	
	
	@Autowired 
	GmailController gmailController;
	
	
	public String company;
	public String id;
	public int cla;
	public String flight;
	public String depart;
	public String destination;
	public String arrival;
	public int price;
	
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
			flight = list.get(0).getOriginid();
			System.out.println(flight);
			depart = list.get(0).getDeparturetime();
			System.out.println(depart);
			destination = list.get(0).getDestinationid();
			System.out.println(destination);
			arrival = list.get(0).getArrivaltime();
			System.out.println(arrival);
			price = list.get(0).getFare();
			System.out.println(price);
			company = list.get(0).getAirline();
			System.out.println(company);
			id = list.get(0).getFlightid();
			System.out.println(id);
			cla = list.get(0).getClassid();
			System.out.println(cla);
			return "trista/front/frontsearchflight";
			 }
	
	//前往前台新增航班訂單
		@GetMapping("/frontaddorder")
		public String frontaddFlightticket(String flightid,Model m) {
			FlightTicket flightTicket1 = ffservice.selectByflightid(flightid);
			//System.out.println(flightTicket1);
			
			m.addAttribute("flightticket1",flightTicket1);
			return "trista/front/frontinsertflight";
		}
		
	//前台新增航班訂單
	@GetMapping(path = "/frontaddFlightTicket")
	public String processUpdateAction(@ModelAttribute("flightticketorder") flightticketorder flightticketorder, Model m) {
		//System.out.println(flightticket);
		//System.out.println(flightticket.getOriginid());
		
		/*FlightTicket originbean = ffservice.selectByflightid(flightticket.getFlightid());
		model.addAttribute("flightticket", flightticket);
		ffservice.updateOne(flightticket);*/

		//FlightTicket flightTicket = new FlightTicket();
		//flightTicket.setFlightid(flight);

		
		/*System.out.println(flight);
		System.out.println("111");
		System.out.println(flightTicket.getFlightid());*/
		flightticketorder.setOriginid(flight);
		flightticketorder.setDeparturetime(depart);
		flightticketorder.setDestinationid(destination);
		flightticketorder.setArrivaltime(arrival);
		flightticketorder.setFare(price);
		flightticketorder.setAirline(company);
		flightticketorder.setFlightid(id);
		flightticketorder.setClassid(cla);
		m.addAttribute("flightticketorder",flightticketorder);
		return "trista/front/frontinsertflight";
	}
	
	//結帳
	@PostMapping("/addFlightTicketOrder")
	public String insert(@ModelAttribute("flightticketorder") flightticketorder flightorderbean,
			 Model m,OrderList orderList) { 
		
		MemberBasicInfo memberBasicInfo = (MemberBasicInfo)m.getAttribute("memberbasicinfo");
		
		System.out.println("我的會員編號:" + memberBasicInfo.getMemberid()+"********************************************");
		String orderTypeName = "機票";
		String orderType = "F";
		String orderStatus = "已付款";
		String orderId = orderType + Long.toHexString(System.currentTimeMillis());
		
		Date date = new Date();
		String OrderDay = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
		
		//加入訂單總表
		orderList.setOrdertype(orderTypeName);
		orderList.setOrderid(orderId);
		orderList.setOrderdate(OrderDay);
		orderList.setOrderstatus(orderStatus);
		orderList.setTotalprice(flightorderbean.getFare());
		orderList.setMemberid(memberBasicInfo.getMemberid());
		
		orderService.addToOrderList(orderList);	
		//m.addAttribute("flightticket", flightorderbean);
		flightorderbean.setOrderid(orderId);
//		flightorderbean.setMember(memberBasicInfo);
		ooservice.insert(flightorderbean);
		gmailController.sendEmailFlightTicket(flightorderbean.getLastname(),flightorderbean.getEmailaddress());
		
		
		m.addAttribute("ordersuccess",1);

//		List<FlightTicket> flightticket1 = ooservice.getAll();
//		m.addAttribute("listFlightTicket", flightticket1);
		return "trista/front/frontsearchflight";
	}
}
