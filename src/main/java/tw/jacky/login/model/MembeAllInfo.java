package tw.jacky.login.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;


// JavaBean範例
public class MembeAllInfo {
	
	

	
	private String username;	

	private String email;
	
	private String name;
	
	private String phone;
	
	private String address;
	
	private String nickname;
	
	private String nationality;
	
	private String birth;
	
	private String gender;
	
	
// 合成兩個Bean的資料
	public MembeAllInfo(MemberBasicInfo basic,MemberDetailInfo detail) {
		this.username = basic.getUsername();
		this.email = basic.getEmail();
		this.name = detail.getName();
		this.phone = detail.getPhone();
		this.address = detail.getAddress();
		this.nickname = detail.getNickname();
		this.nationality = detail.getNationality();
		this.birth = detail.getBirth();
		this.gender =detail.getGender();
	}
	
	public MembeAllInfo() {
		
	}
	
	public void setAll(MemberBasicInfo basic,MemberDetailInfo detail) {
		this.username = basic.getUsername();
		this.email = basic.getEmail();
		this.name = detail.getName();
		this.phone = detail.getPhone();
		this.address = detail.getAddress();
		this.nickname = detail.getNickname();
		this.nationality = detail.getNationality();
		this.birth = detail.getBirth();
		this.gender =detail.getGender();
	}
	

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	

	

	
	
	
	
	
	

}
