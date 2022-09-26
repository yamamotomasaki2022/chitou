package tw.georgia.article.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "article")
@Component
public class Article {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "postID")
	private Integer postid;
	
	@Column(name = "posterID")
	private Integer posterid;
	
	@Column(name = "countryID")
	private Integer countryid;
	
	@Column(name = "typeID")
	private Integer typeid;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "content")
	private String content;
	
	@Column(name = "date")
	private String date;
	

	public Article() {
	}


	public Article(Integer posterID, Integer countryID, Integer typeID, String title, String content, String date) {
		this.posterid = posterID;
		this.countryid = countryID;
		this.typeid = typeID;
		this.title = title;
		this.content = content;
		this.date = date;
	}
	

	public Article(Integer postID, Integer posterID, Integer countryID, Integer typeID, String title, String content,
			String date) {
		super();
		this.postid = postID;
		this.posterid = posterID;
		this.countryid = countryID;
		this.typeid = typeID;
		this.title = title;
		this.content = content;
		this.date = date;
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


	public Integer getCountryID() {
		return countryid;
	}


	public void setCountryID(Integer countryID) {
		this.countryid = countryID;
	}


	public Integer getTypeID() {
		return typeid;
	}


	public void setTypeID(Integer typeID) {
		this.typeid = typeID;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
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


	public void setArticleDate(String date) {
		this.date = date;
	}

}

