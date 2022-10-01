package tw.jacky.login.controller;

import java.util.HashMap;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import tw.jacky.login.model.AdminChitou;
import tw.jacky.login.model.LoginService;
import tw.jacky.login.model.MemberBasicInfo;
@Controller
@SessionAttributes({"memberbean","adminlist"} )
@RequestMapping("/member")
public class MemberController {
	
	

	@Autowired
	private LoginService lservice;
	
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

	
	
	
	
	
	
	

}
