package tw.jacky.login.controller;

import java.beans.beancontext.BeanContextMembershipListener;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.supercsv.io.AbstractCsvWriter;
import org.supercsv.io.CsvBeanWriter;
import org.supercsv.io.ICsvBeanWriter;
import org.supercsv.prefs.CsvPreference;

import com.lowagie.text.DocumentException;

import tw.chitou.util.PdfExporter;
import tw.jacky.login.model.AdminChitou;
import tw.jacky.login.model.LoginService;
import tw.jacky.login.model.MembeAllInfo;
import tw.jacky.login.model.MemberBasicInfo;
import tw.jacky.login.model.MemberDetailInfo;

@Controller
@SessionAttributes({ "memberlist", "adminlist", "session_status", "crud" })
@RequestMapping(path = "/manager")
public class ManagementSystemController {

	@Autowired
	private LoginService lservice;

//	 測試Merge后版本

//	------------------------------------------------------------------------------------------------------------------------------------------------------------
//	路徑

	String path_main_login = "jacky/login/";
	String path_admin_login = path_main_login + "adminlogin/";
	String path_member_login = path_main_login + "memberlogin/";
	String image_admin_page = "images/jacky/";
	String piclocation = image_admin_page + "login/";

//	------------------------------------------------------------------------------------------------------------------------------------------------------------
// Mapping方法

//	String method_memberlist = "memberlist";
//	String method_adminlist = "adminlist";
	String method_ShowTableInHomePage = "ShowTableInHomePage";

//	------------------------------------------------------------------------------------------------------------------------------------------------------------
// 頁面

	String page_adminlogin = path_admin_login + "AdminLogin";
	String page_adminhomepage = path_admin_login + "AdminHomePage";

//	------------------------------------------------------------------------------------------------------------------------------------------------------------
//  ajax controller

	@GetMapping(path = "/crudBean")
	@ResponseBody
	public String crudBean(Model m) {
		System.out.println("進來了");
		m.addAttribute("crud", 0);
		return "delete crud_Bean";
	}

//	------------------------------------------------------------------------------------------------------------------------------------------------------------
//	管理員登入界面
	@RequestMapping(path = "/AdminLogin", method = RequestMethod.GET)
	public String processMainAction() {
		return page_adminlogin;
	}

	@RequestMapping(path = "/AdminHomePage/{id}")
	public String processAdminHomePage(@PathVariable("id") Integer id, Model m) {
		processShowTableInHomePage(m);
//		System.out.println("取到數字:" + id);
		m.addAttribute("session_status", id);
		m.addAttribute("welcome_message", id);
		return page_adminhomepage;
	}

	@RequestMapping(path = "/AdminHomePage")
	public String processAdminHomePage2(Model m) {
		processShowTableInHomePage(m);
		return page_adminhomepage;
	}

//	跳轉到 admin 新增 會員
	@RequestMapping(path = "/ToAdminCreateMemberPage", method = RequestMethod.POST)
	public String processToAdminCreateMemberPage() {
		return path_admin_login + "AdminCreateMember";
	}

//	跳轉到 admin 更新會員資料

	@PostMapping(path = "/ToAdminModifyMember")
	public String processToAdminModifyMember(@RequestParam("memberid") int id, Model m) {
		MemberBasicInfo modifymemberbean = lservice.findByMemberid(id);
		m.addAttribute("modifymemberbean", modifymemberbean);
//		3為修改
		m.addAttribute("crud", 3);
		return path_admin_login + "AdminModifyMemberPage";
	}

//	跳轉到 admin 新增admin page
	@PostMapping("/ToAdminCreateAdmin")
	public String processToAdminCreateAdmin() {
		return path_admin_login + "AdminCreateAdmin";
	}

//	跳轉到 admin 修改admin page
	@PostMapping("/ToAdminModifyAdmin")
	public String processToAdminModifyAdmin(@RequestParam("adminid") int id, Model m) {
		AdminChitou modifyadminbean = lservice.findByAdminId(id);
		m.addAttribute("modifyadminbean", modifyadminbean);
		return path_admin_login + "AdminModifyAdminPage";
	}

//	管理員登出

