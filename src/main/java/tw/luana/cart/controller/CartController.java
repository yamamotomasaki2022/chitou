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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.chitou.gmail.controller.GmailController;
import tw.chitou.gmail.model.GmailService;
import tw.chitou.util.ECPayHelper;
import tw.cocokang.attraction.model.Attraction;
import tw.cocokang.attraction.model.AttractionService;
import tw.cocokang.attraction.model.Pricingplan;
import tw.jacky.login.model.MemberBasicInfo;
import tw.jacky.login.model.MemberDetailInfo;
import tw.luana.attraction.model.AttractionService_Luana;
import tw.luana.cart.model.Cart;
import tw.luana.cart.model.CartService;
import tw.luana.order.model.OrderService;
import tw.weber.hotel.model.Reservation;
import tw.luana.order.model.AttractionOrderDetail;
import tw.luana.order.model.OrderList;

@Controller
@SessionAttributes({"memberbasicinfo","memberdetailinfo","TradeNo","paymentDate","TotalAmount","totalprice","checkOutCart"})
public class CartController {

	@Autowired
	private AttractionService aService;
	
	@Autowired
	private CartService cartService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private HttpSession session;
	
	@Autowired
	private GmailController gmailController;

	@Autowired
	private GmailService gService;

	String path_Luana_Atttraction = "luana/attraction/";
	String path_Luana_Cart = "luana/cart/";
	String path_Luana_Order = "luana/order/";

	// 商品加入購物車
	@GetMapping(path = "addToCart")
	@ResponseBody
	public boolean addToCart(@RequestParam("planId") int planId,
			@RequestParam("attractionId") int attractionId,
//			@RequestParam("memberid")int memberid,
			Model m) {

		MemberBasicInfo member = (MemberBasicInfo)m.getAttribute("memberbasicinfo");
		
		if(member == null) {
			return false;
		}
		
		Cart cart = new Cart();
		
		Pricingplan plan = aService.getSinglePlan(planId);
		Attraction attraction = aService.selectByAttid(attractionId);
		
		cart.setAttractionid(attractionId);
		cart.setAttractionname(attraction.getAttName());
		cart.setPlanid(planId);
		cart.setPlanname(plan.getPlanname());
		cart.setPlanfee(plan.getPlanfee());
		cart.setQuantity(1);
		cart.setMemberid(member.getMemberid());
		cartService.addToCart(cart);

		return true;

	}

	// 查看購物車
	@RequestMapping(path = "cart", method = RequestMethod.GET)
	public String showCart(	Model m) {
		MemberBasicInfo member = (MemberBasicInfo)m.getAttribute("memberbasicinfo");
		Integer memberid = member.getMemberid();
		
//		if(cartService.showCart(memberid).isEmpty()) {
//			return path_Luana_Cart + "Luana_cartEmpty";
//		}else {		
		m.addAttribute("cartList", cartService.showCart(memberid));
		return path_Luana_Cart + "Luana_cart";
//		}
	}

