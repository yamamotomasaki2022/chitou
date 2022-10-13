package tw.jacky.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.jacky.login.model.AdminChitou;
import tw.jacky.login.model.LoginService;

@Controller
public class TestController {
	
	@Autowired
	LoginService lService;
	
	@Autowired
	ManagementSystemController managementSystemController;
	
	

	@RequestMapping(path="/insertdata")
	@ResponseBody
	public String insertdata() {
		AdminChitou adminChitou = new AdminChitou(3, "boss", "123", true);
		String encrpytAdminPassword = managementSystemController.encrpytAdminPassword(adminChitou);
		adminChitou = new AdminChitou(3, "boss", encrpytAdminPassword, true);
		lService.adminInsertAdmin(adminChitou);
		return "boss inserted";
	}
	
	@RequestMapping(path="/member/sss")
	@ResponseBody
	public String verifiedMember(){
		return "你好";
	}
	
	
	
	

}
