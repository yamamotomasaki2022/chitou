package tw.luana.order.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ORDERS")

public class Orders implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ORDERID")
	private Integer orderid;
	
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
	
	@Column(name = "ORDERDATE")
	private long orderdate;
	
	@Column(name = "ORDERSTATUS")
	private Integer orderstatus;
	
	@Column(name = "QUANTITY")
	private Integer quantity;
	
	public Orders() {
	}

	

	public Integer getOrderid() {
		return orderid;
	}



	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}



	public Integer getAttractionid() {
		return attractionid;
	}



	public void setAttractionid(Integer attractionid) {
		this.attractionid = attractionid;
	}



	public Integer getPlanid() {
		return planid;
	}



	public void setPlanid(Integer planid) {
		this.planid = planid;
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
