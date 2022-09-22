package tw.luana.attraction.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface AttractionPlanRepository_Luana extends JpaRepository<AttractionPlan_Luana, Integer> {
	
	@Query(value = "from AttractionPlan_Luana where attractionid = ?1")
	public List<AttractionPlan_Luana>  showAttractionPlans(Integer attractionId);
}
