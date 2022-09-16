package tw.weber.hotel.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface HotelRepository extends JpaRepository<Hotel, Integer> {
	
	@Query(value = "select * from hotel where ?1 like concat('%',?2,'%')",nativeQuery = true)
	public List<Hotel> findAllByKey(String type,String key);
}
