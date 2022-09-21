package tw.luana.attraction.model;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tw.luana.cart.model.Cart;
import tw.luana.order.model.Orders;



@Repository
@Transactional
public class AttractionDao_Luana {
	
	@Autowired
	private SessionFactory factory;
	
	
	
	
	public List<Attraction_Luana> showAllAttractions() {
		Session session = factory.getCurrentSession();
		
		try {
			System.out.println("showAllAttractions");
			Query<Attraction_Luana> query = session.createQuery("from Attraction_Luana",Attraction_Luana.class);
			List<Attraction_Luana> resultList = query.getResultList();
			System.out.println(resultList);
			return resultList;
			
		} catch (Exception e) {
			
		}
		return null;
	}
	
	public List<Attraction_Luana> searchAttraction(String name) {
		Session session = factory.getCurrentSession();
		
		String hql = "from Attraction_Luana where name like :name";
		try {
			Query<Attraction_Luana> query = session.createQuery(hql,Attraction_Luana.class)
					.setParameter("name","%"+name+"%");
			List<Attraction_Luana> resultList = query.getResultList();
//			System.out.println(resultList);

			return resultList;
		} catch (Exception e) {
			
		}
		return null;
	}
	
	
	public Attraction_Luana showAttractionDetail(Integer attractionId) {
		Session session = factory.getCurrentSession();
		
		String hql = "from Attraction_Luana where attractionId = :attractionId";
		try {
			Attraction_Luana result = session.createQuery(hql,Attraction_Luana.class)
					.setParameter("attractionId",attractionId).getSingleResult();			
			return result;
		} catch (Exception e) {
			
		}
		return null;
	}
		 
	
	public List<AttractionPlan_Luana> showAttractionPlans(Integer attractionId) {
		Session session = factory.getCurrentSession();
		
		String hql = "from AttractionPlan where attractionId = :attractionId";
		try {
			Query<AttractionPlan_Luana> query = session.createQuery(hql,AttractionPlan_Luana.class)
					.setParameter("attractionId",attractionId);
			List<AttractionPlan_Luana> resultList = query.getResultList();
			System.out.println(resultList);

			return resultList;
			
		} catch (Exception e) {
			
		}
		return null;
	}
	
	public Attraction_Luana getAttractionName(Integer attractionId) {
		Session session = factory.getCurrentSession();
		
		String hql = "from Attraction_Luana where attractionId = :attractionId";
		try {
			Attraction_Luana result = session.createQuery(hql,Attraction_Luana.class)
					.setParameter("attractionId",attractionId).getSingleResult();			
			return result;
		} catch (Exception e) {
			
		}
		return null;
	}

	public void addToCart(Integer attractionId, Integer planId, String planName, Integer planFee, Integer quantity) {
		Session session = factory.getCurrentSession();
		
		Cart cart = new Cart();
			
			cart.setAttractionId(attractionId);
			cart.setName(getAttractionName(attractionId).getName());
			cart.setPlanId(planId);
			cart.setPlanName(planName);
			cart.setPlanFee(planFee);
			cart.setQuantity(quantity);
			
			
			
			session.save(cart);
			

	}
	
	public List<Cart> showCartItems() {
		Session session = factory.getCurrentSession();
		
		try {
			Query<Cart> query = session.createQuery("from Cart",Cart.class);
			List<Cart> resultList = query.getResultList();
			System.out.println(resultList);
			return resultList;
			
		} catch (Exception e) {
			
		}
		return null;
	}
	
	
	public void removeCartItem(Integer itemId) {

		Session session = factory.getCurrentSession();
			String hql = "delete Cart where itemId = :itemId";
			session.createQuery(hql)
			.setParameter("itemId", itemId)
			.executeUpdate();			
			System.out.println("delete cart item");
			
	}
	
	
	public void buyIt(Integer attractionId, Integer planId, String attractionName, String planName, Integer planFee, Integer quantity) {
		Session session = factory.getCurrentSession();
		
			Orders orders = new Orders();
			
			orders.setAttractionId(attractionId);
			orders.setPlanId(planId);
			orders.setAttractionName(attractionName);
			orders.setPlanName(planName);
			orders.setPlanFee(planFee);
			orders.setQuantity(quantity);
			int i = 1;
			
			
			long millis = System.currentTimeMillis();	
//			long timeMilli = Calendar.getInstance().getTimeInMillis();
			
			System.out.println(millis);
			
			orders.setOrderstatus(i);
			orders.setOrderdate(millis);
			
			session.save(orders);
			

	}
	
	public List<Orders> showOrders() {
		Session session = factory.getCurrentSession();
		
		try {
			Query<Orders> query = session.createQuery("from Orders",Orders.class);
			List<Orders> orderList = query.getResultList();
			System.out.println(orderList);
			return orderList;
		} catch (Exception e) {
			
		}
		return null;
	}
	
	public void updateStatusByOrderId(Integer orderstatus,Integer orderId) {

		Session session = factory.getCurrentSession();
			String hql = "update Orders set orderstatus = :orderstatus where orderId = :orderId";
			session.createQuery(hql)
			.setParameter("orderstatus", orderstatus)
			.setParameter("orderId", orderId)
			.executeUpdate();			
			System.out.println("updateStatusByOrderId success");
			System.out.println(orderstatus);
			System.out.println(orderId);
			
	}
	
	public void deleteOrder(Integer orderId) {

		Session session = factory.getCurrentSession();
			System.out.println("deleteOrder success");
			String hql = "delete Orders  where orderId = :orderId";
			session.createQuery(hql)
			.setParameter("orderId", orderId)
			.executeUpdate();			
			
	}
	
	
}
