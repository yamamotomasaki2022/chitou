package tw.luana.cart.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.Table;

@Entity
@Table(name = "CART")
public class Cart implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ITEMId")
	private Integer itemid;

	@Column(name = "QUANTITY")
	private Integer quantity;
	
	@Column(name = "ATTRACTIONID")
	private Integer attractionid;
	
	@Column(name = "PLANID")
	private Integer planid;
	
	@Column(name = "ATTRACTIONNAME")
	private String attractionname;
	
	@Column(name = "PLANNAME")
	private String planname;
	
	@Column(name = "PLANFEE")
	private Integer planfee;
	
	@Column(name = "MEMBERID")
	private Integer memberid;
		
	
	public Cart() {
	}

	public Integer getItemid() {
		return itemid;
	}

	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getAttractionid() {
		return attractionid;
	}

	public void setAttractionid(Integer attractionid) {
		this.attractionid = attractionid;
	}

	public String getAttractionname() {
		return attractionname;
	}

	public void setAttractionname(String attractionname) {
		this.attractionname = attractionname;
	}

	public String getPlanname() {
		return planname;
	}

	public void setPlanname(String planname) {
		this.planname = planname;
	}

	public Integer getPlanfee() {
		return planfee;
	}

	public void setPlanfee(Integer planfee) {
		this.planfee = planfee;
	}

	public Integer getPlanid() {
		return planid;
	}

	public void setPlanid(Integer planid) {
		this.planid = planid;
	}

	public Integer getMemberid() {
		return memberid;
	}

	public void setMemberid(Integer memberid) {
		this.memberid = memberid;
	}
	


	
	
}


	