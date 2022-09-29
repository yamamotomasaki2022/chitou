package tw.weber.hotel.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface HSearchRepository extends JpaRepository<HotelforSearch, Integer> {

	@Query(value = "select c.hotelID,c.name,c.address,c.averagePrice,count(*) amount "
			+ "from (select * from room where roomID not in  "
			+ "(select roomID from reservation where checkInDate between ?1 and ?2 or checkoutdate between ?1 and ?2)) "
			+ "as a JOIN roomstyle as b on a.roomStyleID = b.styleID "
			+ "JOIN hotel as c on b.hotelID = c.hotelID "
			+ "where c.country = ?3 and b.capacity > ?4 group by c.hotelID,c.name,c.address,c.averagePrice",nativeQuery = true)
	public List<HotelforSearch> crazy(String dateStart,String dateEnd,String destination,int number);
	//我到底為什麼要寫這種東西

}
