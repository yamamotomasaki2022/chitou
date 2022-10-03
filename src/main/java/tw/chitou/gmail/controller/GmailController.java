package tw.chitou.gmail.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import tw.chitou.gmail.model.GmailService;

@Controller
public class GmailController {
	
	 	@Autowired
		JavaMailSender javaMailSender;
	 	
	 	@Autowired
	 	GmailService gmailService;
	 	
	 	
	 	
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
		
//		嘗試發送email 跳轉到想要的jsp界面
		@GetMapping("/mail_test2")
		public String sendEmail2(){
//			寄信的人
			String fromEmail = "eeit49group1chitou@gmail.com";
//			群發到不同的人身上
			List<String> toEmaiList = new ArrayList<String>();
			String subject="Jacky的模板測試信";
//			
			String html= "sss";
			gmailService.mimemail(fromEmail, toEmaiList, subject, html);
			return "jsp界面";
			
		}
		

}
