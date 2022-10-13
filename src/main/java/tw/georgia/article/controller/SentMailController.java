package tw.georgia.article.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.chitou.gmail.model.GmailService;
import tw.chitou.gmail.model.TemplateServices;
import tw.georgia.article.model.Article;
import tw.georgia.article.model.ArticleService;
import tw.georgia.article.model.Category;
import tw.georgia.article.model.CategoryService;
import tw.georgia.article.model.Reply;
import tw.georgia.article.model.ReplyService;
import tw.jacky.login.model.MemberBasicInfo;


@Controller
@SessionAttributes("memberbasicinfo")
public class SentMailController {
	
	@Autowired
	JavaMailSender javaMailSender;
 	
 	@Autowired
 	GmailService gmailService;
 	
 	@Autowired
 	TemplateServices templateService;
 	
	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ReplyService replyService;
	
	
	String userUrl="http://localhost:8080/article.user";
	String adminUrl="http://localhost:8080/article.admin";
	String adminReplyUrl="http://localhost:8080/article.admin.reply";
	
	
//	***************文章通知****************************
	@PostMapping("/article.mail")
	public String sendEmail4Article(@RequestParam("postID") int postID){
		Article article = articleService.findByID(postID);
		
		String username = article.getMember().getUsername();
		String title = article.getTitle();
		String email = article.getMember().getEmail();
		
//		寄信的人
		String fromEmail = "eeit49group1chitou@gmail.com";
//		群發到不同的人身上
		List<String> toEmaiList = new ArrayList<String>();
		toEmaiList.add(email);
		String subject="ChiTou旅遊文章討論區";
//		輸入html文本格式
		String html= "<!DOCTYPE html>\r\n"
				+ "<html>\r\n"
				+ "<head>\r\n"
				+ "<meta charset=\"UTF-8\">\r\n"
				+ "<title>Insert title here</title>\r\n"
				+"<style>h4{color: #2A4C65;}</style>\r\n"
				+ "</head>\r\n"
				+ "<body>\r\n"
				+ "\r\n"
				+ "\r\n"
				+"<div style='text-align:center ;background-color: #F8E8D1;'>\r\n"
				+"<h4>親愛的"+username+"您好</h4>"
				+"<h4>◕‿◕ </h4>"
				+"<h4>由於您的文章【"+title+"】遭到檢舉</h4>"
				+"<h4>(′⌒‵｡)</h4>"
				+"<h4>經審核後確有違規情形</h4>"
				+"<h4>依平台規定，將刪除該文章</h4>"
				+"<h4>(ಥ_ಥ)</h4>"
				+"<h4>ChiTou旅遊歡迎您再度發文</h4><h4>與我們分享您的旅途記憶</h4>"
				+"<h4>✧*｡ ٩(ˊᗜˋ*)و✧*｡</h4>"
				+"</div>\r\n"
				+ "\r\n"
				+ "</body>\r\n"
				+ "</html>";
		gmailService.mimemail(fromEmail, toEmaiList, subject, html);
		return "redirect:"+adminUrl;
	}
	
//	***************留言通知****************************
	@PostMapping("/article.mail.reply")
	public String sendEmail4Reply(@RequestParam("replyID") int replyID){
		Reply reply = replyService.findByID(replyID);
		
		String username = reply.getMember().getUsername();
		String title = reply.getArticle().getTitle();
		String comment = reply.getComment();
		String email = reply.getMember().getEmail();
		
//		寄信的人
		String fromEmail = "eeit49group1chitou@gmail.com";
//		群發到不同的人身上
		List<String> toEmaiList = new ArrayList<String>();
		toEmaiList.add(email);
		String subject="ChiTou旅遊文章討論區";
//		輸入html文本格式
		String html= "<!DOCTYPE html>\r\n"
				+ "<html>\r\n"
				+ "<head>\r\n"
				+ "<meta charset=\"UTF-8\">\r\n"
				+ "<title>Insert title here</title>\r\n"
				+"<style>h4{color: #2A4C65;}</style>\r\n"
				+ "</head>\r\n"
				+ "<body>\r\n"
				+ "\r\n"
				+ "\r\n"
				+"<div style='text-align:center ;background-color: #F8E8D1;'>\r\n"
				+"<h4>親愛的"+username+"您好</h4>"
				+"<h4>◕‿◕ </h4>"
				+"<h4>由於您在文章【"+title+"】留言的｛"+comment+"｝遭到檢舉</h4>"
				+"<h4>(′⌒‵｡)</h4>"
				+"<h4>經審核後確有違規情形</h4>"
				+"<h4>依平台規定，將刪除該留言</h4>"
				+"<h4>(ಥ_ಥ)</h4>"
				+"<h4>ChiTou旅遊歡迎您再度留言</h4><h4>給發文者鼓勵與支持</h4>"
				+"<h4>✧*｡ ٩(ˊᗜˋ*)و✧*｡</h4>"
				+"</div>\r\n"
				+ "\r\n"
				+ "</body>\r\n"
				+ "</html>";
		gmailService.mimemail(fromEmail, toEmaiList, subject, html);
		return "redirect:"+adminReplyUrl;
	}
}