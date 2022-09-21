package tw.luana.cart.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "cart")
public class Cart implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "itemId")
	private Integer itemId;

	@Column(name = "quantity")
	private Integer quantity;
	
	
	@Column(name = "attractionId")
	private Integer attractionId;
	
	@Column(name = "attractionName")
	private String name;
	
	@Column(name = "planName")
	private String planName;
	
	@Column(name = "planFee")
	private Integer planFee;
	
	
	@Column(name = "planId")
	private Integer planId;
	
	public Cart() {
	}
	


	public Integer getItemId() {
		return itemId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}


	public Integer getAttractionId() {
		return attractionId;
	}

	public void setAttractionId(Integer attractionId) {
		this.attractionId = attractionId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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



	public Integer getPlanId() {
		return planId;
	}



	public void setPlanId(Integer planId) {
		this.planId = planId;
	}






		
	

	
}


	