	// 移除購物車商品
	@RequestMapping(path = "removeFromCart", method = RequestMethod.POST)
	public String removeCartItem(@RequestParam("itemId") int itemId,
			//@RequestParam("memberid") int memberid,
			Model m) {

		MemberBasicInfo member = (MemberBasicInfo)m.getAttribute("memberbasicinfo");
		Integer memberid = member.getMemberid();
		
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

		MemberBasicInfo member = (MemberBasicInfo)m.getAttribute("memberbasicinfo");
		Integer memberid = member.getMemberid();
		
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

	//確認結帳內容
		@RequestMapping(path = "confirmBeforeCheckout", method = RequestMethod.POST)
		public String confirmBeforeCheckout(Model m) {
			MemberBasicInfo member = (MemberBasicInfo)m.getAttribute("memberbasicinfo");
			Integer memberid = member.getMemberid();
			
				m.addAttribute("cartList", cartService.showCart(memberid));
				return path_Luana_Cart + "Luana_cartCheckoutConfirm";
			
		}
	
	//整車購買
	@RequestMapping(path = "buyFromCart", method = RequestMethod.POST)
	public String buyFromCart(@RequestParam("totalPrice") String totalprice,Model m) {
		
		MemberBasicInfo member = (MemberBasicInfo)m.getAttribute("memberbasicinfo");
		Integer memberid = member.getMemberid();
		List<Cart> cartList = cartService.showCart(memberid);
		List<AttractionOrderDetail> checkOutCart = cartService.setCartPayment(cartList);
		String clientBackUrl = "http://localhost:8080/buySuccess";
		
		Date date = new Date();
		String OrderDay = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(date);
		
		String orderId = checkOutCart.iterator().next().getOrderid();
		String itemName = "購物車訂單";
		
		m.addAttribute("checkOutCart",checkOutCart);
		
		m.addAttribute("TradeNo",orderId);
		m.addAttribute("paymentDate",OrderDay);
		m.addAttribute("ItemName",itemName);
		m.addAttribute("TotalAmount",totalprice);
		m.addAttribute("ClientBackURL",clientBackUrl);
		ECPayHelper ecPayHelper = new ECPayHelper();
		String checkMacValue = ecPayHelper.getCheckValue(orderId, itemName,totalprice, OrderDay, "test", clientBackUrl);
		m.addAttribute("checkMacValue",checkMacValue);
				
		return "weber/front/ECpay";
	}
	
	//付款完存入資料庫
	@GetMapping(path = "buySuccess")
	private String success(Model model) {
		String orderid = (String)model.getAttribute("TradeNo");
		String OrderDay = (String)model.getAttribute("paymentDate");
		List<AttractionOrderDetail> checkOutCart = (List<AttractionOrderDetail>)model.getAttribute("checkOutCart");
		String totalprice = (String) model.getAttribute("TotalAmount");
		Integer totalInt = Integer.parseInt(totalprice);
		String orderTypeName = "景點";
		MemberBasicInfo member = (MemberBasicInfo)model.getAttribute("memberbasicinfo");
		MemberDetailInfo memberDetail = (MemberDetailInfo)model.getAttribute("memberdetailinfo");
		Integer memberid = member.getMemberid();
		
		OrderList orderList = new OrderList();
		
		orderList.setOrderid(orderid);
		orderList.setOrdertype(orderTypeName);
		orderList.setOrderdate(OrderDay);
		orderList.setOrderstatus("已付款");
		orderList.setTotalprice(totalInt);
		orderList.setMemberid(memberid);
		
		orderService.AttractionToOrder(checkOutCart);
		orderService.addToOrderList(orderList);
		
		List<String> toEmaiList = new ArrayList<String>();
//		toEmaiList.add(member.getEmail());
		toEmaiList.add("learningma0926@gmail.com");
	    String fromAddress = "eeit49chitougroup1@gmail.com";
	    String subject = "已確認您的訂單";
	    
	    StringBuilder builder = new StringBuilder();
	    for(AttractionOrderDetail aDetail : checkOutCart) {
	    	builder.append("<li>"+"名稱："+ aDetail.getAttractionname()+" "+aDetail.getPlanname()+"<br>數量："+aDetail.getQuantity()+"<br>價格："+aDetail.getPrice()+" 元</li>");
	    }
	    
	    String html = "<!DOCTYPE html>"
	    		+ "<html lang=\"en\">"
	    		
	    		+ "<head> <meta charset=\"UTF-8\"><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"><title>Document</title></head><body>"
	    		+ "<ul style=\"list-style:none\">"
	    		+ "<li>"
	    		+ memberDetail.getName()+" 您好，感謝在Chi Tou規劃您的旅程，以下是您本次的訂單內容："
	    		+ "</li><br>"
	    		+ "<li>"
	    			+ "訂單編號： "+ orderid
	    		+ "</li>"
	    		+ "<li>訂單項目："
	    			+ "<ul style=list-style:none>"
	    				+ builder
	   				+ "</ul>"
	   			+ "</li>"
    			+ "<li>"	    		
    				+ "總金額："+totalprice+" 元"
	    		+ "</li>"
	    		+ " <li>"
	    			+ "下訂時間："+OrderDay
	    		+ "</li>"
	    		+ "<li>"
	    			+ "Chi Tou祝您旅途愉快！"
	    		+ "</li>"
	    		+ "</ul>"
	    		+ "</body>"
	    		+ "</html>";
	    gService.mimemail(fromAddress, toEmaiList, subject, html);
		
		//結帳完成移除購物車品項
		cartService.clearCart(memberid);
		
		return "finish";
	}
	
	//確認購買信件
	public void sendOrderConfirmMail() {
		
	}


}
