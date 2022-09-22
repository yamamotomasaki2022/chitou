package tw.luana.order.model;

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
public class OrderService {
	
	
	@Autowired
	private OrderRepository orderRepository;
	
	
	public void addToOrder(Orders orders) {		
		orderRepository.save(orders);
	}
	
	public List<Orders> showOrders() {
		return orderRepository.findAll();
	}
	
	public void updateOrderStatus(Integer status, Integer orderid) {
		
		Orders order = orderRepository.findByOrderid(orderid);
		order.setOrderstatus(status);
			 orderRepository.save(order);
		}
	
}
	
