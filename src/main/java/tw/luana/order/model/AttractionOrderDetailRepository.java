package tw.luana.order.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface AttractionOrderDetailRepository extends JpaRepository<AttractionOrderDetail, Integer> {

	public List<AttractionOrderDetail> findAllByOrderid(String orderid);


	
}
