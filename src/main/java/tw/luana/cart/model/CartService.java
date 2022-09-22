package tw.luana.cart.model;

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
public class CartService {

	
	
	@Autowired
	private CartRepository cartRepository;
	
	
	public String getAttractionName(Integer attractionId) {
		return	cartRepository.getAttractionName(attractionId).getName();
	}
	
	public void addToCart(Cart cart) {		
		cartRepository.save(cart);
	}
	
	public List<Cart> showCart() {
		return cartRepository.findAll();
	}
	
	public void removeCartItemfromcart(Integer itemId) {
		cartRepository.deleteById(itemId);
	}
	
}
	
