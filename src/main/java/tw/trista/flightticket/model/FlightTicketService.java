package tw.trista.flightticket.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FlightTicketService {
	@Autowired
	private FlightTicketRepository dao;
	
	//新增
	public FlightTicket insert(FlightTicket flightBean) {
		return dao.save(flightBean);
	}
	
	//查詢部分
//	public FlightTicket queryFlightId(String originID,String destinationID,String departureTime,String arrivalTime,int classID) {
//		Optional <FlightTicket> optional = dao.findById(originID, destinationID, departureTime, arrivalTime, classID);
//		return optional.get();
//	}
	public 
	
	//查詢全部
	public List<FlightTicket> selectAll() {
		return dao.findAll();
	}
	
	//修改
	public FlightTicket updateOne(FlightTicket flightBean) {
		return dao.save(flightBean);
	}
	
	//刪除
	public void deleteOne(String flightID) {
		 dao.deleteById(flightID);
	}
	
	
	
}
