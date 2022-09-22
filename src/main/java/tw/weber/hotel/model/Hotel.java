package tw.weber.hotel.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "hotel")

public class Hotel implements Serializable {
	@Id
	@Column(name = "hotelID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int hotelID;
	
	private String name;
	
	private String address;
	
	private String type;
	
	private String intro;
	
	private String country;
	
	private String phone;
	
	private String status;
	
	private int capacity;
	
	private String owner;
	
	@Column(name = "averageprice")
	private int averagePrice;
	
	@JsonManagedReference
	@OneToMany(mappedBy = "hotel",cascade = CascadeType.REMOVE)
	private List<RoomStyle> styles;
	
	public Hotel() {
		
	}

	
	public Hotel(int hotelID, String name, String address, String type, String intro, String country, String phone,
			String status, int capacity, String owner, int averagePrice,List<RoomStyle> styles) {
		super();
		this.hotelID = hotelID;
		this.name = name;
		this.address = address;
		this.type = type;
		this.intro = intro;
		this.country = country;
		this.phone = phone;
		this.status = status;
		this.capacity = capacity;
		this.owner = owner;
		this.averagePrice = averagePrice;
//		this.photo = photo;
		this.styles = styles;
	}


	public int getHotelID() {
		return hotelID;
	}

	public void setHotelID(int hotelID) {
		this.hotelID = hotelID;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public int getAveragePrice() {
		return averagePrice;
	}

	public void setAveragePrice(int averagePrice) {
		this.averagePrice = averagePrice;
	}


	public List<RoomStyle> getStyles() {
		return styles;
	}


	public void setRooms(List<RoomStyle> styles) {
		this.styles = styles;
	}

//	public byte[] getPhoto() {
//		return photo;
//	}
//
//	public void setPhoto(byte[] photo) {
//		this.photo = photo;
//	}
//	
	
}
