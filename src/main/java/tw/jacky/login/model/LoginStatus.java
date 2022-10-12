package tw.jacky.login.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="loginstatus")
public class LoginStatus {
	
	
	@Id
	@Column(name="statusid")
	private Integer statusid;
	
	@Column(name="statusname")
	private String statusname;

	public LoginStatus(Integer statusid, String statusname) {
		super();
		this.statusid = statusid;
		this.statusname = statusname;
	}
	
	public LoginStatus() {
		
	}
	
	public Integer getStatusid() {
		return statusid;
	}

	public void setStatusid(Integer statusid) {
		this.statusid = statusid;
	}

	public String getStatusname() {
		return statusname;
	}

	public void setStatusname(String statusname) {
		this.statusname = statusname;
	}


	
	
	
}
