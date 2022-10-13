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
	public FlightTicket insert(FlightTicket flightbean) {
		return dao.save(flightbean);
	}
	
	//修改
	public FlightTicket updateOne(FlightTicket flightbean) {
		return dao.save(flightbean);
	}
	
	//刪除
	public void deleteOne(String flightid) {
		 dao.deleteById(flightid);
	}
	
	//查詢部分(用航空公司查詢)
    public List<FlightTicket> selectByAirline(String airline){  
    return dao.selectByAirline(airline);  
    }

    public FlightTicket selectByflightid(String flightid){  
    	System.out.println(dao.findById(flightid).get());
    return dao.findById(flightid).get();  
    }
    
    public List<FlightTicket> getAll(){
    	return dao.findAll();
    }
    
    //前端查詢
    public List<FlightTicket> findByOriginidAndDestinationidAndDeparturetimeAndArrivaltime(String originid,String destinationid,String departuretime,String arrivaltime){
    	return dao.findByOriginidAndDestinationidAndDeparturetimeAndArrivaltime(originid, destinationid, departuretime, arrivaltime);
    }
}
