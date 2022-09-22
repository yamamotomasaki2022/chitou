package tw.jacky.login.controller;

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
	
	String adminlogin = "jacky/login/AdminLogin";
	String adminhomepage= "jacky/login/AdminHomePage";
	String memberlist = "memberlist";
	String adminlist = "adminlist";
	
	String piclocation= "images/jacky/login/";
	
	

	
	
	

}
