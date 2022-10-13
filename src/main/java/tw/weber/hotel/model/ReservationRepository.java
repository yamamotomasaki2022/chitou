package tw.weber.hotel.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.luana.order.model.AttractionOrderDetail;

public interface ReservationRepository extends JpaRepository<Reservation, Integer> {


	public List<Reservation> findAllByOrderId(String orderid);
	@Query(value = "select * from reservation where (checkInDate = ?2 or checkoutdate = ?2) and roomID = ?1",nativeQuery = true)
	public Optional<Reservation> findByDateAndRoom(int roomID,String date);
}
