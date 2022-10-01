package tw.weber.hotel.model;

import java.util.List;

import javax.persistence.CascadeType;
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

@Entity
@Table(name = "roomstyle")
public class RoomStyleforSearch {
	
	@Id
	@Column(name = "styleID")
	@GeneratedValue(strategy =  GenerationType.IDENTITY)
	private int styleID;
	
	private String name;
	
	private String capacity;
	
	private int price;
	
	private String bed;
	
	@Column(name = "roomamount")
	private int roomAmount;
	
	public RoomStyleforSearch() {
		
	}

	public RoomStyleforSearch(int styleID, String name, String capacity, int price, String bed) {
		super();
		this.styleID = styleID;
		this.name = name;
		this.capacity = capacity;
		this.price = price;
		this.bed = bed;
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

	public int getRoomAmount() {
		return roomAmount;
	}

	public void setRoomAmount(int roomAmount) {
		this.roomAmount = roomAmount;
	}
	
	
}
