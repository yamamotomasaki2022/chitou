package tw.georgia.article.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import tw.jacky.login.model.MemberBasicInfo;

@Entity @Table(name = "reply")
public class Reply {
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "replyer")
	private MemberBasicInfo member;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "postID")
	private Article article;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "replyID")
	private int replyid;
	
//	@Column(name = "postID")
//	private int postid;
	
//	@Column(name = "replyer")
//	private int replyer;
	
	@Column(name = "comment")
	private String comment;
	
	@Column(name = "replytime")
	private String replytime;
	
	@Column(name = "userdelete")
	private int userdelete;
	
	@Column(name = "managehidden")
	private int managehidden;

	public Reply() {
	}

	
	public Reply(MemberBasicInfo member, Article article, String comment, String replytime) {
		super();
		this.member = member;
		this.article = article;
		this.comment = comment;
		this.replytime = replytime;
	}


	public MemberBasicInfo getMember() {
		return member;
	}


	public void setMember(MemberBasicInfo member) {
		this.member = member;
	}


	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public int getReplyID() {
		return replyid;
	}

	public void setReplyID(int replyID) {
		this.replyid = replyID;
	}

//	public int getReplyer() {
//		return replyer;
//	}
//
//	public void setReplyer(int replyer) {
//		this.replyer = replyer;
//	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getReplyTime() {
		return replytime;
	}

	public void setReplyTime(String replyTime) {
		this.replytime = replyTime;
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
	
	
}
