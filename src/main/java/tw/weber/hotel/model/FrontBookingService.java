package tw.weber.hotel.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FrontBookingService {
	@Autowired
	private RoomRepository rRepo;
	
	@Autowired
	private HSearchRepository hsRepo;
	
	@Autowired
	private HotelRepository hRepo;
	
	@Autowired RoomStyleRepository rsRepo;
	
	public List<Room> find(){
		return rRepo.find();
	}
	
	public List<HotelforSearch> crazy(String dateStart,String dateEnd,String destination,int number){
		return hsRepo.crazy(dateStart,dateEnd,destination,number);
	}
	
	public Hotel selectHotel(int hotelID) {
		return hRepo.findById(hotelID).get();
	}
	
	public List<RoomStyle> selectRoom(String dateStart,String dateEnd,int hotelID,int number) {
		return rsRepo.crazyFind(dateStart, dateEnd, hotelID, number);
	}
	
}
