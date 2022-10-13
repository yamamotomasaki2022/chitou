package tw.luana.order.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface OrderListRepository extends JpaRepository<OrderList, Integer> {

//	public List<OrderList> findAllByMemberid(Integer memberid);

	public List<OrderList> findByOrderid(String orderid);
	
	public List<OrderList> findAllByOrdertype(String ordertype);
	
	@Query(value = "select * from Orderlist order by orderdate desc", nativeQuery = true)
	public List<OrderList> findAllOrderByOrderdate();
	
	@Query(value = "select * from Orderlist where memberid = ?1 order by orderdate desc", nativeQuery = true)
	public List<OrderList> findByOrderidOrderByOrderdate(Integer memberid);
	
	@Modifying
	@Query(value = "update OrderList set orderstatus = ?1 where orderid = ?2")
	public Integer updateOrderStatus(String orderstatus ,String orderid);
	
	
//	@Query(value = "from OrderList where ?1 like concat('%',?2,'%')")
//	@Query(value = "select * from OrderList where charindex(?2, ?1) >0", nativeQuery = true)
//	public List<OrderList> findOrderListStringKey(String type,String keyword);
	
	//@Query(value = "select * from OrderList where ?1 like concat('%',?2,'%')",nativeQuery = true)
	//@Query(value = "from OrderList where ?1 = ?2")
	//public List<OrderList> findOrderListStringKey(String type,String keyword);
	
//	@Query(value = "from OrderList where ?1 like concat('%',?2,'%')")
//	public List<OrderList> findOrderListsIntegerKey(String type, Integer keyword);

	public List<OrderList>findAllByOrderidContaining(String keyword);
	public List<OrderList>findAllByOrdertypeContaining(String keyword);
	public List<OrderList>findAllByOrderdateContaining(String keyword);
	public List<OrderList>findAllByOrderstatusContaining(String keyword);
	
	@Query(value = "from OrderList where totalprice like concat('%',?1,'%')")
	public List<OrderList>findAllByTotalpriceContaining(String keyword);
	
	@Query(value = "from OrderList where memberid like concat('%',?1,'%')")
	public List<OrderList>findAllByMemberidContaining(String keyword);
	
}
