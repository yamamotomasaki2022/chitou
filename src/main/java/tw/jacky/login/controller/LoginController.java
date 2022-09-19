package tw.jacky.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	
	
	String adminlogin = "AdminLogin";
	
	@RequestMapping(path = "/adminlogin", method=RequestMethod.GET)
	public String processMainAction() {
		return   "jacky/login/" + adminlogin;
	}
	
	

}
