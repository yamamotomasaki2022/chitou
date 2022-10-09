package tw.weber.hotel.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.luana.order.model.AttractionOrderDetail;

public interface ReservationRepository extends JpaRepository<Reservation, Integer> {


	public List<Reservation> findAllByOrderId(String orderid);

}
