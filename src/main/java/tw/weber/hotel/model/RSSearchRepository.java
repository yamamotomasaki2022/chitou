package tw.weber.hotel.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RSSearchRepository extends JpaRepository<RoomStyleforSearch, Integer> {

	@Query(value = "select b.styleID,b.name,b.price,b.capacity,b.bed,count(*) roomAmount "
			+ "from (select * from room where roomID not in  "
			+ "(select roomID from reservation where checkInDate between ?1 and ?2 or checkoutdate between ?1 and ?2)) "
			+ "as a JOIN roomstyle as b on a.roomStyleID = b.styleID "
			+ "JOIN hotel as c on b.hotelID = c.hotelID "
			+ "where c.hotelID = ?3 and b.capacity > ?4 group by b.styleID,b.name,b.price,b.capacity,b.bed",nativeQuery = true)
	public List<RoomStyleforSearch> crazy(String dateStart,String dateEnd,int hotelID,int number);
	//我到底為什麼要寫這種東西

}
