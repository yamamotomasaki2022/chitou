package tw.trista.flightticket.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.weber.hotel.model.Hotel;

public interface FlightTicketRepository extends JpaRepository<FlightTicket, String> {

////	@Query(value = "select * from flightticket where ?1 ",nativeQuery = true)
//	public List<FlightTicket> findByOriginid(String Originid);
//	//@Query(value = "select * from flightticket where ?2 ",nativeQuery = true)
//	public List<FlightTicket> findByDestinationid(String Destinationid);
//	//@Query(value = "select * from flightticket where ?3 ",nativeQuery = true)
//	public List<FlightTicket> findByDeparturetime(String Departuretime);
//	//@Query(value = "select * from flightticket where ?4 ",nativeQuery = true)
//	public List<FlightTicket> findByArrivaltime(String Arrivaltime);
//	//@Query(value = "select * from flightticket where ?5 ",nativeQuery = true)
//	public List<FlightTicket> findByClassid(int Classid);


	public List<FlightTicket> findByOriginid(String Originid,String Destinationid,String Departuretime,String Arrivaltime,int Classid);
	
	
}
