package tw.luana.cart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import tw.Luana.model.*;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

//@Controller
public class AttractionController {

	@Autowired
	private AttractionService attractionService;
	
	@Autowired
	private HttpSession session;
	
	
	@RequestMapping(path = "/index", method = RequestMethod.GET)
	public String processMainAction() {
		return "Luana_index";
	}	
	
	//顯示所有景點
	@RequestMapping(path = "allAttractions", method = RequestMethod.GET)
	public String showAllAttraction(Model m) {
		m.addAttribute("allAttractions",attractionService.showAllAttractions());
		return "Luana_allAttractions";
	}
	
	//搜尋景點
	@RequestMapping(path = "searchAttractionReasults",params = {"attraction"}, method = RequestMethod.POST)
	public String searchResults(@RequestParam("attraction") String attraction,Model m)
			 {
		
		m.addAttribute("searchReasults",attractionService.searchAttraction(attraction));		
		return "Luana_searchAttractionReasults";

	}
	
	//顯示景點內方案
	@RequestMapping(path = "showAttractionPlans",params = {"attractionId"}, method = RequestMethod.POST)
	public String attractionPlans(@RequestParam("attractionId") int attractionId ,Model m){

		m.addAttribute("planList",attractionService.showAttractionPlans(attractionId));

		return "Luana_attractionPlans";

	}
	
	//商品加入購物車
	@RequestMapping(path = "addToCart",method = RequestMethod.POST)
	public String addToCart(@RequestParam("planName") String planName,
			@RequestParam("planId") int planId, @RequestParam("planFee") int planFee,
			@RequestParam("quantity") int quantity, @RequestParam("attractionId") int attractionId, Cart cart,Model m) {

		attractionService.addToCart(attractionId, planId, planName, planFee, quantity);
		m.addAttribute("planList",attractionService.showAttractionPlans(attractionId));
		return "Luana_attractionPlans";
		
	}
	
	//查看購物車
	@RequestMapping(path = "cart",method = RequestMethod.GET)
	public String showCart(Model m) {

		m.addAttribute("cartList",attractionService.showCartItems());

		return "Luana_cart";
	}

	//移除購物車商品
	@RequestMapping(path = "removeFromCart",method = RequestMethod.POST)
	public String removeCartItem(@RequestParam("itemId") int itemId,Model m) {

		attractionService.removeCartItem(itemId);
		m.addAttribute("cartList",attractionService.showCartItems());
		
		return "Luana_cart";
	}

	public void changeItemQuantity(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String count = request.getParameter("action");
		int planId = Integer.parseInt(request.getParameter("id"));

		ArrayList<Cart> cartList = (ArrayList<Cart>) request.getSession(true).getAttribute("cartList");
		if (planId >= 1) {
			if (count.equals("inc")) {
				for (Cart ct : cartList) {
					if (ct.getPlanId() == planId) {
						int quantity = ct.getQuantity();
						quantity++;
						System.out.println(quantity + "++");
						ct.setQuantity(quantity);
					}
					request.getRequestDispatcher("/Luana_cart.jsp").forward(request, response);
				}
			}
			if (count.equals("dec")) {
				for (Cart ct : cartList) {
					if (ct.getPlanId() == planId) {
						int quantity = ct.getQuantity();
						quantity--;
						System.out.println(quantity + "--");
						ct.setQuantity(quantity);
						break;
					}
				}
				request.getRequestDispatcher("/Luana_cart.jsp").forward(request, response);
			}

		} else {
			try {
				request.getRequestDispatcher("/Luana_cart.jsp").forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}

		}

	}
	
	//從購物車購買
	@RequestMapping(path = "buyIt",method = RequestMethod.POST)
	public String buyFromCart(@RequestParam("planName") String planName,@RequestParam("attractionName") String attractionName,
			@RequestParam("planId") int planId, @RequestParam("planFee") int planFee,
			@RequestParam("quantity") int quantity, @RequestParam("attractionId") int attractionId,@RequestParam("itemId") int itemId, Orders orders,Model m) {
		
		attractionService.buyIt(attractionId, planId, attractionName, planName, planFee, quantity);
		attractionService.removeCartItem(itemId);
		m.addAttribute("cartList",attractionService.showCartItems());

		return "Luana_cart";
	}
	
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
