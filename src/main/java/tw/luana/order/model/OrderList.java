package tw.luana.order.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ORDERLIST")
public class OrderList implements Serializable {


	@Id
	@Column(name = "ORDERID")
	private String orderid;
	
	@Column(name = "ORDERTYPE")
	private String ordertype;
	
	@Column(name = "ORDERDATE")
	private String orderdate;
	
	@Column(name = "ORDERSTATUS")
	private String orderstatus;
	
	@Column(name = "TOTALPRICE")
	private Integer totalprice;
	
	@Column(name = "MEMBERID")
	private Integer memberid;
	
	
	
	public OrderList() {
	}



	public String getOrderid() {
		return orderid;
	}



	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}



	



	public String getOrdertype() {
		return ordertype;
	}



	public void setOrdertype(String ordertype) {
		this.ordertype = ordertype;
	}



	public String getOrderdate() {
		return orderdate;
	}



	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}



	public String getOrderstatus() {
		return orderstatus;
	}



	public void setOrderstatus(String orderstatus) {
		this.orderstatus = orderstatus;
	}



	public Integer getTotalprice() {
		return totalprice;
	}



	public void setTotalprice(Integer totalprice) {
		this.totalprice = totalprice;
	}



	public Integer getMemberid() {
		return memberid;
	}



	public void setMemberid(Integer memberid) {
		this.memberid = memberid;
	}

}
