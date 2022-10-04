package tw.luana.order.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderListRepository extends JpaRepository<OrderList, Integer> {

	public List<OrderList> findAllByMemberid(Integer memberid);

	public List<OrderList> findByOrderid(String orderid);

}
