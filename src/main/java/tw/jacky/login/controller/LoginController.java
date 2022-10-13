package tw.jacky.login.controller;

import java.nio.file.Path;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.metamodel.model.domain.internal.MapMember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import net.bytebuddy.utility.RandomString;
import tw.chitou.exception.UserExistException;
import tw.chitou.gmail.controller.GmailController;
import tw.chitou.gmail.model.GmailService;
import tw.jacky.login.model.LoginService;
import tw.jacky.login.model.MemberBasicInfo;
import tw.jacky.login.model.MemberDetailInfo;

@Controller
@SessionAttributes({"memberbasicinfo" ,"memberdetailinfo" })
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
	
	
	@GetMapping(path = "/toForgetPassword")
	public String processtoForgetPassword() {
		return  path_main_login + "ForgetPassword";
	}
	
	@GetMapping(path = "/EmailCheckUp")
	@ResponseBody
	public boolean processEmailCheckUp(@RequestParam("email") String email) {
		
		System.out.println("我的email：" + email);
		
		try {
			MemberBasicInfo memberbean = lservice.findByEmail(email);
			
			
			if (memberbean !=null) {
				
				return true;
			}
			else {
				return false;
			}
		} catch (Exception e) {
			
			return false;
		}
	}
	
	@RequestMapping(path="/sendVerificationMailFromForgetPassword")
	public String processsendVerificationMailFromForgetPassword(@RequestParam("email")String email,Model m) {
		String randomCode = RandomString.make(5);
		MemberBasicInfo memberbean = lservice.findByEmail(email);
		memberbean.setVerificationcode(randomCode);
		lservice.adminUpdateMember(memberbean);
		MemberDetailInfo memberdetail = lservice.findDetailByMemberid(memberbean.getMemberid());
		gmailController.sendVerificationEmailForgerPassword(memberbean, memberdetail);
		m.addAttribute("memberbasicinfo",memberbean);
		
		
		return "jacky/SendEmailPage";
	}
	
//	會員忘記密碼并且修改
	@PostMapping(path="/MemberForgetPasswordAndModify")
	public String processMemberForgetPasswordAndModify(@RequestParam("username") String username,@RequestParam("password") String password) {
		System.out.println("要修改的密碼："+ password);
		System.out.println("要修改的賬號："+ username);
		
		MemberBasicInfo memberbean = lservice.findBasicInfobyUsername(username);
		password=managementSystemController.encrpytMemberPassword(memberbean);
		memberbean.setPassword(password);
		lservice.adminUpdateMember(memberbean);
		
		return "Home";
	}
	
	
	
	
//	注冊會員

	@PostMapping(path = "/MemberRegisterIntoDB")
	public String processMemberRegisterIntoDB(@RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("email") String email,
			@RequestParam("myFile") MultipartFile mf, @RequestParam("name") String name,
			@RequestParam("phone") String phone, @RequestParam("address") String address,
			@RequestParam("nickname") String nickname, @RequestParam("nationality") String nationality,
			@RequestParam("birth") String birth, @RequestParam("gender") String gender) {

		String photo = lservice.savePicToLocal(mf);
		String pic_locaiton = piclocation + photo;

		String randomCode = RandomString.make(15);
		MemberBasicInfo bean = new MemberBasicInfo(4, username, password, pic_locaiton, email, randomCode);
		String encrpytMemberPassword = managementSystemController.encrpytMemberPassword(bean);
		bean.setPassword(encrpytMemberPassword);
		
		try {
			MemberBasicInfo memberBasicInfo = lservice.adminInsertMember(bean);
			Date date = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String createtime = simpleDateFormat.format(date);
			String modifytime = createtime;
			
			System.out.println("我的生日:" + birth);
			
			MemberDetailInfo memberDetailInfo = new MemberDetailInfo(memberBasicInfo.getMemberid(), name, phone, address,
					nickname, nationality, birth, gender, createtime, modifytime);
			lservice.adminInsertMemberDetailInfo(memberDetailInfo);
			
			gmailController.sendVerificationEmail(memberBasicInfo, memberDetailInfo);
			
			return path_member_login + "MemberRegisterVerificationPage";
		} catch (Exception e) {
			throw new UserExistException();
			
		}
		

//		return "sss";
	}

	

}
