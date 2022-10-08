package tw.cocokang.attraction.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "PRICINGPLAN")
@Component
public class Pricingplan {
	
	@Id
	@Column(name = "plan_id")
	private Integer planid;
	
	@ManyToOne(fetch = FetchType.EAGER)//拿資料
	@JoinColumn(name = "attraction_id")
	private Attraction attraction;
	
	@Transient
	private Integer attractionid;
	
	
	@Column(name = "plan_name")
	private String planname;
	
	@Column(name = "plan_fee")
	private Integer planfee;
	
	@Column(name = "plan_discript")
	private String plandiscript;
	
	public Pricingplan() {
	}

	public Pricingplan(Integer planid, Attraction attraction, String planname, Integer planfee, String plandiscript) {
		  super();
		  this.planid=planid;
		  this.attraction=attraction;
		  this.planname=planname;
		  this.planfee=planfee;
		  this.plandiscript=plandiscript;
	}
	
	public Pricingplan(Integer planid, Integer attractionid, String planname, Integer planfee, String plandiscript) {
		  super();
		  this.planid=planid;
		  this.attractionid=attractionid;
		  this.planname=planname;
		  this.planfee=planfee;
		  this.plandiscript=plandiscript;
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

	public String getPlandiscript() {
		return plandiscript;
	}

	public void setPlandiscript(String plandiscript) {
		this.plandiscript = plandiscript;
	}

	public Attraction getAttraction() {
		return attraction;
	}

	public void setAttraction(Attraction attraction) {
		this.attraction = attraction;
	}

	
}
