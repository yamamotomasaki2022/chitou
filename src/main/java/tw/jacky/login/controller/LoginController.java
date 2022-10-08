package tw.jacky.login.controller;

import java.nio.file.Path;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import net.bytebuddy.utility.RandomString;
import tw.chitou.gmail.controller.GmailController;
import tw.chitou.gmail.model.GmailService;
import tw.jacky.login.model.LoginService;
import tw.jacky.login.model.MemberBasicInfo;
import tw.jacky.login.model.MemberDetailInfo;

@Controller

public class LoginController {
	
	
	@Autowired
	private LoginService lservice;
	
	@Autowired
	private GmailController gmailController;
	
	@Autowired
	private ManagementSystemController managementSystemController;
	
	
	
	String path_main_login = "jacky/login/";
	String path_admin_login =  path_main_login + "adminlogin/";
	String path_member_login =  path_main_login + "memberlogin/";
	String image_admin_page = "images/jacky/";
	String piclocation= image_admin_page + "login/";
	
	
	@RequestMapping(path="/toHomepage")
	public String toHomepage() {
		return "Home";
	}
	

	
	@RequestMapping(path="/toAdminLoginPage")
	public String toAdminLoginPage() {
		return path_admin_login + "AdminLogin";
	}

	
	@RequestMapping(path="/toMemberLoginPage")
	public String toMemberLoginPage() {
		return path_member_login + "MemberLogin";
	}
	
	@RequestMapping(path="/loginpage")
	public String toMainLoginPage() {
		return path_main_login + "MainLoginPage";
	}
	
	@GetMapping(path = "/toMemberRegisterPage")
	public String processtoMemberRegisterPage() {
		return "jacky/login/memberlogin/MemberRegisterPage";
	}
	
	
	@RequestMapping(path="/testpage")
	@ResponseBody
	public String test() {
		return "test security sucessful";
	}
	
//	注冊會員

	@PostMapping(path = "/MemberRegisterIntoDB")
	public String processMemberRegisterIntoDB(@RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("email") String email,
			@RequestParam("myFile") MultipartFile mf, @RequestParam("name") String name,
			@RequestParam("phone") String phone, @RequestParam("address") String address,
			@RequestParam("nickname") String nickname, @RequestParam("nationality") String nationality,
			@RequestParam("birthday") String birthday, @RequestParam("gender") String gender) {

		String photo = lservice.savePicToLocal(mf);
		String pic_locaiton = piclocation + photo;

		String randomCode = RandomString.make(15);
		MemberBasicInfo bean = new MemberBasicInfo(4, username, password, pic_locaiton, email, randomCode);
		String encrpytMemberPassword = managementSystemController.encrpytMemberPassword(bean);
		bean.setPassword(encrpytMemberPassword);
		MemberBasicInfo memberBasicInfo = lservice.adminInsertMember(bean);
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String createtime = simpleDateFormat.format(date);
		String modifytime = createtime;
		MemberDetailInfo memberDetailInfo = new MemberDetailInfo(memberBasicInfo.getMemberid(), name, phone, address,
				nickname, nationality, birthday, gender, createtime, modifytime);
		lservice.adminInsertMemberDetailInfo(memberDetailInfo);

		gmailController.sendVerificationEmail(memberBasicInfo, memberDetailInfo);

//		return "sss";
		return path_member_login + "MemberRegisterVerificationPage";
	}

	

}
