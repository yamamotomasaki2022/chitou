package tw.luana.order.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface HotelOrderRepository extends JpaRepository<HotelOrder, Integer> {

	public HotelOrder findByreservationid(Integer reservationid);

	
	
}
