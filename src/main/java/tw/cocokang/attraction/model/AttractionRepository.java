package tw.cocokang.attraction.model;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface AttractionRepository extends JpaRepository<Attraction, Integer> {

	@Query(value = "from Attraction where attName like concat('%',?1,'%')")
	public List<Attraction> findAttractions(String attName);
//	public List<Attraction> findByAttNameLike(String attName);
//	public Optional<Attraction> findByName(String attName);
	

}
