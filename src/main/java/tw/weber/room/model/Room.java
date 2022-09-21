package tw.weber.room.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

import tw.cocokang.attraction.model.Hobbyclassification;
import tw.weber.hotel.model.Hotel;
import tw.weber.roomStyle.model.RoomStyle;

@Entity
@Table(name = "room")
public class Room {
	
	@Id
	@Column(name = "roomID")
	@GeneratedValue(strategy =  GenerationType.IDENTITY)
	private int roomID;
	
	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "roomstyleid")
	private RoomStyle style;
	
	public Room() {
		
	}

	public Room(int roomID, RoomStyle style) {
		super();
		this.roomID = roomID;
		this.style = style;
	}

	public int getRoomID() {
		return roomID;
	}

	public void setRoomID(int roomID) {
		this.roomID = roomID;
	}

	public RoomStyle getStyle() {
		return style;
	}

	public void setStyle(RoomStyle style) {
		this.style = style;
	}
	
}
