package tw.luana.order.model;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVPrinter;
import org.apache.commons.csv.QuoteMode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.luana.cart.model.Cart;
import tw.luana.cart.model.CartRepository;
import tw.luana.order.model.AttractionOrderDetailRepository;
import tw.trista.flightticket.model.flightticketorder;
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
	
	@Autowired
	private tw.trista.flightticket.model.flightticketorderRepository flightticketorderRepository;
	
	
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

	
//機票
	public List<flightticketorder> showFlightticketorders(String orderId) {
		return flightticketorderRepository.findAllByOrderid(orderId);
	}
	
	
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
	
	//匯出CSV
	 public ByteArrayInputStream load() {
		    List<OrderList> orderLists = orderListRepository.findAll();

		    ByteArrayInputStream in = orderListsToCSV(orderLists);
		    return in;
		  }
	
	
	  public static ByteArrayInputStream orderListsToCSV(List<OrderList> orderLists) {
		    final CSVFormat format = CSVFormat.DEFAULT.withQuoteMode(QuoteMode.MINIMAL);

		    try (ByteArrayOutputStream out = new ByteArrayOutputStream();
		        CSVPrinter csvPrinter = new CSVPrinter(new PrintWriter(out), format);) {
		      for (OrderList order : orderLists) {
		       List<String> data = Arrays.asList(
		    		   order.getOrderid(),
		    		   order.getOrdertype(),
		    		   order.getOrderdate(),
		    		   order.getOrderstatus(),
		    		   String.valueOf(order.getTotalprice()),
		    		   String.valueOf(order.getMemberid())
		    		   );
//		       String[] title =new String[] {"訂單編號","訂單類別","下訂時間","訂單狀態","金額","訂購會員"};
//		       list.add(0,title);
		       System.err.println(data);
		        csvPrinter.printRecord(data);
		      }

		      csvPrinter.flush();
		      return new ByteArrayInputStream(out.toByteArray());
		    } catch (IOException e) {
		      throw new RuntimeException("fail to import data to CSV file: " + e.getMessage());
		    }
		  }
	 
	 
	 
	 
}
	
		