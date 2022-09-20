package tw.cocokang.attraction.model;


import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;


public interface AttractionRepository extends JpaRepository<Attraction, Integer> {

	public Optional<Attraction> findByattNameLike(String attName);
//	public Optional<Attraction> findByName(String attName);


}
