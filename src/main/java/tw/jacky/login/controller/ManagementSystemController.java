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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import tw.jacky.login.model.AdminChitou;
import tw.jacky.login.model.LoginService;
import tw.jacky.login.model.MemberBasicInfo;
@Controller
@SessionAttributes({"memberlist","adminlist","status"} )
public class ManagementSystemController {
	
	

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

	String method_memberlist = "memberlist";
	String method_adminlist = "adminlist";
	

//	------------------------------------------------------------------------------------------------------------------------------------------------------------
// 頁面
	
	String page_adminlogin =  path_admin_login + "AdminLogin";
	String page_adminhomepage= path_admin_login +  "AdminHomePage";
	
	
	
	
//	------------------------------------------------------------------------------------------------------------------------------------------------------------
//	管理員登入界面
	@RequestMapping(path = "/adminlogin", method=RequestMethod.GET)
	public String processMainAction() {
		return   page_adminlogin;
	}
	
	@RequestMapping(path = "/adminhomepage")
	public String processAdminHomePage() {
		return page_adminhomepage;
	}
	

//	跳轉到 admin 新增 會員
	@RequestMapping(path = "/ToAdminCreateMemberPage", method=RequestMethod.POST)
	public String processToAdminCreateMemberPage() {
		return  path_admin_login + "AdminCreateMember" ;
	}
	
//	跳轉到 admin 更新會員資料

	@PostMapping(path = "/ToAdminModifyMember")
	public String processToAdminModifyMember(@RequestParam("memberid") int id, Model m) {
		MemberBasicInfo modifymemberbean = lservice.findByMemberid(id);
		m.addAttribute("modifymemberbean",modifymemberbean);
		return  path_admin_login + "AdminModifyMemberPage";
	}
//	跳轉到 admin 新增admin page
	@PostMapping("/ToAdminCreateAdmin")
	public  String processToAdminCreateAdmin() {
		return  path_admin_login + "AdminCreateAdmin";
	}
	
	
//	跳轉到 admin 修改admin page
	@PostMapping("/ToAdminModifyAdmin")
	public String processToAdminModifyAdmin(@RequestParam("adminid") int id, Model m) {
		AdminChitou modifyadminbean = lservice.findByAdminId(id);
		m.addAttribute("modifyadminbean",modifyadminbean);
		return  path_admin_login + "AdminModifyAdminPage";
	}
	
	
//	管理員登出
	
