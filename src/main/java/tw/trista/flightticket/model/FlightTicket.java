package tw.trista.flightticket.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "flightticket")
@Component
public class FlightTicket {
	
	public FlightTicket(Integer classid, String departuretime, String arrivaltime, String originid,
			String destinationid) {
		super();
		this.classid = classid;
		this.departuretime = departuretime;
		this.arrivaltime = arrivaltime;
		this.originid = originid;
		this.destinationid = destinationid;
	}
	
	public FlightTicket(String flightid, Integer classid, String departuretime, String arrivaltime, Integer fare,
			String airline, String originid, String destinationid) {
		super();
		this.flightid = flightid;
		this.classid = classid;
		this.departuretime = departuretime;
		this.arrivaltime = arrivaltime;
		this.fare = fare;
		this.airline = airline;
		this.originid = originid;
		this.destinationid = destinationid;
	}

	public FlightTicket(String flightid, Integer fare) {
		this.flightid = flightid;
		this.fare = fare;
	}
	
	@Id
	@Column(name = "flightid")
	private String flightid;
	
	@Column(name = "classid")
	private Integer classid;
	
	@Column(name = "departuretime")
	private String departuretime;
	
	@Column(name = "arrivaltime")
	private String arrivaltime;
	
	@Column(name = "fare")
	private Integer fare;
	
	@Column(name = "airline")
	private String airline;
	
	@Column(name = "originid")
	private String originid;
	
	@Column(name = "destinationid")
	private String destinationid;
	
	public FlightTicket() {
		
	}

	public String getFlightid() {
		return flightid;
	}

	public void setFlightid(String flightid) {
		this.flightid = flightid;
	}

	public Integer getClassid() {
		return classid;
	}

	public void setClassid(Integer classid) {
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

	public Integer getFare() {
		return fare;
	}

	public void setFare(Integer fare) {
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

	@Override
	public String toString() {
		return "FlightTicket [flightid=" + flightid + ", classid=" + classid + ", departuretime=" + departuretime
				+ ", arrivaltime=" + arrivaltime + ", fare=" + fare + ", airline=" + airline + ", originid=" + originid
				+ ", destinationid=" + destinationid + "]";
	}
	
	
	
}
