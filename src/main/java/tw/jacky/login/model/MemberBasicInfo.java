package tw.jacky.login.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table (name = "memberbasicinfo")
public class MemberBasicInfo {
	
	
	@Id
	//annoId代表的是pk 
	@Column(name="memberid")
	//應該是什麽type
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int memberid;
	
	
	
	@Column(name="statusid")
	private int statusid;
	
	@Column(name="username")
	private String username;
	
	@Column(name="password")
	private String password;
	
	@Column(name="photo")
	private String photo;
	
	@Column(name="email")
	private String email;
	
	
	public MemberBasicInfo() {
		
	}
	
	
	public MemberBasicInfo(int memberid, int statusid, String username, String password, String photo, String email) {
		super();
		this.memberid = memberid;
		this.statusid = statusid;
		this.username = username;
		this.password = password;
		this.photo = photo;
		this.email = email;
	}
	
	
	
	
	
	public MemberBasicInfo(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}


	public MemberBasicInfo(int statusid, String username, String password, String photo, String email) {
		super();
		this.statusid = statusid;
		this.username = username;
		this.password = password;
		this.photo = photo;
		this.email = email;
	}

	

	public int getMemberid() {
		return memberid;
	}
	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}
	public int getStatusid() {
		return statusid;
	}
	public void setStatusid(int statusid) {
		this.statusid = statusid;
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
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}



	@Override
	public String toString() {
		return "MemberBasicInfo [memberid=" + memberid + ", statusid=" + statusid + ", username=" + username
				+ ", password=" + password + ", photo=" + photo + ", email=" + email + "]";
	}
	
	
	
	
	

}
