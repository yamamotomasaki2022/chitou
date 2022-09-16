package tw.jacky.login.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.jacky.model.AdminChitou;
import tw.jacky.model.MemberBasicInfo;
import tw.jacky.model.MemberService;

@Controller
@SessionAttributes({"memberlist","adminlist"} )
public class MemberController {

	String adminlogin = "Jacky-AdminLogin";
	String adminhomepage = "Jacky-AdminHomePage";
	String home="Home";
	String adminurl="adminlist";
	String memberurl="memberlist";
	
	@Autowired
	private MemberService mService;
	
	
	@RequestMapping(path = "/adminlist")
	public String adminlist(Model m) {
		List<AdminChitou> adminlist = mService.searchAdminAll();
		m.addAttribute("adminlist",adminlist);
		return adminhomepage;
	}
	
	@RequestMapping(path = "/memberlist")
	public String memberlist (Model m) {
		List<MemberBasicInfo> memberlist = mService.searchMemberAll();
		m.addAttribute("memberlist",memberlist);
		return adminhomepage;
	}
	
	
	@RequestMapping(path = "/home", method=RequestMethod.POST)
	public String home() {
		return home;
	}
	
	
	@RequestMapping(path = "/loginmain.controller", method=RequestMethod.GET)
	public String processMainAction() {
		return adminlogin;
	}
	
	@RequestMapping(path = "/adminhomepage", method=RequestMethod.GET)
	public String adminHomePage() {
		return adminhomepage ;
	}
	
	
	
	@RequestMapping(path = "/entercreatememberpage",method = RequestMethod.POST)
	public String enterpage() {
		return "Jacky-AdminCreateMember";
	}
	
	@RequestMapping(path = "/entercreateadminpage",method = RequestMethod.POST)
	public String enterpage1() {
		return "Jacky-AdminCreateAdmin";
	}
	

	
	
	
	@RequestMapping(path = "/admininsertmember",method = RequestMethod.POST)
	public String processAdminInsertMember(@ModelAttribute("memberinfo") MemberBasicInfo mb, Model m) {
		mService.insert(mb);
		List<MemberBasicInfo> memberlist = mService.searchMemberAll();
		m.addAttribute("memberlist",memberlist);
		return adminhomepage ;
	}
	
	@RequestMapping(path = "/admininsertadmin")
	public String processAdminInsertAdmin(@ModelAttribute("memberinfo") AdminChitou mb, Model m) {
		mService.insertAdmin(mb);
		return "redirect:" + adminurl;
	}
	
	
//	@RequestMapping(path = "/admindeletemember",method = RequestMethod.POST)
//	public String processAdminDeleteMember(@ModelAttribute("memberlistinfo") MemberBean mb, Model m,
//			@RequestParam("td_memberid")String memberid) {
//		System.out.println(memberid);
//		System.out.println(mb.getMemberid());
//		boolean delete = mService.delete(mb);
//		if (delete) {
//			System.out.println("delete successfully");			
//		}else {
//			System.out.println("failed");
//		}
//		
//		return "Jacky-AdminHomePage";
//	}
	
	@RequestMapping(path = "/admindeletemember",method = RequestMethod.POST)
	public String processAdminDeleteMember(
			@RequestParam("td_memberid")String memberid_String,Model m) {
		
		int memberid = Integer.parseInt(memberid_String);
		boolean delete = mService.delete(memberid);
		if (delete) {
			System.out.println("delete successfully");			
		}else {
			System.out.println("failed");
		}
		
		List<MemberBasicInfo> memberlist = mService.searchMemberAll();
		m.addAttribute("memberlist",memberlist);
		
		return adminhomepage ;
	}
	
	
	@RequestMapping(path = "/admindeleteadmin",method = RequestMethod.POST)
	public String processAdminDeleteAdmin(
			@RequestParam("td_memberid")String adminid_String,Model m) {
		System.out.println(adminid_String);
		int adminid = Integer.parseInt(adminid_String);
		
		boolean delete = mService.deleteAdmin(adminid);
		System.out.println("是否刪除:" + delete);
		if (delete) {
			System.out.println("delete successfully");			
		}else {
			System.out.println("failed");
		}
		return "redirect:" + adminurl ;
	}
	
	
//	servlet的做法
	
	@RequestMapping(path = "/adminmodifypage",method = RequestMethod.POST)
	public String processadminmodifypage(HttpServletRequest request, HttpServletResponse response) {



		String memberid_String = request.getParameter("memberid");
		int memberid = Integer.parseInt(memberid_String);
		
		String statusid_String = request.getParameter("statusid");
		int statusid = Integer.parseInt(statusid_String);
		
		String username = request.getParameter("userid");
		String password = request.getParameter("password");
		String photo = request.getParameter("photo");
		String email = request.getParameter("email");
		
		
		
		MemberBasicInfo modifymemberbean = new MemberBasicInfo(memberid,statusid,username,password,photo,email);
		request.getSession().setAttribute("modifymemberbean", modifymemberbean);
		
		return "Jacky-AdminModifyPage";
	}
	
	
	
