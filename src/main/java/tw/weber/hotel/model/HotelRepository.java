package tw.weber.hotel.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface HotelRepository extends JpaRepository<Hotel, Integer> {
	
//	@Query(value = "select * from hotel where ?1 like concat('%',?2,'%')",nativeQuery = true)
//	public List<Hotel> findAllByKey(String type,String key);
	@Query("from Hotel where HotelID like concat('%',?1,'%')")
	public List<Hotel> findAllByHotelIDContaining(String keyword);
	public List<Hotel> findAllByNameContaining(String keyword);
	public List<Hotel> findAllByAddressContaining(String keyword);
	public List<Hotel> findAllByTypeContaining(String keyword);
	public List<Hotel> findAllByIntroContaining(String keyword);
	public List<Hotel> findAllByCountryContaining(String keyword);
	public List<Hotel> findAllByPhoneContaining(String keyword);
	public List<Hotel> findAllByStatusContaining(String keyword);
	@Query("from Hotel where Capacity like concat('%',?1,'%')")
	public List<Hotel> findAllByCapacity(String keyword);
	public List<Hotel> findAllByOwnerContaining(String keyword);
	@Query("from Hotel where AveragePrice like concat('%',?1,'%')")
	public List<Hotel> findAllByAveragePriceContaining(String keyword);
	public List<Hotel> findAllByPhotosContaining(String keyword);
}
