package tw.weber.hotel.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class HotelBackDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<Hotel> selectAll(){
		Session session = sessionFactory.getCurrentSession();
		
		Query<Hotel> result = session.createQuery("from Hotel",Hotel.class);
		
		return result.list();
	}
	
	public Hotel select(int hotelID) {
		Session session = sessionFactory.getCurrentSession();
		
		Hotel result = session.get(Hotel.class, hotelID);
		
		if(result!=null) {
			return result;
		}
		return null;
	}
	
	public List<Hotel> selectByKey(String type,String keyword){
		Session session = sessionFactory.getCurrentSession();
		
		String hql = "from Hotel where " + type + " like '%" + keyword + "%'";
		
		Query<Hotel> query = session.createQuery(hql,Hotel.class);
		
		return query.list();
	}
	
	public Hotel insert(Hotel hotel) {
		Session session = sessionFactory.getCurrentSession();
		
		session.save(hotel);
		
		return hotel;
	}
	
	public Hotel delete(int hotelID) {
		Session session = sessionFactory.getCurrentSession();
		
		Hotel result = session.get(Hotel.class, hotelID);
		
		session.delete(result);
		
		return result;
	}
	
	public Hotel update(Hotel hotel) {
		Session session = sessionFactory.getCurrentSession();
		
		session.update(hotel);
		
		return hotel;
		
	}
}
