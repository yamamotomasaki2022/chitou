package tw.luana.attraction.controller;

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
public class AttractionController_Luana {

	@Autowired
	private AttractionService_Luana attractionService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private HttpSession session;

	
	//顯示所有景點
	@RequestMapping(path = "allAttractions", method = RequestMethod.GET)
	public String showAllAttraction(Model m) {
		m.addAttribute("allAttractions",attractionService.showAllAttractions());
		return "luana/attraction/Luana_allAttractions";
	}
	
	//搜尋景點
	@RequestMapping(path = "searchAttractionReasults",params = {"attraction"}, method = RequestMethod.POST)
	public String searchResults(@RequestParam("attraction") String attraction,Model m)
			 {
		
		m.addAttribute("searchReasults",attractionService.searchAttraction(attraction));		
		return "luana/attraction/Luana_searchAttractionReasults";

	}
	
	//顯示景點內方案
	@RequestMapping(path = "showAttractionPlans",params = {"attractionId"}, method = RequestMethod.POST)
	public String attractionPlans(@RequestParam("attractionId") int attractionId ,Model m){

		m.addAttribute("planList",attractionService.showAttractionPlans(attractionId));

		return "luana/attraction/Luana_attractionPlans";

	}
	
}
