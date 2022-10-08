package tw.luana.cart.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.luana.attraction.model.Attraction_Luana;

public interface CartRepository extends JpaRepository<Cart, Integer> {

	@Query(value = "from Attraction_Luana where attractionId = ?1")
	public Attraction_Luana getAttraction(Integer attractionId);

	public List<Cart> findByMemberid(Integer memberid);
}
