package tw.jacky.login.model;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class MemberBasicInfoDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
//	C
	public MemberBasicInfo insert(MemberBasicInfo bean) {
		Session session = sessionFactory.openSession();
		if(bean!=null) {
			session.save(bean);
		}
		session.close();
		return bean;
	}
	
//	U
//	public MemberBean update(MemberBean bean) {
//		Session session = sessionFactory.openSession();
//		
//		if(bean!=null) {
//			session.update(bean);
//			session.flush();
//		}
//		session.close();
//		return bean;		
//	}
	
	public int update(MemberBasicInfo mb) {
		
		Session session = sessionFactory.openSession();
		String hql="update MemberBasicInfo set password = :a , photo = :b , email= :c where memberid = :d ";
		
		
		int success = session.createQuery(hql).setParameter("a", mb.getPassword()).setParameter("b", mb.getPhoto()).
				setParameter("c", mb.getEmail()).setParameter("d", mb.getMemberid()).executeUpdate();
		System.out.println(success);
		return success;
	}
	
	
//	R
	public List<MemberBasicInfo> searchInDB(String hql) {
		Session session = sessionFactory.openSession();
		Query<MemberBasicInfo> query = session.createQuery(hql , MemberBasicInfo.class);
		return query.getResultList();
	}
	
	public List<MemberBasicInfo> searchAll() {
		Session session = sessionFactory.openSession();
		String hqlstr="from MemberBasicInfo ";
		Query<MemberBasicInfo> query = session.createQuery(hqlstr,MemberBasicInfo.class);
		return query.getResultList();
	}
	
	
//	D
	public boolean delete(int memberid) {
		Session session = sessionFactory.openSession();
		MemberBasicInfo memberBean = session.get(MemberBasicInfo.class, memberid);
		if(memberBean!=null) {
			session.delete(memberBean);
			session.flush();
			session.close();
			return true;
		}
		session.close();
		return false;
	}

	
//	賬號密碼確認
	public boolean checkLogin(MemberBasicInfo bean) {
		Session session = sessionFactory.openSession();
//		javabean的東西 而不是資料庫的東西
		String hqlstr="from MemberBasicInfo where username = :user and password = :pwd";
		
		Query<MemberBasicInfo> query = session.createQuery(hqlstr,MemberBasicInfo.class);
		
		query.setParameter("user", bean.getUsername());
		
		query.setParameter("pwd", bean.getPassword());
		
		
//		把hibernate的query物件在轉型成 bean的物件->去利用
		MemberBasicInfo resultBean = query.uniqueResult();
		session.close();
		
		if(resultBean!=null) {
			return true;
		}
		return false;
	}
	
	
}
