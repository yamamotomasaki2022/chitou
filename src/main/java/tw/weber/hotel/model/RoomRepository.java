package tw.weber.hotel.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface RoomRepository extends JpaRepository<Room, Integer> {
	
	@Query(value = "select * from room where roomID not in  "
			+ "(select roomID from reservation "
			+ "where checkInDate between '2022-09-12' and '2022-09-14' or checkoutdate between '2022-09-12' and '2022-09-14') "
			+ "order by roomStyleID",nativeQuery = true)
	public List<Room> find();
	
//	@Query(value = "select * from "
//			+ "(select * from room where roomID not in  "
//			+ "(select roomID from reservation "
//			+ "where checkInDate between ?1 and ?2 or checkoutdate between ?1 and ?2)) "
//			+ "as a JOIN roomstyle as b on a.roomStyleID = b.styleID "
//			+ "JOIN hotel as c on b.hotelID = c.hotelID "
//			+ "where c.country = ?3 and b.capacity > ?4 "
//			+ "order by b.hotelID",nativeQuery = true)
//	public List<Room> crazy(String dateStart,String dateEnd,String destination,int number);
	
	
//	@Query(value = "select a.* from "
//			+ "(select * from room where roomID not in  "
//			+ "(select roomID from reservation "
//			+ "where checkInDate between ?1 and ?2 or checkoutdate between ?1 and ?2)) "
//			+ "as a JOIN roomstyle as b on a.roomStyleID = b.styleID "
//			+ "JOIN hotel as c on b.hotelID = c.hotelID "
//			+ "where c.hotelID = ?3 and b.capacity > ?4 ",nativeQuery = true)
//	public List<Room> crazyFind(String dateStart,String dateEnd,int hotelID,int number);
//	//我為什麼要寫這種東西
	
	public List<Room> findAllByStyle(RoomStyle style);
	
	@Query(value = "select top 1 * from room "
			+ "where roomID not in  "
			+ "(select roomID from reservation "
			+ "where checkInDate between ?1 and ?2 or checkoutdate between ?1 and ?2) "
			+ "and roomStyleID = ?3",nativeQuery = true)
	public Optional<Room> findEmptyRoom(String dateStart,String dateEnd,int styleID);
	
	
}
