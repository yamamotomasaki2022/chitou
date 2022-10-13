package tw.luana.order.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import javax.servlet.*;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.jacky.login.model.MemberBasicInfo;
import tw.luana.attraction.model.AttractionService_Luana;
import tw.luana.cart.model.Cart;
import tw.luana.cart.model.CartService;
import tw.luana.order.model.AttractionOrderDetail;
import tw.luana.order.model.OrderList;
import tw.luana.order.model.OrderService;
import tw.weber.hotel.model.Hotel;
import tw.weber.hotel.model.Reservation;

@Controller
@SessionAttributes({ "memberbasicinfo" })
public class OrderController {

	@Autowired
	private AttractionService_Luana attractionService;

	@Autowired
	private CartService cartService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private HttpSession session;

	String path_Luana_Atttraction = "luana/attraction/";
	String path_Luana_Cart = "luana/cart/";
	String path_Luana_Order = "luana/order/";

	// 查看個人所有訂單
	@RequestMapping(path = "order", method = RequestMethod.GET)
	public String showOrders(Model m) {

		MemberBasicInfo member = (MemberBasicInfo) m.getAttribute("memberbasicinfo");
		Integer memberid = member.getMemberid();

		m.addAttribute("orders", orderService.showOrderLists(memberid));

		return path_Luana_Order + "Luana_order";

	}

	// 查看訂單細項
	@RequestMapping(path = "orderDetail", method = RequestMethod.POST)
	public String OrderDetail(@RequestParam("orderid") String orderid,@RequestParam("ordertype") String ordertype, Model m1, Model m2) {
		//訂單基本資訊
		m1.addAttribute("orderList", orderService.showSingleOrderList(orderid));
		
		if(ordertype.equals("景點")) {
			m2.addAttribute("aOrderDetail", orderService.showAttractionOrders(orderid));
			return path_Luana_Order + "Luana_attractionOrderDetail";
		
		}else if (ordertype.equals("飯店")) {
			m2.addAttribute("hOrderDetail", orderService.showHotelOrders(orderid));
			return path_Luana_Order + "Luana_hotelOrderDetail";
		
		}else if (ordertype.equals("機票")) {
			return path_Luana_Order + "Luana_flightOrderDetail";
		}
		
		//詳細內容
		return null;
	}


//後台

	// 查看所有訂單
	@RequestMapping(path = "backOrderList", method = RequestMethod.GET)
	public String backOrderList(Model m) {
		List<OrderList> list = orderService.backOrderLists();
//		Collections.sort(list,Collections.reverseOrder()); 
		m.addAttribute("orderBack", list);

		return path_Luana_Order + "orderBack";
	}

	// 查看特定種類訂單
	@RequestMapping(path = "showOrderlistInType", method = RequestMethod.POST)
	public String showOrderlistInType(@RequestParam("type") String type, Model m) {

		if (type.equals("all")) {
			List<OrderList> list = orderService.backOrderLists();
			m.addAttribute("orderBack", list);
		} else {
			List<OrderList> list = orderService.listInType(type);
			m.addAttribute("orderBack", list);
		}

		return path_Luana_Order + "orderBack";
	}

	// 查看景點訂單詳細資料
	@RequestMapping(path = "attractionOrderDetail", method = RequestMethod.POST)
	@ResponseBody
	public List<AttractionOrderDetail> showAttractionOrderDetails(@RequestParam("orderid") String orderid) {
		System.err.println("orderid: " + orderid);
		System.out.println(orderService.showAttractionOrders(orderid));
		return orderService.showAttractionOrders(orderid);
	}

	// 查看飯店訂單詳細資料
	@RequestMapping(path = "hotelOrderDetail", method = RequestMethod.POST)
	@ResponseBody
	public List<Reservation> showHotelOrderDetail(@RequestParam("orderid") String orderId) {
		System.err.println("orderid: " + orderId);
		System.err.println(orderService.showHotelOrders(orderId));

		return orderService.showHotelOrders(orderId);
	}

	// 更新訂單狀態
	@RequestMapping(path = "updateOrderStatus", method = RequestMethod.POST)
	@ResponseBody
	public boolean updateUrderStatus(@RequestParam("orderid") String orderId,
			@RequestParam("orderStatus") String orderStatus, Model m) {
		// 更新
		// m.addAttribute("orderBack", orderService.backOrderLists());//重新載入訂單

		// return path_Luana_Order + "orderBack";
		return orderService.updateOrderStatus(orderStatus, orderId);
	}

	// 條件查詢訂單
	@RequestMapping(path = "searchOrder", method = RequestMethod.GET)
	public String SearchByKeyword(@RequestParam("type") String type, @RequestParam("keyword") String keyword,
			Model model) {

		System.err.println("type: " + type);
		System.err.println("keyword: " + keyword);

		List<OrderList> searchResult = orderService.findOrderList(type, keyword);
		model.addAttribute("orderBack", searchResult);

		System.err.println("orderBack: " + model);
		return path_Luana_Order + "orderBack";
	}

}