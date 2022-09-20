package tw.trista.flightticket.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FlightTicketService {
	@Autowired
	private FlightTicketDAO dao;
	
	public FlightTicket insert(FlightTicket flightBean) {
		return dao.insert(flightBean);
	}
	
	public FlightTicket queryFlightId(String originID,String destinationID,String departureTime,String arrivalTime,int classID) {
		return dao.queryFlightId(originID, destinationID, departureTime, arrivalTime, classID);
	}
	
	public List<FlightTicket> selectAll() {
		return dao.selectAll();
	}
	
	public FlightTicket updateOne(String flightID, int newfare) {
		return dao.updateOne(flightID, newfare);
	}
	
	public boolean deleteOne(String flightID) {
		return dao.deleteOne(flightID);
	}
	
	
	
}