	@RequestMapping(path = "/logout")
	public String processToLogOut(SessionStatus status) {
		status.setComplete();
		return page_adminlogin;
	}

//	------------------------------------------------------------------------------------------------------------------------------------------------------------
////	秀出memberlist
//	@GetMapping(path = "/memberlist")
//	public String Memberlist(Model m) {
//		List<MemberBasicInfo> memberlist = lservice.memberFindAll();
//		m.addAttribute("memberlist", memberlist);
//		return page_adminhomepage;
//	}
//
////	秀出adminlist
//	@GetMapping(path = "/adminlist")
//	public String Adminlist(Model m) {
//		List<AdminChitou> adminlist = lservice.adminFindAll();
//		m.addAttribute("adminlist", adminlist);
//		return page_adminhomepage;
//	}

//	顯示所有table
	@GetMapping(path = "/ShowTableInHomePage")
	public String processShowTableInHomePage(Model m) {
		List<AdminChitou> adminlist = lservice.adminFindAll();
		List<MemberBasicInfo> memberlist = lservice.memberFindAll();
		m.addAttribute("memberlist", memberlist);
		m.addAttribute("adminlist", adminlist);
		return page_adminhomepage;
	}

//	------------------------------------------------------------------------------------------------------------------------------------------------------------

//	管理員新增會員
	@PostMapping(path = "/admininsertmember")
	public String processAdminInsertMember(@RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("myFile") MultipartFile mf,
			@RequestParam("email") String email, Model m) {
//		將照片存入文件夾内

		String photo = lservice.savePicToLocal(mf);
		String pic_locaiton = piclocation + photo;

//		會員預設權力為 1
		MemberBasicInfo bean = new MemberBasicInfo(4, username, password, pic_locaiton, email);
		bean.setPassword(encrpytMemberPassword(bean));
		System.out.println(bean.getPassword());
		MemberBasicInfo adminInsertMember = lservice.adminInsertMember(bean);

//		生成一個memberdetail的bean
		lservice.adminInsertMemberDetailInfo(adminInsertMember);

//		1為create
		m.addAttribute("crud", 1);
		return "redirect:" + method_ShowTableInHomePage;
	}

//	管理員刪除會員
	@DeleteMapping(path = "/AdminDeleteMember")
	public String processAdminDeleteMember(@RequestParam("td_memberid") int memberid, Model m) {
		System.out.println("檢查刪除的ID：" + memberid);
		lservice.adminDeleteMember(memberid);
//	    4為刪除
		m.addAttribute("crud", 4);
		return "redirect:" + method_ShowTableInHomePage;
	}

//  管理員更新會員
	@PutMapping(path = "/AdminModifyMember")
	public String processAdminModifyMember(@RequestParam("memberid") int memberid,
			@RequestParam("statusid") int statusid, @RequestParam("username") String username,
			@RequestParam("myFile") MultipartFile mf, @RequestParam("email") String email, Model m) {

		MemberBasicInfo bean = lservice.findByMemberid(memberid);
		String password = bean.getPassword();
		String filename = mf.getOriginalFilename();
		String photo_path = lservice.savePicToLocal(mf);
		String pic_locaiton = piclocation + photo_path;
		
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String modifytime = simpleDateFormat.format(date);

//			System.out.println(bean.getPhoto());
//			System.out.println(pic_locaiton);
//			System.out.println("文檔名稱:" + filename);

		if (filename != "") {
//				System.out.println("更改過圖片");

			MemberBasicInfo memberBasicInfo = new MemberBasicInfo(memberid, statusid, username, password, pic_locaiton,
					email);
			MemberDetailInfo findDetailByMemberid = lservice.findDetailByMemberid(memberid);
			findDetailByMemberid.setModifytime(modifytime);
			lservice.adminInsertMemberDetailInfo(findDetailByMemberid);
			lservice.adminInsertMember(memberBasicInfo);
		} else {
//				System.out.println("沒有更改圖片");
			MemberBasicInfo memberBasicInfo = new MemberBasicInfo(memberid, statusid, username, password,
					bean.getPhoto(), email);
			MemberDetailInfo findDetailByMemberid = lservice.findDetailByMemberid(memberid);
			findDetailByMemberid.setModifytime(modifytime);
			lservice.adminInsertMemberDetailInfo(findDetailByMemberid);
			lservice.adminInsertMember(memberBasicInfo);
		}
		m.addAttribute("crud", 3);

		return "redirect:" + method_ShowTableInHomePage;
	}

//	管理員查詢會員資料
	@GetMapping(path = "/AdminQueryMember")
	public String processAdminQueryMember(@RequestParam("searchinfo") String column,
			@RequestParam("searchtext") String value, Model m) {
		String hql = lservice.mergeHql(column, value);
		List<MemberBasicInfo> result = lservice.adminQeuryMember(hql);
		m.addAttribute("result", result);
		return path_admin_login + "SearchPage";
	}

//	給管理員密碼加密
//	有重複的辦法
	public String encrpytMemberPassword(MemberBasicInfo member) {
//	    加密的方法 —> 將字串加密 在放入Javabean内
		String beEncode = new BCryptPasswordEncoder().encode(member.getPassword());
		return beEncode;
	}

//	------------------------------------------------------------------------------------------------------------------------------------------------------------

//	admin

//	檢查賬號密碼是否正確
	@PostMapping(path = "/adminchecklogin")
	public String processAdminCheckLogin(@RequestParam("username") String user, @RequestParam("password") String pwd,
			Model m) {
		Map<String, String> errors = new HashMap<String, String>();

		int adminCheckStatus;

		m.addAttribute("errors", errors);
		m.addAttribute("crud", 0);

		if (user == null || user.length() == 0) {
			errors.put("name", "name is required");
		}

		if (pwd == null || pwd.length() == 0) {
			errors.put("pwd", "password is required");
		}

		if (errors != null && !errors.isEmpty()) {
			return page_adminlogin;
		}

		boolean result = lservice.checkAdminLogin(user, pwd);
		System.out.println("檢查賬號密碼的結果是 ：" + result);

		try {
			AdminChitou statusBean = lservice.findByAdminUersname(user);

			adminCheckStatus = statusBean.getAdminstatus();

		} catch (Exception e) {

			adminCheckStatus = 10000;
		}

		if (result) {
			m.addAttribute("user", user);
			m.addAttribute("pwd", pwd);
//			將管理員分級
			if (adminCheckStatus == 1) {
				System.out.println("我的權限是: regular admin");
				m.addAttribute("session_status", 1);
				m.addAttribute("status", 1);

			} else if (adminCheckStatus == 2) {
				System.out.println("我的權限是: manager");
				m.addAttribute("session_status", 2);
				m.addAttribute("status", 2);
			} else if (adminCheckStatus == 3) {
				System.out.println("我的權限是: boss");
				m.addAttribute("session_status", 3);
				m.addAttribute("status", 3);
			}

			processShowTableInHomePage(m);

			return page_adminhomepage;
		}

		errors.put("msg", "please input correct username or passward");
		return page_adminlogin;
	}

//	管理員 新增管理員
	@PostMapping(path = "/AdminInsertAdmin")
	public String processAdminInsertAdmin(@RequestParam("adminstatus") String adminstatus,
			@RequestParam("username") String username, @RequestParam("password") String password, Model m) {

		int adminstatus_int = Integer.parseInt(adminstatus);
		AdminChitou adminChitou = new AdminChitou(adminstatus_int, username, password, true);
		String encrpytAdminPassword = encrpytAdminPassword(adminChitou);
		adminChitou = new AdminChitou(adminstatus_int, username, encrpytAdminPassword, true);
		lservice.adminInsertAdmin(adminChitou);
		m.addAttribute("crud", 1);
		return "redirect:" + method_ShowTableInHomePage;
	}

//	管理員刪除管理員
	@DeleteMapping(path = "/AdminDeleteAdmin")
	public String processAdminDeleteAdmin(@RequestParam("td_memberid") String adminid, Model m) {
		int adminid_int = Integer.parseInt(adminid);
		lservice.adminDeleteAdmin(adminid_int);
		m.addAttribute("crud", 4);
		return "redirect:" + method_ShowTableInHomePage;
	}

//	管理員更新管理員基本咨詢
	@PutMapping(path = "/AdminModifyAdmin")
	public String processAdminModifyAdmin(@RequestParam("adminid") String adminid,
			@RequestParam("adminstatus") String adminstatus, @RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("permission") String permission, Model m) {
		int adminid_int = Integer.parseInt(adminid);
		int adminstatus_int = Integer.parseInt(adminstatus);
		boolean permission_boolean = Boolean.parseBoolean(permission);

		AdminChitou adminChitou = new AdminChitou(adminid_int, adminstatus_int, username, password, permission_boolean);
		lservice.adminInsertAdmin(adminChitou);
		m.addAttribute("crud", 3);
		return "redirect:" + method_ShowTableInHomePage;
	}

//	給管理員密碼加密
//	有重複的辦法
	public String encrpytAdminPassword(AdminChitou admin) {
//	    加密的方法 —> 將字串加密 在放入Javabean内
		String beEncode = new BCryptPasswordEncoder().encode(admin.getPassword());
		return beEncode;
	}

//	------------------------------------------------------------------------------------------------------------------------------------------------------------
// export csv