	@RequestMapping(path = "/adminupdatemember",method = RequestMethod.POST)
	public String processAdminUPdateMember(HttpServletRequest request, HttpServletResponse response,Model m) {
		String memberid_String = request.getParameter("memberid");
		int memberid = Integer.parseInt(memberid_String);
		
		String statusid_String = request.getParameter("statusid");
		int statusid = Integer.parseInt(statusid_String);
		
		String username = request.getParameter("userid");
		String password = request.getParameter("password");
		String photo = request.getParameter("photo");
		String email = request.getParameter("email");
		
		System.out.println("before update");
		
		
//		MemberBasicInfo modifymemberbean = new MemberBasicInfo();
		MemberBasicInfo modifymemberbean = new MemberBasicInfo(memberid,statusid,username,password,photo,email);
		
		int result = mService.update(modifymemberbean);
		
		
		System.out.println("after update");
		
		if(result == 1) {
			System.out.println("update successfully");
		}else {
			System.out.println("failed update");
		}
		
		
		return "redirect:" + memberurl ;
	}
	
	
	
	@RequestMapping(path = "/adminmodifyadminpage",method = RequestMethod.POST)
	public String processadminmodifyadminpage(HttpServletRequest request, HttpServletResponse response) {

		String adminid_String = request.getParameter("adminid");
		int adminid = Integer.parseInt(adminid_String);
		String adminstatus_String = request.getParameter("adminstatus");
		int adminstatus = Integer.parseInt(adminstatus_String);
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String permission_String = request.getParameter("permission");
		boolean permission = Boolean.parseBoolean(permission_String);
		
		AdminChitou modifyadminbean = new AdminChitou(adminid,adminstatus,username,password,permission);
		request.getSession().setAttribute("modifyadminbean", modifyadminbean);
		
		return "Jacky-AdminModifyAdminPage";
	}
	
	@RequestMapping(path = "/adminupdateAdmin",method = RequestMethod.POST)
	public String processAdminUPdateAdmin(HttpServletRequest request, HttpServletResponse response,Model m) {
		String adminid_String = request.getParameter("adminid");
		int adminid = Integer.parseInt(adminid_String);
		
		String adminstatus_String = request.getParameter("adminstatus");
		int adminstatus = Integer.parseInt(adminstatus_String);
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String permission_String = request.getParameter("permission");
		boolean permission = Boolean.parseBoolean(permission_String);
		
		
		System.out.println("權限:" + permission);
		System.out.println("before update");
		
		AdminChitou modifyadminbean = new AdminChitou(adminid,adminstatus,username,password,permission);
		
		int result = mService.updateAdmin(modifyadminbean);
		
		
		System.out.println("after update");
		
		if(result == 1) {
			System.out.println("update successfully");
		}else {
			System.out.println("failed update");
		}
		
		
		return "redirect:" + adminurl ;
	}
	
	
	
	
	
	
	
	@RequestMapping(path= "/adminsearchindb",method = RequestMethod.POST)
	public String processAdminSearchInDB(@RequestParam("searchinfo")String columnname, @RequestParam("searchtext") String value,Model m) {
		String hql = mService.mergeHql(columnname, value);
		List<MemberBasicInfo> result = mService.searchInDB(hql);
		m.addAttribute("result",result);
		
		return "Jacky-SearchPage";
	}
	
	
	
	
	
	
	@RequestMapping(path = "/adminlogin",method = RequestMethod.POST)
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
		
		boolean result = mService.adminCheckLogin(new AdminChitou(user, pwd));  
		AdminChitou statusBean = mService.adminSearchOne(user);
		int adminCheckStatus = mService.adminCheckStatus(statusBean);
		
		
		if(result) {
			m.addAttribute("user",user);
			m.addAttribute("pwd",pwd);
			
//			將管理員分級
			if (adminCheckStatus == 1) {
				System.out.println("regular admin");
			}else if (adminCheckStatus == 2) {
				System.out.println("manager");
			}else{
				System.out.println("boss");
			}
			
			
			List<MemberBasicInfo> memberlist = mService.searchMemberAll();
			m.addAttribute("memberlist",memberlist);
			
			List<AdminChitou> adminlist = mService.searchAdminAll();
			m.addAttribute("adminlist",adminlist);
			
			
			return adminhomepage;
			
		}
		
		errors.put("msg","please input correct username or passward");
		return adminlogin;
	}
	

	

	
	
}
