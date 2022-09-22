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
@Table(name = "ATTRACTIONPLAN")

public class AttractionPlan_Luana implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PLANID")
	private Integer planid;
	
	@Column(name = "ATTRACTIONID")
	private Integer attractionid; 
	
	@Column(name = "PLANNAME")
	private String planname;
	
	@Column(name = "PLANFEE")
	private Integer planfee;
	
	
	
	public AttractionPlan_Luana() {
	}



	public Integer getPlanid() {
		return planid;
	}



	public void setPlanid(Integer planid) {
		this.planid = planid;
	}



	public Integer getAttractionid() {
		return attractionid;
	}

	public void setAttractionid(Integer attractionid) {
		this.attractionid = attractionid;
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

	



}
