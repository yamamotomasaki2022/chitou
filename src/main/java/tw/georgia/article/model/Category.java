package tw.georgia.article.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.context.annotation.Primary;

@Entity @Table(name = "category")
public class Category {

	@OneToMany(fetch = FetchType.LAZY,mappedBy = "category")
	private Set<Article> article=new LinkedHashSet<Article>();
	
	@Id
	@Column(name = "categoryID")
	private int categoryid;
	
	@Column(name = "countryID")
	private int countryid;

	@Column(name = "typeID")
	private int typeid;
	
	@Column(name = "country")
	private String country;
	
	@Column(name = "type")
	private String type;

	public Category() {
	}

	public Set<Article> getArticle() {
		return article;
	}

	public void setArticle(Set<Article> article) {
		this.article = article;
	}

	public int getCategoryID() {
		return categoryid;
	}

	public void setCategoryID(int categoryID) {
		this.categoryid = categoryID;
	}

	public int getCountryID() {
		return countryid;
	}

	public void setCountryID(int countryID) {
		this.countryid = countryID;
	}

	public int getTypeID() {
		return typeid;
	}

	public void setTypeID(int typeID) {
		this.typeid = typeID;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
	
}
