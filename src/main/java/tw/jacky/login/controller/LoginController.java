package tw.jacky.login.controller;

import java.nio.file.Path;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import tw.jacky.login.model.LoginService;

@Controller
public class LoginController {
	
	
	@Autowired
	private LoginService lservice;
	
	String path_main_login = "jacky/login/";
	String path_admin_login =  path_main_login + "adminlogin/";
	String path_member_login =  path_main_login + "memberlogin/";
	String image_admin_page = "images/jacky/";
	String piclocation= image_admin_page + "login/";
	
	
	@RequestMapping(path="/toHomepage")
	public String toHomepage() {
		return path_main_login + "Home";
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
	
	
	
	

}
