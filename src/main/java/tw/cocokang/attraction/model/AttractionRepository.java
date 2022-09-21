package tw.cocokang.attraction.model;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;


public interface AttractionRepository extends JpaRepository<Attraction, Integer> {

	public List<Attraction> findByAttNameLike(String attName);
//	public Optional<Attraction> findByName(String attName);
	

}
