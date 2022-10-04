package tw.luana.cart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.luana.attraction.model.AttractionService_Luana;
import tw.luana.cart.model.Cart;
import tw.luana.cart.model.CartService;
import tw.luana.order.model.OrderService;
import tw.luana.order.model.AttractionOrderDetail;
import tw.luana.order.model.OrderList;

@Controller
public class CartController {

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

	// 商品加入購物車
	@RequestMapping(path = "addToCart", method = RequestMethod.POST)
	public String addToCart(@RequestParam("planName") String planName, @RequestParam("planId") int planId,
			@RequestParam("planFee") int planFee, @RequestParam("quantity") int quantity,
			@RequestParam("attractionId") int attractionId,
			//@RequestParam("memberid")int memberid,
			@ModelAttribute Cart cart, Model m) {

		String attractionname = cartService.getAttractionName(attractionId);

		int memberid = 1;
		
		cart.setAttractionid(attractionId);
		cart.setAttractionname(attractionname);
		cart.setPlanid(planId);
		cart.setPlanname(planName);
		cart.setPlanfee(planFee);
		cart.setQuantity(quantity);
		cart.setMemberid(memberid);
		cartService.addToCart(cart);

		m.addAttribute("planList", attractionService.showAttractionPlans(attractionId));
		return path_Luana_Atttraction + "Luana_attractionPlans";

	}

	// 查看購物車
	@RequestMapping(path = "cart", method = RequestMethod.GET)
	public String showCart(
			//@RequestParam("memberid") int memberid,
			Model m) {

		int memberid = 1;
		
		m.addAttribute("cartList", cartService.showCart(memberid));

		return path_Luana_Cart + "Luana_cart";
	}

	// 移除購物車商品
	@RequestMapping(path = "removeFromCart", method = RequestMethod.POST)
	public String removeCartItem(@RequestParam("itemId") int itemId,
			//@RequestParam("memberid") int memberid,
			Model m) {

		int memberid = 1;
		
		cartService.removeCartItemfromcart(itemId);
		m.addAttribute("cartList", cartService.showCart(memberid));

		return path_Luana_Cart + "Luana_cart";
	}

	// 修改數量
	@RequestMapping(path = "changeQuant", method = RequestMethod.GET)
	public String changeQuantityInc(@RequestParam("count") String count, @RequestParam("itemId") Integer itemId,
			@RequestParam("quantity") Integer quantity,
			//@RequestParam("memberid") int memberid,
			Model m) {

		int memberid = 1;
		
		if (count.equals("inc")) {
			int newQuantity = ++quantity;
			cartService.updateQuantity(newQuantity, itemId);
		} else if (count.equals("dec") && quantity > 1) {
			int newQuantity = --quantity;
			cartService.updateQuantity(newQuantity, itemId);
		}
		m.addAttribute("cartList", cartService.showCart(memberid));
		return path_Luana_Cart + "Luana_cart";
	}

	//整車購買
	@RequestMapping(path = "buyFromCart", method = RequestMethod.POST)
	public String buyFromCart(@RequestParam("memberid") Integer memberid, @RequestParam("totalPrice") Integer totalprice, Model m,
			OrderList orderList) {

		String orderType = "A";
		String orderStatus = "1";
		String orderId = orderType + Long.toHexString(System.currentTimeMillis());
		
		Date date = new Date();
		String OrderDay = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
		
		//加入訂單總表
		orderList.setOrdertype(1);
		orderList.setOrderid(orderId);
		orderList.setOrderdate(OrderDay);
		orderList.setOrderstatus(orderStatus);
		orderList.setTotalprice(totalprice);
		
		orderService.addToOrderList(orderList);	
		
		//加入景點詳細訂單
		orderService.AttractionToOrder(memberid, orderId);
		
		//結帳完成移除購物車品項
		cartService.clearCart(memberid);
		
		m.addAttribute("cartList", cartService.showCart(memberid));
		
		return path_Luana_Cart + "Luana_cart";
	}

	// 單一購買景點方案
//	@RequestMapping(path = "buyIt",method = RequestMethod.POST)
//	public String buyFromCart(@RequestParam("planName") String planName,@RequestParam("attractionName") String attractionName,
//			@RequestParam("planId") int planId, @RequestParam("planFee") int planFee,
//			@RequestParam("quantity") int quantity, @RequestParam("attractionId") int attractionId,@RequestParam("itemId") int itemId, 
//			@ModelAttribute AttractionOrderDetail attrOrderDetail,
//			OrderList orderList,Model m) {
//		
//		String orderType = "A";
//		String orderId = orderType + Long.toHexString(System.currentTimeMillis());
//		
//		Date date = new Date();
//		String OrderDay = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
//		
//		orderList.setOrdertype(1);
//		orderList.setOrderId(orderId);
//		orderList.setOrderdate(OrderDay);
//		orderList.setOrderstatus("1");
//		orderList.setTotalprice(planFee);
//		
//		orderService.addToOrderList(orderList);
//		
//		attrOrderDetail.setOrderid(orderId);
//		attrOrderDetail.setAttractionid(attractionId);
//		attrOrderDetail.setAttractionname(attractionName);
//		attrOrderDetail.setPlanname(planName);
//		attrOrderDetail.setQuantity(quantity);
//		attrOrderDetail.setPrice(planFee);
//	
//		orderService.AttractionToOrder(attrOrderDetail);
//		
//		
//		cartService.removeCartItemfromcart(itemId);
//		m.addAttribute("cartList",cartService.showCart());
//		return path_Luana_Cart + "Luana_cart";
//	}

}
