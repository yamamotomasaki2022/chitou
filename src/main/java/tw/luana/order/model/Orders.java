package tw.luana.order.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "orders")

public class Orders implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "orderID")
	private Integer orderId;
	
	@Column(name = "attractionID")
	private Integer attractionId;
	@Column(name = "planID")
	private Integer planId;
	
	@Column(name = "attractionName")
	private String attractionName;
	
	@Column(name = "planName")
	private String planName;
	
	@Column(name = "planFee")
	private Integer planFee;
	
	@Column(name = "orderdate")
	private long orderdate;
	
	@Column(name = "orderstatus")
	private Integer orderstatus;
	
	@Column(name = "quantity")
	private Integer quantity;
	
	public Orders() {
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getAttractionId() {
		return attractionId;
	}

	public void setAttractionId(Integer attractionId) {
		this.attractionId = attractionId;
	}

	public Integer getPlanId() {
		return planId;
	}

	public void setPlanId(Integer planId) {
		this.planId = planId;
	}

	public String getAttractionName() {
		return attractionName;
	}

	public void setAttractionName(String attractionName) {
		this.attractionName = attractionName;
	}

	public String getPlanName() {
		return planName;
	}

	public void setPlanName(String planName) {
		this.planName = planName;
	}

	public Integer getPlanFee() {
		return planFee;
	}

	public void setPlanFee(Integer planFee) {
		this.planFee = planFee;
	}

	public long getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(long orderdate) {
		this.orderdate = orderdate;
	}

	public Integer getOrderstatus() {
		return orderstatus;
	}

	public void setOrderstatus(Integer orderstatus) {
		this.orderstatus = orderstatus;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

}
