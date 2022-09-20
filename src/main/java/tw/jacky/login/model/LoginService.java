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
import org.hibernate.query.Query;
import org.springframework.beans.Mergeable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.AbstractAuditable_;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;





@Service
@Transactional
public class LoginService {
	
	
	@Autowired
	private MemberBasicInfoRepository mbrepo;
	@Autowired
	private  AdminChitouRepository acrepo;
	@Autowired
	private MemberBasicInfoDAO mDao;
	
	private String staticPath = getStaticPath();
	
//	------------------------------------------------------------------------------------------------------------------------------------------------------------
//	寫絕對路徑的辦法
	private String getStaticPath() {
		String path = this.getClass().getClassLoader().getResource("").getPath();
		path = path.substring(1).replace("target", "src").replaceAll("classes", "main") + "resources" + File.separator + "static"
				+ File.separator;
		path = path.replaceAll("/", Matcher.quoteReplacement(File.separator));
		return path;
	}
	

//	------------------------------------------------------------------------------------------------------------------------------------------------------------
// memberbasicinfo
	public List<MemberBasicInfo>  memberFindAll() {
		return mbrepo.findAll();
	}
	
//	查詢單個會員(ID)
	
	public MemberBasicInfo findByMemberid(int id) {
		return mbrepo.findByMemberid(id);
	}
	
//	管理員新增會員
	public MemberBasicInfo adminInsertMember(MemberBasicInfo mb) {
		return mbrepo.save(mb);
	}
	
//	管理員刪除會員
	public void adminDeleteMember(int id) {
		MemberBasicInfo bean = findByMemberid(id);
		mbrepo.delete(bean);
	}
	
//	管理員更新會員
	public MemberBasicInfo adminModifyMember(MemberBasicInfo mb) {
		return mbrepo.save(mb);
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
		//		你存儲的路徑
		String saveFileDir= "C:\\Chitou\\workspace\\Chitou\\src\\main\\webapp\\WEB-INF\\resources\\images\\jacky\\login";
		//		轉換成虛擬路徑(建立資料夾)
		File saveFileDirPath = new File(saveFileDir);
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
		return acrepo.save(ac);
	}
	
	public void adminDeleteAdmin(int id) {
		AdminChitou adminchitou = findByAdminId(id);
		acrepo.delete(adminchitou);
	}
	
	public AdminChitou findByAdminId(int id) {
		return acrepo.findByAdminid(id);
	}
	

	
	
////	賬號密碼確認
//	public boolean checkAdminLogin(AdminChitou bean) {
//		Session session = sessionFactory.openSession();
////		javabean的東西 而不是資料庫的東西
//		String hqlstr="from AdminChitou where username = :user and password = :pwd";
//		
//		try {			
//			Query<AdminChitou> query = session.createQuery(hqlstr,AdminChitou.class);
//			query.setParameter("user", bean.getUsername());
//			
//			query.setParameter("pwd", bean.getPassword());
//			
//			
////		把hibernate的query物件在轉型成 bean的物件->去利用
//			AdminChitou resultBean = query.uniqueResult();
//			session.close();
//			
//			if(resultBean!=null) {
//				return true;
//			}
//			return false;
//		} catch (Exception e) {
//			return false;
//		}
//	}
	
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

	
	

}
