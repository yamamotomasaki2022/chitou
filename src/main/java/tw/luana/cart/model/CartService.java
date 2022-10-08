package tw.luana.cart.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.luana.cart.model.Cart;
import tw.luana.cart.model.CartRepository;
import tw.luana.order.model.AttractionOrderDetailRepository;


@Service
@Transactional
public class CartService {

	
	
	@Autowired
	private CartRepository cartRepository;
	
	
	public String getAttractionName(Integer attractionId) {
		return	cartRepository.getAttraction(attractionId).getName();
	}
	
	public void addToCart(Cart cart) {		
		cartRepository.save(cart);
	}
	
	public List<Cart> showCart(Integer memberid) {
		return cartRepository.findByMemberid(memberid);
	}
	
	public void removeCartItemfromcart(Integer itemId) {
		cartRepository.deleteById(itemId);
	}
	
	public void updateQuantity(Integer quantity,Integer itemId) {
		
		Optional<Cart> findById = cartRepository.findById(itemId);
		findById.get().setQuantity(quantity);
		cartRepository.save(findById.get());
	}
	
	public void clearCart(Integer memberid) {
		cartRepository.deleteAllInBatch(cartRepository.findByMemberid(memberid));
	}
}
	
