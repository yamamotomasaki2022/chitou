package tw.luana.order.model;

import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.luana.cart.model.Cart;
import tw.luana.cart.model.CartRepository;
import tw.luana.order.model.AttractionOrderDetailRepository;
import tw.weber.hotel.model.Reservation;


@Service
@Transactional
public class OrderService {
	
	@Autowired
	private CartRepository cartRepository;
	
	@Autowired
	private OrderListRepository orderListRepository;
	
	@Autowired
	private AttractionOrderDetailRepository attractionOrderRepository;
	
	@Autowired
	private HotelOrderRepository hotelOrderRepository;
	
	
//訂單總表
	
	//加入訂單總表
	public void addToOrderList(OrderList orderList) {
		
		orderListRepository.save(orderList);
	}
	
	//顯示個人訂單
	public List<OrderList> showOrderLists(Integer memberid){
		return orderListRepository.findAllByMemberid(memberid);
	}
	
	//顯示單筆訂單資訊
	public List<OrderList> showSingleOrderList(String orderid) {
		return orderListRepository.findByOrderid(orderid);
	}

//景點
	
	//加入景點訂單
	public void AttractionToOrder(Integer memberid,String orderid) {		
		List<Cart> cartItem = cartRepository.findByMemberid(memberid);
		System.out.println("AttractionToOrder"+cartItem);
		for(Cart cart : cartItem) {
			AttractionOrderDetail aOrderDetail =  new AttractionOrderDetail();
			aOrderDetail.setOrderid(orderid);
			aOrderDetail.setAttractionid(cart.getAttractionid());
			aOrderDetail.setAttractionname(cart.getAttractionname());
			aOrderDetail.setPlanname(cart.getPlanname());
			aOrderDetail.setQuantity(cart.getQuantity());
			aOrderDetail.setPrice(cart.getQuantity()*cart.getPlanfee());
			attractionOrderRepository.save(aOrderDetail);
		}
	}
	
	//顯示景點詳細訂單
	public List<AttractionOrderDetail> showAttractionOrders(String orderid) {
		return attractionOrderRepository.findAllByOrderid(orderid);
	}
	
	//更新訂單資料
	public void updateAttractionOrderStatus(Integer status, Integer orderid) {
		
//		AttractionOrderDetail attractionOrder = attractionOrderRepository.findByOrderid(orderid);
//		attractionOrder.setOrderstatus(status);
//		attractionOrderRepository.save(attractionOrder);
		}
	
//飯店
	
	public void HotelToOrder(HotelOrder hotelOrder) {
		hotelOrderRepository.save(hotelOrder);
	}
	
	public List<HotelOrder> showHotelOrders(){
		return hotelOrderRepository.findAll();
	}
	
	public void updateHotelOrderStatus(Integer status, Integer reservationid) {
		
		HotelOrder hotelOrder = hotelOrderRepository.findByreservationid(reservationid);
		hotelOrder.setOrderstatus(status);
		hotelOrderRepository.save(hotelOrder);
	}
	
	public OrderList insertDataToOrderList(Reservation finishPaymentOrder) {
		OrderList orderList = new OrderList();
		orderList.setMemberid(finishPaymentOrder.getMemberID());
		orderList.setOrderdate(finishPaymentOrder.getPaymentDate());
		orderList.setOrderid(finishPaymentOrder.getOrderId());
		orderList.setOrderstatus(finishPaymentOrder.getOrderStatus());
		orderList.setOrdertype("飯店");
		orderList.setTotalprice(Integer.parseInt(finishPaymentOrder.getTotalAmount()));
		addToOrderList(orderList);
		return orderList;
	}
}
	
