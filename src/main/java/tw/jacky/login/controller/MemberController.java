package tw.jacky.login.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import tw.jacky.login.model.AdminChitou;
import tw.jacky.login.model.LoginService;
import tw.jacky.login.model.MemberBasicInfo;
import tw.jacky.login.model.MemberDetailInfo;


@Controller
@SessionAttributes({"memberbean","adminlist"} )
//@RequestMapping("/member")
public class MemberController {
	
	

	@Autowired
	private LoginService lservice;
	
	
	@Autowired
	private ManagementSystemController managementSystemController;
	
//	------------------------------------------------------------------------------------------------------------------------------------------------------------
//	路徑
	
	String path_main_login = "jacky/login/";
	String path_admin_login =  path_main_login + "adminlogin/";
	String path_member_login =  path_main_login + "memberlogin/";
	String image_admin_page = "images/jacky/";
	String piclocation= image_admin_page + "login/";
	
	
	
	
//	------------------------------------------------------------------------------------------------------------------------------------------------------------
// Mapping方法

	

//	------------------------------------------------------------------------------------------------------------------------------------------------------------
// 頁面
	

	String page_memberhomepage= path_member_login + "MemberHomePage";
	String page_memberlogin= path_member_login + "MemberLogin";
	
	
	
	
//	------------------------------------------------------------------------------------------------------------------------------------------------------------
//	會員登入界面

	
	
	
//	------------------------------------------------------------------------------------------------------------------------------------------------------------

	

	@RequestMapping(path= "toMemberHomePage")
	public String MemberHomePage() {
		return path_member_login + "MemberHomePage";
	}
	
	
	@GetMapping(path= "/toMemberRegisterPage")
	public String processtoMemberRegisterPage(){
		return  "jacky/login/memberlogin/MemberRegisterPage";
	}
	
	
//	注冊會員
	
	@PostMapping(path= "/MemberRegisterIntoDB")
	public String processMemberRegisterIntoDB(@RequestParam("username") String username,@RequestParam("password") String password, 
			@RequestParam("email") String email, @RequestParam("myFile") MultipartFile mf, @RequestParam("name") String name,
			@RequestParam("phone") String phone, @RequestParam("address") String address, @RequestParam("nickname") String nickname,
			@RequestParam("nationality") String nationality, @RequestParam("birthday") String birthday, @RequestParam("gender") String gender) {
		
		String photo = lservice.savePicToLocal(mf);
		String pic_locaiton = piclocation + photo;
		
		
		MemberBasicInfo bean = new MemberBasicInfo(4, username, password, pic_locaiton, email);
		String encrpytMemberPassword = managementSystemController.encrpytMemberPassword(bean);
		bean.setPassword(encrpytMemberPassword);
		MemberBasicInfo memberBasicInfo = lservice.adminInsertMember(bean);
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy-MM-dd hh:mm:ss");
		String createtime = simpleDateFormat.format(date);
		String modifytime = createtime;
				
				
		System.out.println(createtime);
		MemberDetailInfo memberDetailInfo = new MemberDetailInfo(memberBasicInfo.getMemberid(),name,phone,address,nickname,nationality,birthday,gender,createtime,modifytime);
		lservice.adminInsertMemberDetailInfo(memberDetailInfo);
		
		return path_member_login + "MemberRegisterVerificationPage";
	}
	
	
	

}
