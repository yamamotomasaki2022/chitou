package tw.jacky.login.model;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.model.source.internal.hbm.ManyToOneAttributeColumnsAndFormulasSource;
import org.hibernate.query.Query;
import org.springframework.beans.Mergeable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.AbstractAuditable_;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;





@Service
@Transactional
public class LoginService {
	
	
	@Autowired
	private MemberBasicInfoRepository mbrepo;
	@Autowired
	private MemberDetailInfoRepository mdirepo;
	@Autowired
	private  AdminChitouRepository acrepo;
	@Autowired
	private MemberBasicInfoDAO mDao;
	
	
	
	
	private String staticPath = getStaticPath();
	
//	------------------------------------------------------------------------------------------------------------------------------------------------------------
//	寫絕對路徑的辦法
	private String getStaticPath() {
		String path = this.getClass().getClassLoader().getResource("").getPath();
		path = path.substring(1).replace("target", "src").replaceAll("classes", "main") + "webapp" + File.separator + "WEB-INF"
				+ File.separator + "resources" + File.separator + "images" + File.separator + "jacky" + File.separator + "login";
		path = path.replaceAll("/", Matcher.quoteReplacement(File.separator));
		return path;
	}
	

//	------------------------------------------------------------------------------------------------------------------------------------------------------------
// memberbasicinfo
	public List<MemberBasicInfo>  memberFindAll() {
		return mbrepo.findAll();
	}
//	memberdetailinfo
	public List<MemberDetailInfo> memberDetailFindAll(){
		return mdirepo.findAll();
	}
	
	
	
//	查詢單個會員的基本資料(ID)
	
	public MemberBasicInfo findByMemberid(int id) {
		return mbrepo.findByMemberid(id);
	}
	
	public MemberBasicInfo findBasicInfobyUsername(String username) {
		return mbrepo.findByUsername(username);
	}
	
	public MemberBasicInfo findByEmail(String email) {
		return mbrepo.findByEmail(email);
	}	
	
//	尋找會員詳細資料
	public MemberDetailInfo findDetailByMemberid(int id) {
		return mdirepo.findByMemberid(id);
	}
	
	
//	管理員新增會員基本資料
	public MemberBasicInfo adminInsertMember(MemberBasicInfo mb) {
		LoginStatus loginStatus = new LoginStatus();
		loginStatus.setStatusid(mb.getStatusid());
		mb.setLoginStatus(loginStatus);
		return mbrepo.save(mb);
	}
//	管理員更新會員
	public MemberBasicInfo adminModifyMember(MemberBasicInfo mb) {
//		LoginStatus loginStatus = new LoginStatus();
//		loginStatus.setStatusid(mb.getStatusid()); 
//		mb.setLoginStatus(loginStatus);
		return mbrepo.save(mb);
	}
	
	public MemberBasicInfo adminUpdateMember(MemberBasicInfo mb) {
		System.out.println("statusid:" + mb.getLoginStatus().getStatusid());
		return mbrepo.save(mb);
	}
	
	
//	管理員新增會員詳細資料(銜接會員基本資料)
	public MemberDetailInfo adminInsertMemberDetailInfo(MemberBasicInfo mb) {
		MemberDetailInfo memberDetailInfo = new MemberDetailInfo(mb.getMemberid());
		return mdirepo.save(memberDetailInfo);
	}
	
	public MemberDetailInfo adminInsertMemberDetailInfo(MemberDetailInfo md) {
		return mdirepo.save(md);
	}
	
	
	
//	管理員刪除會員
	public void adminDeleteMember(int id) {
		
		MemberDetailInfo findDetailByMemberid = findDetailByMemberid(id);
		if ( findDetailByMemberid != null) {
			mdirepo.delete(findDetailByMemberid);
			
		}else {
			
			MemberBasicInfo findBasicInfoByMemberid = findByMemberid(id);
			mbrepo.delete(findBasicInfoByMemberid);
		}


	}
	
	
//	管理員查詢會員資料 (原本Hql的辦法 比較快 因爲Interface沒辦法滿足我的需求)
	public List<MemberBasicInfo> adminQeuryMember(String hql){
		return mDao.searchInDB(hql);
	}
	
