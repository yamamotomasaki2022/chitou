package tw.luana.order.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ATTRACTIONORDERDETAIL")
public class AttractionOrderDetail {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ITEMID")
	private Integer itemid;
	
	@Column(name = "ORDERID")
	private String orderid;
	
	@Column(name = "ATTRACTIONID")
	private int attractionid;
	
	@Column(name = "ATTRACTIONNAME")
	private String attractionname;
	
	@Column(name = "PLANNAME")
	private String planname;
	
	@Column(name = "QUANTITY")
	private Integer quantity;
	
	@Column(name = "PRICE")
	private Integer price;
	
	public AttractionOrderDetail() {
	}

	public Integer getItemid() {
		return itemid;
	}

	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public int getAttractionid() {
		return attractionid;
	}

	public void setAttractionid(int attractionid) {
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

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}
	
	

}
