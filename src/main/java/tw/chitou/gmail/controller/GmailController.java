package tw.chitou.gmail.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.chitou.gmail.model.GmailService;
import tw.chitou.gmail.model.TemplateServices;
import tw.jacky.login.model.MemberBasicInfo;
import tw.jacky.login.model.MemberDetailInfo;
import tw.trista.flightticket.model.flightticketorder;
import tw.trista.flightticket.model.flightticketorderservice;

@Controller
public class GmailController {
	
	
	
		
	
	 	@Autowired
		JavaMailSender javaMailSender;
	 	
	 	@Autowired
	 	GmailService gmailService;
	 	
	 	@Autowired
	 	TemplateServices templateService;
	 	
	 	@Autowired
	 	private flightticketorderservice ooService;
	 	
	 	String adminUrl="http://localhost:8080/chitou.flightticket";
	 	
	 	
		String path_main_login = "jacky/login/";
		String path_admin_login = path_main_login + "adminlogin/";
		String path_member_login = path_main_login + "memberlogin/";
		String image_admin_page = "images/jacky/";
		String piclocation = image_admin_page + "login/";
	 	
	 	
//		嘗試發送email
		@GetMapping("/mail_test1")
		@ResponseBody
		public ResponseEntity<Object> sendEmail(){
			
//			簡單的通知信 可以這麽用
			SimpleMailMessage sm = new SimpleMailMessage();
			sm.setFrom("eeit49group1chitou@gmail.com");//input the sender email Id or read it from properties file
			sm.setTo("learningma0926@gmail.com");
			sm.setSubject("Welcome to Java SpringBoot Application Test 1");
			sm.setText(" 你好嗎? 測試發送成功 謝謝！");
			javaMailSender.send(sm);
			
			return generateResponse("Email Sent to the mail "+ "learningma0926@gmail.com", HttpStatus.OK);
		}
		
		
//		return a json file-> illustrate you have sent email successfully
		public ResponseEntity<Object> generateResponse(String msg, HttpStatus st){
			Map<String, Object> mp = new HashMap<String, Object>();
			
			mp.put("message", msg);
			mp.put("status", st.value());
//			mp.put("data",response);
			
			return  new ResponseEntity<Object>(mp,st);
		}
		
//		嘗試發送email 跳轉到想要的一般的html界面
		@GetMapping("/mail_test2")
		@ResponseBody
		public String sendEmail2(){
//			寄信的人
			String fromEmail = "eeit49group1chitou@gmail.com";
//			群發到不同的人身上
			List<String> toEmaiList = new ArrayList<String>();
			toEmaiList.add("learningma0926@gmail.com");
			String subject="Jacky的模板測試信";
//			輸入html文本格式
			String html= "<!DOCTYPE html>\r\n"
					+ "<html>\r\n"
					+ "<head>\r\n"
					+ "<meta charset=\"UTF-8\">\r\n"
					+ "<title>Insert title here</title>\r\n"
					+ "</head>\r\n"
					+ "<body>\r\n"
					+ "\r\n"
					+ "\r\n"
					+ "<h1>測試是否能運行</h1>\r\n"
					+ "\r\n"
					+ "</body>\r\n"
					+ "</html>";
			gmailService.mimemail(fromEmail, toEmaiList, subject, html);
			return "傳送email成功";
		}
		
		
		
//		嘗試發送email 跳轉到想要的thymeleaf的html界面
		@GetMapping("/mail_test3")
		public String sendEmail3(){
//			寄信的人
			String fromEmail = "eeit49group1chitou@gmail.com";
//			群發到不同的人身上
			List<String> toEmaiList = new ArrayList<String>();
			toEmaiList.add("learningma0926@gmail.com");
			String subject="Jacky的模板測試信";
			Map<String,String> params= new HashMap<>();
//			有什麽參數就放進來
			params.put("name", "新傑");
//			輸入html文本格式
			String html = templateService.render("test", params);
			System.out.println(html);
			gmailService.mimemail(fromEmail, toEmaiList, subject, html);
			return  "jacky/SendEmailPage";
		}
		
