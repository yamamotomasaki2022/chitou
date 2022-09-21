package tw.trista.flightticket.model;

import java.util.List;
import java.util.Optional;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import chitou.trista.model.FlightTicket;
import tw.weber.hotel.model.Hotel;



@Service
@Transactional
public class FlightTicketService {
	@Autowired
	private FlightTicketRepository dao;
	
	public List<FlightTicket> selectAll(){
		return dao.findAll();
	}

	
	//新增
	public FlightTicket insert(FlightTicket flightBean) {
		
		System.out.println(flightBean.toString());
		return dao.save(flightBean);
	}
	
	//修改
	public FlightTicket updateOne(FlightTicket flightBean) {
		return dao.save(flightBean);
	}
	
	//刪除
	public void deleteOne(String flightID) {
		 dao.deleteById(flightID);
	}
	
	//查詢部分
//	public FlightTicket queryFlightId(String originID,String destinationID,String departureTime,String arrivalTime,int classID) {
//		Optional <FlightTicket> optional = dao.findById(originID, destinationID, departureTime, arrivalTime, classID);
//		return optional.get();
//	}
	
    public FlightTicket selectByFlightid(String flightID){  
    return dao.findById(flightID).get();  
    }
	
//	public List<FlightTicket> selectByKey(String originID,String destinationID,String departureTime,String arrivalTime,int classID){
//		if(type.equals("originID")) {
//			return dao.findByOriginid(originID);
//		}else if(type.equals("destinationID")) {
//			return dao.findByDestinationid(destinationID);
//		}else if(type.equals("departureTime")) {
//			return dao.findByDeparturetime(departureTime);
//		}else if(type.equals("arrivalTime")) {
//			return dao.findByArrivaltime(arrivalTime);
//		}else if(type.equals("classID")) {
//			return dao.findByClassid(classID);
//		}
//		return null;
//	}
	
	
	public List<FlightTicket> selectByFlight(String Originid,String Destinationid,String Departuretime,String Arrivaltime,int Classid) {
		return dao.findByOriginid(Originid,Destinationid,Departuretime,Arrivaltime,Classid);
	}
    

}
