package tw.weber.hotel.model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.luana.order.model.OrderList;
import tw.luana.order.model.OrderListRepository;

@Service
@Transactional
public class FrontBookingService {
	@Autowired
	private RoomRepository rRepo;
	
	@Autowired
	private HSearchRepository hsRepo;
	
	@Autowired
	private HotelRepository hRepo;
	
	@Autowired
	private RSSearchRepository rssRepo;
	
	@Autowired
	private RoomStyleRepository rsRepo;
	
	@Autowired
	private ReservationRepository reRepo;
	
	@Autowired
	private OrderListRepository oRepo;
	
	public List<Room> find(){
		return rRepo.find();
	}
	
	public List<HotelforSearch> crazy(String dateStart,String dateEnd,String destination,int number){
		return hsRepo.crazy(dateStart,dateEnd,destination,number);
	}
	
	public Hotel selectHotel(int hotelID) {
		return hRepo.findById(hotelID).get();
	}
	
	public List<RoomStyleforSearch> getRoomStyle(String dateStart,String dateEnd,int hotelID,int number) {
		return rssRepo.crazy(dateStart, dateEnd, hotelID, number);
	}
	
	public RoomStyle findStyle(String dateStart,String dateEnd,int roomStyleID,int number) {
		return rsRepo.findEmptyRoom(dateStart, dateEnd, roomStyleID, number).get();
	}
	
	public Room findEmptyRoom(String dateStart,String dateEnd,int styleID) {
		return rRepo.findEmptyRoom(dateStart, dateEnd, styleID).get();
	}
	
	public Reservation finalCheckOut(Reservation reservation) {
		return reRepo.save(reservation);
	}
	
	public Reservation setPaymentInfo(Reservation reservation) {
		String tradeNo = "B"+Long.toHexString(System.currentTimeMillis());
		reservation.setOrderId(tradeNo);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		String paymentDate = dtf.format(LocalDateTime.now());
		reservation.setPaymentDate(paymentDate);
		return reservation;
	}
	
	public OrderList insertDataToOrderList(Reservation finishPaymentOrder) {
		OrderList orderList = new OrderList();
		orderList.setMemberid(finishPaymentOrder.getMemberID());
		orderList.setOrderdate(finishPaymentOrder.getPaymentDate());
		orderList.setOrderid(finishPaymentOrder.getOrderId());
		orderList.setOrderstatus(finishPaymentOrder.getOrderStatus());
		orderList.setOrdertype("飯店");
		orderList.setTotalprice(Integer.parseInt(finishPaymentOrder.getTotalAmount()));
		oRepo.save(orderList);
		return orderList;
	}
}
