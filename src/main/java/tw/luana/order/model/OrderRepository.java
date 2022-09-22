package tw.luana.order.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OrderRepository extends JpaRepository<Orders, Integer> {

	public Orders findByOrderid(Integer orderid);


	
}
