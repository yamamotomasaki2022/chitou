package tw.weber.roomStyle.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import tw.cocokang.attraction.model.Hobbyclassification;
import tw.weber.hotel.model.Hotel;
import tw.weber.room.model.Room;

@Entity
@Table(name = "roomstyle")
public class RoomStyle {
	
	@Id
	@Column(name = "styleID")
	@GeneratedValue(strategy =  GenerationType.IDENTITY)
	private int styleID;
	
	private String name;
	
	private String capacity;
	
	private int price;
	
	private String bed;
	
	private String photos;
	
	private String status;
	
	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "hotelID")
	private Hotel hotel;
	
	@JsonManagedReference
	@OneToMany(mappedBy = "style")
	private List<Room> rooms;
	
	public RoomStyle() {
		
	}

	public RoomStyle(int styleID, String name, String capacity, int price, String bed, String photos, String status,
			Hotel hotel,List<Room> rooms) {
		super();
		this.styleID = styleID;
		this.name = name;
		this.capacity = capacity;
		this.price = price;
		this.bed = bed;
		this.photos = photos;
		this.status = status;
		this.hotel = hotel;
		this.rooms = rooms;
	}

	public int getStyleID() {
		return styleID;
	}

	public void setStyleID(int styleID) {
		this.styleID = styleID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCapacity() {
		return capacity;
	}

	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getBed() {
		return bed;
	}

	public void setBed(String bed) {
		this.bed = bed;
	}

	public String getPhotos() {
		return photos;
	}

	public void setPhotos(String photos) {
		this.photos = photos;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Hotel getHotel() {
		return hotel;
	}

	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}

	public List<Room> getRooms() {
		return rooms;
	}

	public void setRooms(List<Room> rooms) {
		this.rooms = rooms;
	}
	
	
}
