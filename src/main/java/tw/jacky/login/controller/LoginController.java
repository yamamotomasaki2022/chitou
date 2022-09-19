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
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.jacky.login.model.AdminChitou;
import tw.jacky.login.model.LoginService;
import tw.jacky.login.model.MemberBasicInfo;

@Controller
@SessionAttributes({"memberlist","adminlist"} )
public class LoginController {
	
	@Autowired
	private LoginService lservice;
	
	String adminlogin = "jacky/login/AdminLogin";
	String adminhomepage= "jacky/login/AdminHomePage";
	String memberlist = "memberlist";

	
//	------------------------------------------------------------------------------------------------------------------------------------------------------------

//	管理員登入界面
	@RequestMapping(path = "/adminlogin", method=RequestMethod.GET)
	public String processMainAction() {
		return   adminlogin;
	}
//	跳轉到 admin 新增 會員
	@RequestMapping(path = "/ToAdminCreateMemberPage", method=RequestMethod.POST)
	public String processToAdminCreateMemberPage() {
		return   "jacky/login/AdminCreateMember" ;
	}
	
//	跳轉到 admin 更新會員資料

	@PostMapping(path = "/ToAdminModifyMember")
	public String processToAdminModifyMember(@RequestParam("memberid") int id, Model m) {
		MemberBasicInfo modifymemberbean = lservice.findByMemberid(id);
		m.addAttribute("modifymemberbean",modifymemberbean);
		return "jacky/login/AdminModifyMemberPage";
	}
	
//	------------------------------------------------------------------------------------------------------------------------------------------------------------
//	秀出memberlist
	@RequestMapping(path = "/memberlist")
	public String memberlist (Model m) {
		List<MemberBasicInfo> memberlist = lservice.memberFindAll();
		m.addAttribute("memberlist",memberlist);
		return adminhomepage;
	}


	
//	------------------------------------------------------------------------------------------------------------------------------------------------------------
//	檢查賬號密碼是否正確
	@PostMapping(path = "/adminchecklogin")
	public String processAdminCheckLogin(@RequestParam("loginuserid")String user,@RequestParam("loginpw")String pwd,Model m) {
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors",errors);
		
		if(user == null || user.length()==0) {
			errors.put("name","name is required");
		}
		
		if(pwd==null||pwd.length()==0) {
			errors.put("pwd","password is required");
		}
		
		if(errors!=null && !errors.isEmpty()) {
			return adminlogin;
		}
		
		boolean result = lservice.checkAdminLogin(user, pwd);  
		System.out.println("檢查賬號密碼的結果是 ：" +result);
//		AdminChitou statusBean = lService.adminSearchOne(user);
//		int adminCheckStatus = lService.adminCheckStatus(statusBean);
		
		
		if(result) {
			m.addAttribute("user",user);
			m.addAttribute("pwd",pwd);
			
////			將管理員分級
//			if (adminCheckStatus == 1) {
//				System.out.println("regular admin");
//			}else if (adminCheckStatus == 2) {
//				System.out.println("manager");
//			}else{
//				System.out.println("boss");
//			}
			
			
			List<MemberBasicInfo> memberlist = lservice.memberFindAll();
			m.addAttribute("memberlist",memberlist);
			
			List<AdminChitou> adminlist = lservice.adminFindAll();
			m.addAttribute("adminlist",adminlist);
			
			return  adminhomepage;
			
		}
		
		errors.put("msg","please input correct username or passward");
		return  adminlogin;
	}
	
//	管理員新增會員
	@PostMapping(path = "/admininsertmember")
	public String processAdminInsertMember(@RequestParam("username") String username, @RequestParam("password") String password, @RequestParam("photo") 
			String photo,@RequestParam("email") String email) {
//		會員預設權力為 1
		MemberBasicInfo bean = new MemberBasicInfo(1,username,password,photo,email);
		MemberBasicInfo adminInsertMember = lservice.adminInsertMember(bean);
		
		return "redirect:" + memberlist ;
	}
	
//	管理員刪除會員
	@DeleteMapping(path= "/AdminDeleteMember")
	public String processAdminDeleteMember(@RequestParam("td_memberid") int memberid) {
		System.out.println("檢查刪除的ID：" + memberid);
		lservice.adminDeleteMember(memberid);
		return "redirect:" + memberlist;
	}

	
//  管理員更新會員
	@PutMapping(path = "/AdminModifyMember")
	public String processAdminModifyMember(@RequestParam("memberid") int memberid, @RequestParam("statusid") int statusid, @RequestParam("username")
			String username, @RequestParam("password") String password, @RequestParam("photo") String photo, @RequestParam("email") String email) {
		
		MemberBasicInfo memberBasicInfo = new MemberBasicInfo(memberid,statusid,username,password,photo,email);
		lservice.adminModifyMember(memberBasicInfo);
		
		return "redirect:" + memberlist;
	}
	
//	管理員查詢會員資料
	@GetMapping(path = "/AdminQueryMember")
	public String processAdminQueryMember(@RequestParam("searchinfo") String column, @RequestParam("searchtext") String value,Model m) {
		String hql = lservice.mergeHql(column, value);
		List<MemberBasicInfo> result = lservice.adminQeuryMember(hql);
		m.addAttribute("result", result );
		return "jacky/login/SearchPage";
	}


}
