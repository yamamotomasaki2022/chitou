package tw.luana.attraction.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.luana.cart.model.Cart;
import tw.luana.cart.model.CartRepository;
import tw.luana.order.model.OrderRepository;
import tw.luana.order.model.Orders;


@Service
@Transactional
public class AttractionService_Luana {

	@Autowired
	private  AttractionRepository_Luana attractionRepository;
	
	@Autowired
	public AttractionPlanRepository_Luana attractionPlanRepository;

	public List<Attraction_Luana> showAllAttractions() {
		return attractionRepository.findAll();
	}
	
	
	public List<Attraction_Luana> searchAttraction(String name) {
		return attractionRepository.searchAttraction(name);
	}
	
	public List<AttractionPlan_Luana>  showAttractionPlans(Integer attractionId) {
		 return attractionPlanRepository.showAttractionPlans(attractionId);
	}
	
}
	
