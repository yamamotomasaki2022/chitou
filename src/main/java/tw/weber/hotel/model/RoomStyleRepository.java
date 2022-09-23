package tw.weber.hotel.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface RoomStyleRepository extends JpaRepository<RoomStyle, Integer> {
	
//	@Query(value = "select * from hotel where ?1 like concat('%',?2,'%')",nativeQuery = true)
//	public List<Hotel> findAllByKey(String type,String key);
	
	public List<RoomStyle> findAllByHotel(Hotel hotel);
	
	@Query("from Hotel where RoomStyleID like concat('%',?1,'%')")
	public List<RoomStyle> findAllByRoomStyleIDContaining(String keyword);
	public List<RoomStyle> findAllByNameContaining(String keyword);
	public List<RoomStyle> findAllByCapacityContaining(String keyword);
	public List<RoomStyle> findAllByStatusContaining(String keyword);
	@Query("from Hotel where Price like concat('%',?1,'%')")
	public List<RoomStyle> findAllByPriceContaining(String keyword);
	public List<RoomStyle> findAllByBedContaining(String keyword);
}