	public String mergeHql(String dbcolumn, String value) {
		String hql="from MemberBasicInfo where " + dbcolumn + " like '%" + value + "%' or " 
		+ dbcolumn + " like '" + value + "%' or "  
		+ dbcolumn + " like '%" + value + "'";
		return hql;
	}
	
	
//	將照片存入專案資料夾中
	
	public String savePicToLocal(MultipartFile mf) {
		System.out.println("進入圖片的方法");
		
		String fileName = mf.getOriginalFilename();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		String format = simpleDateFormat.format(new Date());
		fileName = format + fileName;
		
		System.out.println("確定路徑是否正確：" + staticPath);
		//		你存儲的路徑
//		String saveFileDir= "C:\\Chitou\\workspace\\Chitou\\src\\main\\webapp\\WEB-INF\\resources\\images\\jacky\\login";
		//		轉換成虛擬路徑(建立資料夾)
		File saveFileDirPath = new File(staticPath);
		//		檢查是否虛擬路徑成功create（確立此資料夾是否成功)
		saveFileDirPath.mkdirs();
		// 	存儲文件到此處
		File saveFile = new File(saveFileDirPath, fileName);
		try {
			mf.transferTo(saveFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.println("資料確定儲存了");
		
		return fileName;
	}
	
	
	
//	------------------------------------------------------------------------------------------------------------------------------------------------------------
//	admin
	public List<AdminChitou> adminFindAll(){
		return acrepo.findAll();
	}
	
	public AdminChitou adminInsertAdmin(AdminChitou ac) {
		LoginStatus loginStatus = new LoginStatus();
		loginStatus.setStatusid(ac.getAdminstatus());
		ac.setLoginStatus(loginStatus);
		return acrepo.save(ac);
	}
	
	
	public void adminDeleteAdmin(int id) {
		AdminChitou adminchitou = findByAdminId(id);
		acrepo.delete(adminchitou);
	}
	
	public AdminChitou findByAdminId(int id) {
		return acrepo.findByAdminid(id);
	}
	
	public AdminChitou findByAdminUersname(String username) {
		return acrepo.findByUsername(username);
	}
	


	
	public boolean checkAdminLogin(String username, String pw) {
		
		String check_username = takeUsername(username);
		String check_pw = takePassword(username);
		
		if(check_username != null) {
			if (!pw.equals(check_pw)) {
				return false;				
			}else {
				return true;				
			}
		}else {
			return false;
		}	
	}
	
	public String takeUsername(String username) {
		AdminChitou adminbean = acrepo.findByUsername(username);
		
		if(adminbean != null) {
			return adminbean.getUsername();
		}
		return null;
	}
	
	public String takePassword(String username) {
		AdminChitou adminbean = acrepo.findByUsername(username);
		
		if (adminbean !=null) {			
			return adminbean.getPassword();
		}
		return null;
	}

	

	
	
	
//	------------------------------------------------------------------------------------------------------------------------------------------------------------
// 會員
	
	public boolean checkMemberLogin(String username, String pw) {
		
		String check_username = takeMemberUsername(username);
		String check_pw = takeMemberPassword(username);
		
		if(check_username != null) {
			if (!pw.equals(check_pw)) {
				return false;				
			}else {
				return true;				
			}
		}else {
			return false;
		}	
	}
	
	
	public String takeMemberUsername(String username) {
		MemberBasicInfo memberbasicbean = mbrepo.findByUsername(username);
		
		if(memberbasicbean != null) {
			return memberbasicbean.getUsername();
		}
		return null;
	}
	
	public String takeMemberPassword(String username) {
		MemberBasicInfo memberbasicbean = mbrepo.findByUsername(username);
		
		if (memberbasicbean !=null) {			
			return memberbasicbean.getPassword();
		}
		return null;
	}
	
	

}
