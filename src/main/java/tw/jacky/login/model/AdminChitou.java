package tw.jacky.login.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="adminchitou")
public class AdminChitou {
	
	

	@Id
	@Column(name="adminid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer adminid;
	
	@Column(name="adminstatus")
	private Integer adminstatus;
	
	
	
	@Column (name="username")
	private String username;
	
	
	@Column(name="password")
	private String password;
	
	
	@Column(name="permission")
	private Boolean permission;
	
	
	public AdminChitou() {
		
	}
	
	public AdminChitou(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	
	


	public AdminChitou(Integer adminstatus, String username, String password, Boolean permission) {
		super();
		this.adminstatus = adminstatus;
		this.username = username;
		this.password = password;
		this.permission = permission;
	}




	public AdminChitou(Integer adminid, Integer adminstatus, String username, String password, Boolean permission) {
		super();
		this.adminid = adminid;
		this.adminstatus = adminstatus;
		this.username = username;
		this.password = password;
		this.permission = permission;
	}
	
	
	
	
	public Integer getAdminid() {
		return adminid;
	}
	public void setAdminid(Integer adminid) {
		this.adminid = adminid;
	}
	public Integer getAdminstatus() {
		return adminstatus;
	}
	public void setAdminstatus(Integer adminstatus) {
		this.adminstatus = adminstatus;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Boolean getPermission() {
		return permission;
	}
	public void setPermission(Boolean permission) {
		this.permission = permission;
	}
	
	

}
