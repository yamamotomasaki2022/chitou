package tw.trista.flightticket.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "FlightTicket")
@Component
public class FlightTicket {
	
	public FlightTicket(Integer classID, String departureTime, String arrivalTime, String originID,
			String destinationID) {
		super();
		this.classID = classID;
		this.departureTime = departureTime;
		this.arrivalTime = arrivalTime;
		this.originID = originID;
		this.destinationID = destinationID;
	}
	
	public FlightTicket(String flightID, Integer classID, String departureTime, String arrivalTime, Integer fare,
			String airline, String originID, String destinationID) {
		super();
		this.flightID = flightID;
		this.classID = classID;
		this.departureTime = departureTime;
		this.arrivalTime = arrivalTime;
		this.fare = fare;
		this.airline = airline;
		this.originID = originID;
		this.destinationID = destinationID;
	}

	
	@Id
	@Column(name = "flightID")
	private String flightID;
	
	@Column(name = "classID")
	private Integer classID;
	
	@Column(name = "departureTime")
	private String departureTime;
	
	@Column(name = "arrivalTime")
	private String arrivalTime;
	
	@Column(name = "fare")
	private Integer fare;
	
	@Column(name = "airline")
	private String airline;
	
	@Column(name = "originID")
	private String originID;
	
	@Column(name = "destinationID")
	private String destinationID;
	
	public FlightTicket() {
		
	}

	public String getFlightID() {
		return flightID;
	}

	public void setFlightID(String flightID) {
		this.flightID = flightID;
	}

	public Integer getClassID() {
		return classID;
	}

	public void setClassID(Integer classID) {
		this.classID = classID;
	}

	public String getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}

	public String getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
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
		return originID;
	}

	public void setOriginID(String originID) {
		this.originID = originID;
	}

	public String getDestinationID() {
		return destinationID;
	}

	public void setDestinationID(String destinationID) {
		this.destinationID = destinationID;
	}
	
}
