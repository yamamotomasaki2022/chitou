package tw.weber.hotel.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface RoomRepository extends JpaRepository<Room, Integer> {
	
	@Query(value = "select * from Room where roomStyleID = ?1",nativeQuery = true)
	public List<Room> findAllByStyle(int styleID);
}
