package tw.georgia.article.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "article")
@Component
public class Article {

	@ManyToOne(fetch = FetchType.EAGER)
//	@JoinColumns({
//		@JoinColumn(name = "countryID",referencedColumnName = "countryID"),
		@JoinColumn(name = "categoryID",referencedColumnName = "categoryID")
//	})
	private Category category;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "article")
	private Set<Reply> reply=new LinkedHashSet<Reply>();
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "postID")
	private Integer postid;
	
	@Column(name = "posterID")
	private Integer posterid;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "subtitle")
	private String subtitle;
	
	@Column(name = "photo")
	private String photo;
	
	@Column(name = "content")
	private String content;
	
	@Column(name = "date")
	private String date;
	
	@Column(name = "userdelete")
	private int userdelete;
	
	@Column(name = "managehidden")
	private int managehidden;

	public Article() {
	}


	public Article(Category category, Integer postID, Integer posterID, String title, String subtitle, String photo,
			String content, String date) {
		super();
		this.category = category;
		this.postid = postID;
		this.posterid = posterID;
		this.title = title;
		this.subtitle = subtitle;
		this.photo = photo;
		this.content = content;
		this.date = date;
	}


	public Article(Category category, Integer posterID, String title, String subtitle, String photo, String content,
			String date) {
		super();
		this.category = category;
		this.posterid = posterID;
		this.title = title;
		this.subtitle = subtitle;
		this.photo = photo;
		this.content = content;
		this.date = date;
	}

	public Article(Category category, String title, String subtitle, String photo, String content, String date) {
		super();
		this.category = category;
		this.title = title;
		this.subtitle = subtitle;
		this.photo = photo;
		this.content = content;
		this.date = date;
	}


	public Category getCategory() {
		return category;
	}


	public void setCategory(Category category) {
		this.category = category;
	}


	public Integer getPostID() {
		return postid;
	}


	public void setPostID(Integer postID) {
		this.postid = postID;
	}


	public Integer getPosterID() {
		return posterid;
	}


	public void setPosterID(Integer posterID) {
		this.posterid = posterID;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getSubtitle() {
		return subtitle;
	}


	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}


	public String getPhoto() {
		return photo;
	}


	public void setPhoto(String photo) {
		this.photo = photo;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public int getUserDelete() {
		return userdelete;
	}


	public void setUserDelete(int userDelete) {
		this.userdelete = userDelete;
	}


	public int getManageHidden() {
		return managehidden;
	}


	public void setManageHidden(int manageHidden) {
		this.managehidden = manageHidden;
	}


	public Set<Reply> getReply() {
		return reply;
	}


	public void setReply(Set<Reply> reply) {
		this.reply = reply;
	}
	
	

	

}