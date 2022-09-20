package tw.luana.attraction.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "attractionPlan")

public class AttractionPlan_Luana implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "planID")
	private Integer planId;
	
	@Column(name = "attractionID")
	private Integer attractionId; 
	
	@Column(name = "planName")
	private String planName;
	
	@Column(name = "planFee")
	private Integer planFee;
	
	
	
	public AttractionPlan_Luana() {
	}

	public Integer getPlanId() {
		return planId;
	}

	public void setPlanId(Integer planId) {
		this.planId = planId;
	}

	public Integer getAttractionId() {
		return attractionId;
	}

	public void setAttractionId(Integer attractionId) {
		this.attractionId = attractionId;
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



}
