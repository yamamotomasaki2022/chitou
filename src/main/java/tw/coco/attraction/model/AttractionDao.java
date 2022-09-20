package tw.coco.attraction.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
//import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;





@Repository
@Transactional
public class AttractionDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	
	//insert
	public boolean insert(Attraction attraction,Integer preferID) {
		
		Session session = sessionFactory.getCurrentSession();
		
		//查資料
		Hobbyclassification hobbyclassification = session.get(Hobbyclassification.class, preferID);
		//查完資料放在bean
		attraction.setHobbyclassification(hobbyclassification);
		//判斷bean物件!null就save
				if(attraction!=null) {
					session.save(attraction);
				}
				return true;
			}
	
	//update
	public boolean update(Attraction attraction,Integer preferid) {
		// 透過session 開連線
		Session session = sessionFactory.getCurrentSession();
		Hobbyclassification hobbyclassification = session.get(Hobbyclassification.class, preferid);
		String hql="update Attraction set attName='"+attraction.getAttName()+"',attLocation='"+attraction.getAttLocation()+"',attDescription='"+attraction.getAttDescription()+"',attNotice='"+attraction.getAttNotice()+"' where attid='"+attraction.getAttid()+"'";    
		
		System.out.println(hql);
		
		Query<Attraction> query = session.createQuery(hql);
		query.executeUpdate();
		return true;
	}


	//Delete 
	public boolean delete(Integer attid) {
		Session session = sessionFactory.openSession();
		String hql = "delete from Attraction where attid = :attid";
		Query query = session.createQuery(hql).setParameter("attid", attid);
		query.executeUpdate();
		return true;
	}
			
	//Get Attraction By attName
	    public List<Attraction> selectByAttName(String attName) {
			Session session = sessionFactory.getCurrentSession();
			String hql="from Attraction where attName like '%"+attName+"%'";
			Query<Attraction> query =session.createQuery(hql,Attraction.class);     
	        return query.list();
	    }
		
		//Get Attraction By attid
	    public Attraction selectByAttid(Integer attid){ 
			Session session = sessionFactory.getCurrentSession();
		    String hql="select * from Attraction where attid=?";    
			Attraction attraction2 =session.get(Attraction.class,attid);
		    return attraction2;
	    }
	    
		//Get all Attractions
		@SuppressWarnings("unchecked")
	    public List<Attraction> selectByAttractionAll() {
	        List < Attraction > listOfAttraction = null;
			Session session = sessionFactory.openSession();

			listOfAttraction = session.createQuery("from Attraction").getResultList();
	        return listOfAttraction;
	}
		
		
	
}
