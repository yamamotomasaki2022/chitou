package tw.luana.cart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
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
import tw.luana.order.model.Orders;

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
	
	
	
	//商品加入購物車
	@RequestMapping(path = "addToCart",method = RequestMethod.POST)
	public String addToCart(@RequestParam("planName") String planName,
			@RequestParam("planId") int planId, @RequestParam("planFee") int planFee,
			@RequestParam("quantity") int quantity, @RequestParam("attractionId") int attractionId, @ModelAttribute Cart cart,Model m) {

	 String attractionname	= cartService.getAttractionName(attractionId);
	 
		cart.setAttractionid(attractionId);
		cart.setAttractionname(attractionname);
		cart.setPlanid(planId);
		cart.setPlanname(planName);
		int totalPrice = planFee * quantity;
		cart.setPlanfee(totalPrice);
		cart.setQuantity(quantity);
		
		cartService.addToCart(cart);
		
		m.addAttribute("planList",attractionService.showAttractionPlans(attractionId));
		return path_Luana_Atttraction + "Luana_attractionPlans";
		
	}
	
	//查看購物車
	@RequestMapping(path = "cart",method = RequestMethod.GET)
	public String showCart(Model m) {

		m.addAttribute("cartList",cartService.showCart());

		return path_Luana_Cart + "Luana_cart";
	}

	//移除購物車商品
	@RequestMapping(path = "removeFromCart",method = RequestMethod.POST)
	public String removeCartItem(@RequestParam("itemId") int itemId,Model m) {

		cartService.removeCartItemfromcart(itemId);
		m.addAttribute("cartList",cartService.showCart());
		
		return path_Luana_Cart + "Luana_cart";
	}

	//從購物車購買
	@RequestMapping(path = "buyIt",method = RequestMethod.POST)
	public String buyFromCart(@RequestParam("planName") String planName,@RequestParam("attractionName") String attractionName,
			@RequestParam("planId") int planId, @RequestParam("planFee") int planFee,
			@RequestParam("quantity") int quantity, @RequestParam("attractionId") int attractionId,@RequestParam("itemId") int itemId, 
			@ModelAttribute Orders orders,Model m) {
		
		orders.setAttractionid(attractionId);
		orders.setAttractionname(attractionName);
		orders.setPlanid(planId);
		orders.setPlanname(planName);
		orders.setQuantity(quantity);
		orders.setPlanfee(planFee);
		orders.setOrderstatus(1);
		orders.setOrderdate(System.currentTimeMillis());
		
		orderService.addToOrder(orders);
		cartService.removeCartItemfromcart(itemId);
		m.addAttribute("cartList",cartService.showCart());
		
		return path_Luana_Cart + "Luana_cart";
	}
	
}
