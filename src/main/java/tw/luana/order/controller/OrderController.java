package tw.luana.order.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.luana.attraction.model.AttractionService_Luana;


@Controller
public class OrderController {

	@Autowired
	private AttractionService_Luana attractionService;
	
	@Autowired
	private HttpSession session;
	
	
	//查看訂單
	@RequestMapping(path = "order", method = RequestMethod.GET)
	public String showOrders(Model m) {

		m.addAttribute("orders",attractionService.showOrders());

		return "Luana_order";
		
	}

	//更改訂單狀態
	@RequestMapping(path = "orderStatus", method = RequestMethod.POST)
	public String updateStatusByOrderId(@RequestParam("orderStatus") int orderStatus,
			@RequestParam("orderId") int orderId, Model m) {


		 attractionService.updateStatusByOrderId(orderStatus, orderId);
		m.addAttribute("orders",attractionService.showOrders());

		 return "Luana_order";
	}
	
}
