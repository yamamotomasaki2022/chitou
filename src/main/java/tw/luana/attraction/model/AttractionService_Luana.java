package tw.luana.attraction.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.luana.cart.model.Cart;
import tw.luana.order.model.Orders;


@Service
@Transactional
public class AttractionService_Luana {

	@Autowired
	private AttractionDao_Luana attractionDao;
	
	public AttractionService_Luana() {
		this.attractionDao = new AttractionDao_Luana();	
	}

	
	public List<Attraction_Luana> showAllAttractions() {
		return attractionDao.showAllAttractions();
	}
	
	
	public List<Attraction_Luana> searchAttraction(String name) {
		return attractionDao.searchAttraction(name);
	}
	
	
	public Attraction_Luana showAttractionDetail(Integer attractionId) {
		return attractionDao.showAttractionDetail(attractionId);
	}
	
	
	public List<AttractionPlan_Luana> showAttractionPlans(Integer attractionId) {
		return attractionDao.showAttractionPlans(attractionId);
	}
	
	public Attraction_Luana getAttractionName(Integer attractionId) {
		return attractionDao.getAttractionName(attractionId);
	}
	
	public void addToCart(Integer attractionId, Integer planId, String planName, Integer planFee, Integer quantity) {		
		int total = planFee * quantity;
		attractionDao.addToCart(attractionId, planId, planName, total, quantity);
	}
	
	public void buyIt(Integer attractionId, Integer planId,String attractionName, String planName, Integer planFee, Integer quantity) {
		attractionDao.buyIt(attractionId, planId, attractionName, planName, planFee, quantity);
	}

	public List<Cart> showCartItems() {
		return attractionDao.showCartItems();
	}
	public List<Orders> showOrders() {
		return attractionDao.showOrders();
	}
	public void removeCartItem(Integer itemId) {
		attractionDao.removeCartItem(itemId);
	}
	
	public void updateStatusByOrderId(Integer orderstatus ,Integer orderId ) {
		attractionDao.updateStatusByOrderId(orderstatus, orderId);
	}
	public void deleteOrder(Integer orderId) {
		attractionDao.deleteOrder(orderId);
	}
	
	
}
