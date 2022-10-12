package tw.weber.hotel.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface BSearchRepository extends JpaRepository<BookSearch, Integer> {

	@Query(value = "select a.roomID,b.* from(select * from room where roomstyleID = ?1) as a left join (select * from reservation where checkInDate = ?2 or checkoutdate = ?2) as b on a.roomID = b.roomID",nativeQuery = true)
	public List<BookSearch> findRoomStatusByDate(int styleID,String date);
}
