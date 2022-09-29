package tw.weber.hotel.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "hotel")
public class HotelforSearch {
	@Id
	@Column(name = "hotelid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int hotelID;
	
	private String name;
	
	private String address;
	
	@Column(name = "averageprice")
	private int averagePrice;
	
	private int amount;
	
	public HotelforSearch() {
		
	}
	
	public HotelforSearch(String name, String address, int averagerPrice) {
		super();
		this.name = name;
		this.address = address;
		this.averagePrice = averagerPrice;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getAveragePrice() {
		return averagePrice;
	}

	public void setAveragerPrice(int averagePrice) {
		this.averagePrice = averagePrice;
	}

	public int getHotelID() {
		return hotelID;
	}

	public void setHotelID(int hotelID) {
		this.hotelID = hotelID;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
}
