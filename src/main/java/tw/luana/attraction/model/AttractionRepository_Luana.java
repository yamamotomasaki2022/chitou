package tw.luana.attraction.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface AttractionRepository_Luana extends JpaRepository<Attraction_Luana, Integer> {

	@Query(value = "from Attraction_Luana where name like concat('%',?1,'%')")
	public List<Attraction_Luana> searchAttraction(String name);
}
