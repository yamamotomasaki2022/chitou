package tw.weber.hotel.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface RoomStyleRepository extends JpaRepository<RoomStyle, Integer> {
	
//	@Query(value = "select * from hotel where ?1 like concat('%',?2,'%')",nativeQuery = true)
//	public List<Hotel> findAllByKey(String type,String key);
	
	public List<RoomStyle> findAllByHotel(Hotel hotel);
	
	@Query("from RoomStyle where StyleID like concat('%',?1,'%')")
	public List<RoomStyle> findAllByRoomStyleIDContaining(String keyword);
	public List<RoomStyle> findAllByNameContaining(String keyword);
	public List<RoomStyle> findAllByCapacityContaining(String keyword);
	public List<RoomStyle> findAllByStatusContaining(String keyword);
	@Query("from RoomStyle where Price like concat('%',?1,'%')")
	public List<RoomStyle> findAllByPriceContaining(String keyword);
	public List<RoomStyle> findAllByBedContaining(String keyword);
	
	@Query(value = "select b.* from "
			+ "(select * from room where roomID not in  "
			+ "(select roomID from reservation "
			+ "where checkInDate between ?1 and ?2 or checkoutdate between ?1 and ?2)) "
			+ "as a JOIN roomstyle as b on a.roomStyleID = b.styleID "
			+ "JOIN hotel as c on b.hotelID = c.hotelID "
			+ "where c.hotelID = ?3 and b.capacity > ?4 ",nativeQuery = true)
	public List<RoomStyle> crazyFind(String dateStart,String dateEnd,int hotelID,int number);
	
	//找時間寫搜索特定旅館限制
}
