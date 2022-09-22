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
	
	public FlightTicket(Integer classID, String departureTime, String arrivalTime, String originID,
			String destinationID) {
		super();
		this.classid = classID;
		this.departuretime = departureTime;
		this.arrivaltime = arrivalTime;
		this.originid = originID;
		this.destinationid = destinationID;
	}
	
	public FlightTicket(String flightID, Integer classID, String departureTime, String arrivalTime, Integer fare,
			String airline, String originID, String destinationID) {
		super();
		this.flightid = flightID;
		this.classid = classID;
		this.departuretime = departureTime;
		this.arrivaltime = arrivalTime;
		this.fare = fare;
		this.airline = airline;
		this.originid = originID;
		this.destinationid = destinationID;
	}

	public FlightTicket(String flightID, Integer fare) {
		this.flightid = flightID;
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
	
	@Column(name = "destinationiD")
	private String destinationid;
	
	public FlightTicket() {
		
	}

	public String getFlightID() {
		return flightid;
	}

	public void setFlightID(String flightID) {
		this.flightid = flightID;
	}

	public Integer getClassID() {
		return classid;
	}

	public void setClassID(Integer classID) {
		this.classid = classID;
	}

	public String getDepartureTime() {
		return departuretime;
	}

	public void setDepartureTime(String departureTime) {
		this.departuretime = departureTime;
	}

	public String getArrivalTime() {
		return arrivaltime;
	}

	public void setArrivalTime(String arrivalTime) {
		this.arrivaltime = arrivalTime;
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

	public String getOriginID() {
		return originid;
	}

	public void setOriginID(String originID) {
		this.originid = originID;
	}

	public String getDestinationID() {
		return destinationid;
	}

	public void setDestinationID(String destinationID) {
		this.destinationid = destinationID;
	}

	@Override
	public String toString() {
		return "FlightTicket [flightID=" + flightid + ", classID=" + classid + ", departureTime=" + departuretime
				+ ", arrivalTime=" + arrivaltime + ", fare=" + fare + ", airline=" + airline + ", originID=" + originid
				+ ", destinationID=" + destinationid + "]";
	}
	
	
	
}
