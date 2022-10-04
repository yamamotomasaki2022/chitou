package tw.luana.order.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "RESERVATION")
public class HotelOrder {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "RESERVATIONID")
	private Integer reservationid;
	
	@Column(name = "MEMBERID")
	private Integer memberid;
	
	@Column(name = "BOOKER")
	private String Booker;
	
	@Column(name = "EMAIL")
	private String email;
	
	@Column(name = "PHONE")
	private String phone;
	
	@Column(name = "ROOMID")
	private Integer roomid;
	
	@Column(name = "ROOMNAME")
	private String roomname;
	
	@Column(name = "CHECKINDATE")
	private String checkindate;
	
	@Column(name = "CHECKOUTDATE")
	private String checkoutdate;
	
	@Column(name = "PAYMENTDATE")
	private String paymentdate;
	
	@Column(name = "ADDBED")
	private String addbed;
	
	@Column(name = "NUMBEROFPEOPLE")
	private Integer numberofpeople;
	
	@Column(name = "HOTELNAME")
	private String hotelname;
	
	@Column(name = "ORDERSTATUS")
	private Integer orderstatus;
	
	
	public HotelOrder() {
	}


	public Integer getReservationid() {
		return reservationid;
	}


	public void setReservationid(Integer reservationid) {
		this.reservationid = reservationid;
	}


	public Integer getMemberid() {
		return memberid;
	}


	public void setMemberid(Integer memberid) {
		this.memberid = memberid;
	}


	public String getBooker() {
		return Booker;
	}


	public void setBooker(String booker) {
		Booker = booker;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public Integer getRoomid() {
		return roomid;
	}


	public void setRoomid(Integer roomid) {
		this.roomid = roomid;
	}


	public String getRoomname() {
		return roomname;
	}


	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}


	public String getCheckindate() {
		return checkindate;
	}


	public void setCheckindate(String checkindate) {
		this.checkindate = checkindate;
	}


	public String getCheckoutdate() {
		return checkoutdate;
	}


	public void setCheckoutdate(String checkoutdate) {
		this.checkoutdate = checkoutdate;
	}


	public String getPaymentdate() {
		return paymentdate;
	}


	public void setPaymentdate(String paymentdate) {
		this.paymentdate = paymentdate;
	}


	public String getAddbed() {
		return addbed;
	}


	public void setAddbed(String addbed) {
		this.addbed = addbed;
	}


	public Integer getNumberofpeople() {
		return numberofpeople;
	}


	public void setNumberofpeople(Integer numberofpeople) {
		this.numberofpeople = numberofpeople;
	}


	public String getHotelname() {
		return hotelname;
	}


	public void setHotelname(String hotelname) {
		this.hotelname = hotelname;
	}


	public Integer getOrderstatus() {
		return orderstatus;
	}


	public void setOrderstatus(Integer orderstatus) {
		this.orderstatus = orderstatus;
	}

	
}
