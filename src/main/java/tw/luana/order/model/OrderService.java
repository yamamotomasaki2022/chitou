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
import tw.weber.hotel.model.ReservationRepository;


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
	private ReservationRepository reservationRepository;
	
	
//訂單總表
	
	//加入訂單總表
	public void addToOrderList(OrderList orderList) {
		
		orderListRepository.save(orderList);
	}
	
	//顯示個人訂單
	public List<OrderList> showOrderLists(Integer memberid){
		return orderListRepository.findByOrderidOrderByOrderdate(memberid);
	}
	
	//顯示單筆訂單資訊
	public List<OrderList> showSingleOrderList(String orderid) {
		return orderListRepository.findByOrderid(orderid);
	}

//景點
	
	//加入景點訂單列表
	public void AttractionToOrder(List<AttractionOrderDetail> aDetails) {		
		for(AttractionOrderDetail a : aDetails) {
			attractionOrderRepository.save(a);
		}
	}
	
	//顯示訂單詳細資料
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
	
	//顯示飯店詳細訂單
	public List<Reservation> showHotelOrders(String orderId) {
		return reservationRepository.findAllByOrderId(orderId);
	}

	
//	public void HotelToOrder(HotelOrder hotelOrder) {
//		hotelOrderRepository.save(hotelOrder);
//	}
//	
//	public List<HotelOrder> showHotelOrders(){
//		return hotelOrderRepository.findAll();
//	}
//	
//	public void updateHotelOrderStatus(Integer status, Integer reservationid) {
//		
//		HotelOrder hotelOrder = hotelOrderRepository.findByreservationid(reservationid);
//		hotelOrder.setOrderstatus(status);
//		hotelOrderRepository.save(hotelOrder);
//	}
	
	
//後台
	
	//顯示所有訂單
	public List<OrderList> backOrderLists(){
		return orderListRepository.findAllOrderByOrderdate();
	}
	
	//顯示特定種類訂單
	public List<OrderList> listInType(String ordertype){
		return orderListRepository.findAllByOrdertype(ordertype);
	}
	
	//更新訂單狀態
	public boolean updateOrderStatus(String orderstatus, String orderid) {
		
		Integer result = orderListRepository.updateOrderStatus(orderstatus, orderid);
			if(result == 1) {
				return true;
			}else {
				return false;
			}
	}
	
	//查詢訂單

	public List<OrderList> findOrderList(String type,String keyword){
			
			if(type.equals("orderid")) {
				return orderListRepository.findAllByOrderidContaining( keyword);
			}
			else if (type.equals("ordertype")) {
				return orderListRepository.findAllByOrdertypeContaining(keyword);
			}
			else if (type.equals("orderdate")) {
				return orderListRepository.findAllByOrderdateContaining(keyword);
			}
			else if (type.equals("orderstatus")) {
				return orderListRepository.findAllByOrderstatusContaining(keyword);
			}
			else if (type.equals("totalprice")) {
				return orderListRepository.findAllByTotalpriceContaining(keyword);
			}
			else if (type.equals("memberid")) {
				return orderListRepository.findAllByMemberidContaining(keyword);
			}
			return null;
	}
}
	
		