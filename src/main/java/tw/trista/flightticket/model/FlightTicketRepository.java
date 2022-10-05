package tw.trista.flightticket.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;



public interface FlightTicketRepository extends JpaRepository<FlightTicket, String> {



	@Query(value = "from FlightTicket where airline like concat('%',?1,'%')")
	public List<FlightTicket> selectByAirline(String airline);

	
}