		@GetMapping("/sendVerificationEmail")
		public void sendVerificationEmail(MemberBasicInfo member, MemberDetailInfo memberDetailInfo) {
			String verification_code= member.getVerificationcode() ;
			List<String> toEmaiList = new ArrayList<String>();
			toEmaiList.add(member.getEmail());
		    String fromAddress = "eeit49chitougroup1@gmail.com";
//		    String senderName = "Your company name";
		    String subject = "會員權限驗證";
		    Map<String,String> params= new HashMap<>();
		    params.put("name", member.getUsername());
		    params.put("code", verification_code);
		    String html = templateService.render("verify", params);
		    gmailService.mimemail(fromAddress, toEmaiList, subject, html);
//		    return  "jacky/memberlogin/MemberRegisterPage";
		}
		
		
		@GetMapping("/sendVerificationEmailForgerPassword")
		public void sendVerificationEmailForgerPassword(MemberBasicInfo member, MemberDetailInfo memberDetailInfo) {
			String verification_code= member.getVerificationcode() ;
			List<String> toEmaiList = new ArrayList<String>();
			toEmaiList.add(member.getEmail());
		    String fromAddress = "eeit49chitougroup1@gmail.com";
//		    String senderName = "Your company name";
		    String subject = "忘記密碼驗證";
		    Map<String,String> params= new HashMap<>();
		    params.put("name", member.getUsername());
		    params.put("code", verification_code);
		    String html = templateService.render("verifyforgetpw", params);
		    gmailService.mimemail(fromAddress, toEmaiList, subject, html);
//		    return  "jacky/memberlogin/MemberRegisterPage";
		}
		
		@GetMapping("/sendVerificationEmailStatusId")
		public void sendVerificationEmailStatusId(MemberBasicInfo member, MemberDetailInfo memberDetailInfo) {
			String verification_code= member.getVerificationcode() ;
			List<String> toEmaiList = new ArrayList<String>();
			toEmaiList.add(member.getEmail());
		    String fromAddress = "eeit49chitougroup1@gmail.com";
//		    String senderName = "Your company name";
		    String subject = "會員權限驗證";
		    Map<String,String> params= new HashMap<>();
		    params.put("name", member.getUsername());
		    params.put("code", verification_code);
		    String html = templateService.render("verifystatusidto5", params);
		    gmailService.mimemail(fromAddress, toEmaiList, subject, html);
//		    return  "jacky/memberlogin/MemberRegisterPage";
		}
		
		
		@GetMapping("/verify")
		public String verifyAccount(@Param("code") String code, Model m) {
			System.out.println("進到方法的驗證碼:" + code);
			boolean verified = gmailService.verify(code);

			System.out.println("email驗證:" + verified);

			if (verified) {

				return path_member_login + "VerificationSuccess";

			} else {

				return path_member_login + "VerificationFailure";
			}
		}
		
		
		@GetMapping("/verifyPassword")
		public String changePassword(@Param("code") String code, Model m) {
			System.out.println("進到方法的驗證碼:" + code);
			boolean verified = gmailService.verify(code);

			System.out.println("email驗證:" + verified);

			if (verified) {
				return path_member_login + "PasswordModifyPage";

			} else {

				return path_member_login + "VerificationFailure";
			}
		}
		
		
//		gmail - trista_version
		
		@PostMapping("/flightticket.mail")
		public void sendEmailFlightTicket(String lastname , String email){
//	 		List<flightticketorder> foder = ooService.findByLastname(lastname);
	 		
//	 		System.out.println(foder.toString());
//
//			String username = foder.get(0).getLastname();
//			String email = foder.get(0).getEmailaddress();

//			寄信的人
			String fromEmail = "eeit49chitougroup1@gmail.com";
//			群發到不同的人身上
			List<String> toEmaiList = new ArrayList<String>();
			toEmaiList.add(email);
			String subject="ChiTou訂機票";
//			輸入html文本格式
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
					+"<h4>親愛的"+lastname+"您好</h4>"
					+"<h4>◕‿◕ </h4>"
					+"<h4>您的航班已預訂成功</h4>"
					+"<h4>ChiTou旅遊感謝您的預訂</h4><h4>如果您對於航班有任何疑問,請聯絡ChiTou</h4>"
					+"<h4>✧*｡ ٩(ˊᗜˋ*)و✧*｡</h4>"
					+"</div>\r\n"
					+ "\r\n"
					+ "</body>\r\n"
					+ "</html>";
			gmailService.mimemail(fromEmail, toEmaiList, subject, html);
		}
	}

		


