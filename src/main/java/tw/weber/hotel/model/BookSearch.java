package tw.weber.hotel.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "room")
public class BookSearch {
	@Id
	@Column(name = "roomid")
	private int roomID;
	
	@Column(name = "orderid")
	private String orderID;
	
	public BookSearch() {
		
	}

	public int getRoomID() {
		return roomID;
	}

	public void setRoomID(int roomID) {
		this.roomID = roomID;
	}

	public String getOrderID() {
		return orderID;
	}

	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}
	
	
}
