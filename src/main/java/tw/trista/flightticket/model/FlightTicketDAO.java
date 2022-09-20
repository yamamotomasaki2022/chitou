package tw.trista.flightticket.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class FlightTicketDAO  {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	//新增
	public FlightTicket insert(FlightTicket flightBean) {
		Session session = sessionFactory.getCurrentSession();
		try {
			FlightTicket flightTicketBean = session.get(FlightTicket.class, flightBean.getFlightID());
			if(flightTicketBean == null) {
				session.save(flightBean);
				System.out.println("新增成功!!");
				return flightBean;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	//查詢
	public FlightTicket queryFlightId(String originID,String destinationID,String departureTime,String arrivalTime,int classID) {
		Session session = sessionFactory.getCurrentSession();
		
		String hql = "from FlightTicket f where f.originID = :originID and f.destinationID = :destinationID and f.departureTime = :departureTime and f.arrivalTime =:arrivalTime and f.classID =:classID";
		
		try {
			FlightTicket result = session.createQuery(hql,FlightTicket.class)
						.setParameter("originID", originID)
						.setParameter("destinationID", destinationID)
						.setParameter("departureTime", departureTime)
						.setParameter("arrivalTime", arrivalTime)
						.setParameter("classID", classID)
						.getSingleResult();
			return result;
		} catch (Exception e) {
			return null;
		}

	}

	public List<FlightTicket> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		Query<FlightTicket> query = session.createQuery("from FlightTicket",FlightTicket.class);

		return query.list();
	}
	
	//修改
	public FlightTicket updateOne(String flightID, int newfare) {
		Session session = sessionFactory.getCurrentSession();
		FlightTicket flight = session.get(FlightTicket.class, flightID);
		
		if(flight != null) {
			flight.setFare(newfare);

			return flight;
		}

		return null;
	}

	//刪除
	 public boolean deleteOne(String flightID) {
		  Session session = sessionFactory.getCurrentSession();
		  String hql = "delete from FlightTicket where flightID = :flightID";
		  Query query = session.createQuery(hql).setParameter("flightID", flightID);
		  query.executeUpdate();
		  return true;
		 }
}
