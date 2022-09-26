package tw.trista.flightticket.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    public FlightTicket selectByFlightid(String flightID){  
    return dao.findById(flightID).get();  
    }

    public List<FlightTicket> findByOriginidAndDestinationidAndDeparturetimeAndArrivaltimeAndClassid(String originid,String destinationid,String departuretime,String arrivaltime,int classid){
    	return dao.findByOriginidAndDestinationidAndDeparturetimeAndArrivaltimeAndClassid(originid, destinationid, departuretime, arrivaltime, classid);
    }
}