	@GetMapping("/exportCSV")
	public void processExportCSV(HttpServletResponse response) throws IOException {
		response.setContentType("text/csv");
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
		String currentDateTime = dateFormatter.format(new Date());

		String headerKey = "Content-Disposition";
		String headerValue = "attachment; filename=CustomerInfo" + currentDateTime + ".csv";
		response.setHeader(headerKey, headerValue);

//		List<User> listUsers = service.listAll();
		List<MemberBasicInfo> memberlist = lservice.memberFindAll();
		List<MemberDetailInfo> memberdetaillist = lservice.memberDetailFindAll();
		
		ICsvBeanWriter csvWriter = new CsvBeanWriter(response.getWriter(), CsvPreference.STANDARD_PREFERENCE);
		String[] csvHeader = { "Username", "Email","Name", "Phone", "address", "nickname", "nationality", "birth","gender" };
		String[] nameMapping = { "username", "email","name" , "phone","address","nickname","nationality","birth","gender" };
		csvWriter.writeHeader(csvHeader);

		MembeAllInfo all = new MembeAllInfo();

		for(int i = 0 ; i < memberlist.size();i++) {
			all.setAll(memberlist.get(i), memberdetaillist.get(i));
			csvWriter.write(all,nameMapping);
		}
		
//		for (MemberBasicInfo memberbean : memberlist) {
//			
//			
//			csvWriter.write(memberbean, nameMapping);
//		}

		csvWriter.close();

	}
	
//	export PDF
	
    @GetMapping("/exportPDF")
    public void exportToPDF(HttpServletResponse response) throws DocumentException, IOException {
        response.setContentType("application/pdf");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());
         
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=users_" + currentDateTime + ".pdf";
        response.setHeader(headerKey, headerValue);
         
//        List<User> listUsers = service.listAll();
        List<MemberBasicInfo> memberbasicinfo = lservice.memberFindAll(); 
        
        
        PdfExporter exporter = new PdfExporter(memberbasicinfo);
        exporter.export(response);
         
    }
	
	

}