	@RequestMapping(path = "/logout")
	public String processToLogOut( SessionStatus status) {
		status.setComplete();
		return page_adminlogin;
	}
	
	
	
//	------------------------------------------------------------------------------------------------------------------------------------------------------------
//	秀出memberlist
	@GetMapping(path = "/memberlist")
	public String Memberlist (Model m) {
		List<MemberBasicInfo> memberlist = lservice.memberFindAll();
		m.addAttribute("memberlist",memberlist);
		return page_adminhomepage;
	}

	
//	秀出adminlist
	@GetMapping(path = "/adminlist")
	public String Adminlist (Model m) {
		List<AdminChitou> adminlist = lservice.adminFindAll();
		m.addAttribute("adminlist",adminlist);
		return page_adminhomepage;
	}

	
//	------------------------------------------------------------------------------------------------------------------------------------------------------------

//	管理員新增會員
	@PostMapping(path = "/admininsertmember")
	public String processAdminInsertMember(@RequestParam("username") String username, @RequestParam("password") String password, @RequestParam("myFile") 
	MultipartFile mf,@RequestParam("email") String email) {
//		將照片存入文件夾内
		
		String photo = lservice.savePicToLocal(mf);
		String pic_locaiton = piclocation + photo;
		
//		會員預設權力為 1
		MemberBasicInfo bean = new MemberBasicInfo(1,username,password,pic_locaiton,email);
		lservice.adminInsertMember(bean);
		
		
		return "redirect:" + method_memberlist ;
	}
	
//	管理員刪除會員
	@DeleteMapping(path= "/AdminDeleteMember")
	public String processAdminDeleteMember(@RequestParam("td_memberid") int memberid) {
		System.out.println("檢查刪除的ID：" + memberid);
		lservice.adminDeleteMember(memberid);
		return "redirect:" + method_memberlist;
	}

	
//  管理員更新會員
	@PutMapping(path = "/AdminModifyMember")
	public String processAdminModifyMember(@RequestParam("memberid") int memberid, @RequestParam("statusid") int statusid, @RequestParam("username")
			String username, @RequestParam("password") String password, @RequestParam("myFile") 
			MultipartFile mf, @RequestParam("email") String email) {
		
		
		String photo = lservice.savePicToLocal(mf);
		String pic_locaiton = piclocation + photo;
		
		MemberBasicInfo memberBasicInfo = new MemberBasicInfo(memberid,statusid,username,password,pic_locaiton,email);
		lservice.adminModifyMember(memberBasicInfo);
		
		return "redirect:" + method_memberlist;
	}
	
//	管理員查詢會員資料
	@GetMapping(path = "/AdminQueryMember")
	public String processAdminQueryMember(@RequestParam("searchinfo") String column, @RequestParam("searchtext") String value,Model m) {
		String hql = lservice.mergeHql(column, value);
		List<MemberBasicInfo> result = lservice.adminQeuryMember(hql);
		m.addAttribute("result", result );
		return path_admin_login + "SearchPage";
	}
	
	
	
//	------------------------------------------------------------------------------------------------------------------------------------------------------------

//	admin
	
	
	
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
			return page_adminlogin;
		}
		
		boolean result = lservice.checkAdminLogin(user, pwd);  
		System.out.println("檢查賬號密碼的結果是 ：" +result);
		AdminChitou statusBean = lservice.findByAdminUersname(user);
		int adminCheckStatus = statusBean.getAdminstatus();
		
		
		if(result) {
			m.addAttribute("user",user);
			m.addAttribute("pwd",pwd);
			
//			將管理員分級
			if (adminCheckStatus == 1) {
				System.out.println("我的權限是: regular admin");
				m.addAttribute("status", 1);
			}else if (adminCheckStatus == 2) {
				System.out.println("我的權限是: manager");
				m.addAttribute("status", 2);
			}else{
				System.out.println("我的權限是: boss");
				m.addAttribute("status", 3);
			}
			
			Memberlist(m);
			Adminlist(m);
			
			return  page_adminhomepage;
		}
		
		errors.put("msg","please input correct username or passward");
		return  page_adminlogin;
	}
	
	
	
//	管理員 新增管理員
	@PostMapping(path="/AdminInsertAdmin")
	public String processAdminInsertAdmin(@RequestParam("adminstatus") String adminstatus, @RequestParam("username") String username, @RequestParam("password") String password) {
		
		int adminstatus_int = Integer.parseInt(adminstatus);
		AdminChitou adminChitou = new AdminChitou(adminstatus_int,username,password,true);
		lservice.adminInsertAdmin(adminChitou);
		return "redirect:" + method_adminlist;
	}
	
//	管理員刪除管理員
	@DeleteMapping(path = "AdminDeleteAdmin")
	public String processAdminDeleteAdmin(@RequestParam("td_memberid") String adminid) {
		int adminid_int = Integer.parseInt(adminid);
		lservice.adminDeleteAdmin(adminid_int);
		return "redirect:" + method_adminlist;
	}
	
//	管理員更新管理員基本咨詢
	@PutMapping(path="AdminModifyAdmin")
	public String processAdminModifyAdmin(@RequestParam("adminid")String adminid,@RequestParam("adminstatus") String adminstatus,@RequestParam("username") String username
			, @RequestParam("password") String password, @RequestParam("permission")String permission) {
		int adminid_int = Integer.parseInt(adminid);
		int adminstatus_int = Integer.parseInt(adminstatus);
		boolean permission_boolean = Boolean.parseBoolean(permission);
		
		AdminChitou adminChitou = new AdminChitou(adminid_int,adminstatus_int,username,password,permission_boolean);
		lservice.adminInsertAdmin(adminChitou);
		return "redirect:" + method_adminlist;
	}
	
	


}
