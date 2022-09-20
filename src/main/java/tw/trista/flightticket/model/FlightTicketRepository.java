package tw.trista.flightticket.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface FlightTicketRepository extends JpaRepository<FlightTicket, String> {

	@Query(value = "select * from flightticket where if (?1 !='',originID=?1,1=1) and if (?2 !='',destinationID=?2,1=1)",nativeQuery = true)
}
