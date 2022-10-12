package tw.cocokang.attraction.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import tw.weber.hotel.model.Room;

@Entity
@Table(name = "attraction")
@Component
public class Attraction {
	
	@Column(name = "photo")
	private String photo;
	
	@Id
	@Column(name = "attraction_id")
	private Integer attid;
	
	@ManyToOne(fetch = FetchType.EAGER)//拿資料
	@JoinColumn(name = "prefer_id")
	private Hobbyclassification hobbyclassification;

	@Column(name = "prefer_id")
	@Transient
	private Integer preferid;
	
	@Column(name = "attraction_name")
	private String attName;
	
	@Column(name = "attraction_location")
	private String attLocation;
	
	@Column(name = "attraction_description")
	private String attDescription;
	
	@JsonManagedReference
	@OneToMany(mappedBy = "attraction",cascade = CascadeType.REMOVE)
	private List<Pricingplan> pricingplans;
	
//	@Column(name = "attraction_notice")
//	private String attNotice;
//	
	public Attraction() {
	}

	public Attraction(Integer attid, Hobbyclassification Hobbyclassification, String attName, String attLocation, String attDescription, String attNotice) {
		  super();
		  this.attid=attid;
		  this.hobbyclassification=Hobbyclassification;
		  this.attName=attName;
		  this.attLocation=attLocation;
		  this.attDescription=attDescription;
//		  this.attNotice=attNotice;
		  
	}


	public Attraction(Integer attid, Integer preferid, String attName,
			String attLocation, String attDescription, String attNotice) {
		super();
		this.attid = attid;
		this.preferid = preferid;
		this.attName = attName;
		this.attLocation = attLocation;
		this.attDescription = attDescription;
//		this.attNotice = attNotice;
	}

	public Integer getAttid() {
		return attid;
	}


	public void setAttid(Integer attid) {
		this.attid = attid;
	}


	public Hobbyclassification getHobbyclassification() {
		return hobbyclassification;
	}


	public void setHobbyclassification(Hobbyclassification hobbyclassification) {
		this.hobbyclassification = hobbyclassification;
	}


	public String getAttName() {
		return attName;
	}


	public void setAttName(String attName) {
		this.attName = attName;
	}


	public String getAttLocation() {
		return attLocation;
	}


	public void setAttLocation(String attLocation) {
		this.attLocation = attLocation;
	}


	public String getAttDescription() {
		return attDescription;
	}


	public void setAttDescription(String attDescription) {
		this.attDescription = attDescription;
	}


//	public String getAttNotice() {
//		return attNotice;
//	}
//
//
//	public void setAttNotice(String attNotice) {
//		this.attNotice = attNotice;
//	}

	public Integer getPreferid() {
		return preferid;
	}

	public void setPreferid(Integer preferid) {
		this.preferid = preferid;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Override
	public String toString() {
		return "Attraction [photo=" + photo + ", attid=" + attid + ", hobbyclassification=" + hobbyclassification
				+ ", preferid=" + preferid + ", attName=" + attName + ", attLocation=" + attLocation
				+ ", attDescription=" + attDescription + "]";
	}
//	@Override
//	public String toString() {
//		return "Attraction [photo=" + photo + ", attid=" + attid + ", attName=" + attName + ", attLocation=" + attLocation
//				+ ", attDescription=" + attDescription + "]";
//	}

	public List<Pricingplan> getPricingplans() {
		return pricingplans;
	}

	public void setPricingplans(List<Pricingplan> pricingplans) {
		this.pricingplans = pricingplans;
	}
	
	
}
