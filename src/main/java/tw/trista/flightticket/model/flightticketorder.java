package tw.trista.flightticket.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import tw.jacky.login.model.MemberBasicInfo;

@Entity
@Table(name = "flightorder")
@Component
public class flightticketorder {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne(fetch = FetchType.EAGER)
	 @JoinColumn(name = "memberid")
	 private MemberBasicInfo member;
	
//	@Column(name="memberid")
//	private String memberid;
	
	@Column(name="orderid")
	private String orderid;
	
	@Column(name="firstname")
	private String firstname;
	
	@Column(name="lastname")
	private String lastname;
	
	@Column(name="emailaddress")
	private String emailaddress;
	
	@Column(name="phone")
	private String phone;
	
	@Column(name="flightid")
	private String flightid;
	
	@Column(name="classid")
	private int classid;
	
	@Column(name="departuretime")
	private String departuretime;
	
	@Column(name="arrivaltime")
	private String arrivaltime;
	
	@Column(name="fare")
	private int fare;
	
	@Column(name="airline")
	private String airline;
	
	@Column(name="originid")
	private String originid;
	
	@Column(name="destinationid")
	private String destinationid;

	
	public flightticketorder(int id,MemberBasicInfo member, String orderid, String firstname, String lastname, String emailaddress,
			String phone, String flightid, int classid, String departuretime, String arrivaltime, int fare,
			String airline, String originid, String destinationid) {
		super();
		this.id = id;
		this.member = member;
		this.orderid = orderid;
		this.firstname = firstname;
		this.lastname = lastname;
		this.emailaddress = emailaddress;
		this.phone = phone;
		this.flightid = flightid;
		this.classid = classid;
		this.departuretime = departuretime;
		this.arrivaltime = arrivaltime;
		this.fare = fare;
		this.airline = airline;
		this.originid = originid;
		this.destinationid = destinationid;
	}

	public flightticketorder() {
		
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

//	public String getMemberid() {
//		return memberid;
//	}

//	public void setMemberid(String memberid) {
//		this.memberid = memberid;
//	}
	
	public MemberBasicInfo getMember() {
	return member;
	}

	public void setMember(MemberBasicInfo member) {
	this.member = member;
	}
	
	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmailaddress() {
		return emailaddress;
	}

	public void setEmailaddress(String emailaddress) {
		this.emailaddress = emailaddress;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFlightid() {
		return flightid;
	}

	public void setFlightid(String flightid) {
		this.flightid = flightid;
	}

	public int getClassid() {
		return classid;
	}

	public void setClassid(int classid) {
		this.classid = classid;
	}

	public String getDeparturetime() {
		return departuretime;
	}

	public void setDeparturetime(String departuretime) {
		this.departuretime = departuretime;
	}

	public String getArrivaltime() {
		return arrivaltime;
	}

	public void setArrivaltime(String arrivaltime) {
		this.arrivaltime = arrivaltime;
	}

	public int getFare() {
		return fare;
	}

	public void setFare(int fare) {
		this.fare = fare;
	}

	public String getAirline() {
		return airline;
	}

	public void setAirline(String airline) {
		this.airline = airline;
	}

	public String getOriginid() {
		return originid;
	}

	public void setOriginid(String originid) {
		this.originid = originid;
	}

	public String getDestinationid() {
		return destinationid;
	}

	public void setDestinationid(String destinationid) {
		this.destinationid = destinationid;
	}
	
	
}
