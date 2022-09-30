package tw.cocokang.attraction.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface PricingplanRepository extends JpaRepository<Pricingplan, Integer> {

	@Query(value = "from Pricingplan where attractionid = ?1")
	public List<Pricingplan> showPricingplans(Integer attractionid);
}
