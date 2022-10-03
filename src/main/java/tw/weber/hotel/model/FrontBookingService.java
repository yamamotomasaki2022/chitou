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
	
	@Autowired
	private RSSearchRepository rssRepo;
	
	@Autowired
	private RoomStyleRepository rsRepo;
	
	public List<Room> find(){
		return rRepo.find();
	}
	
	public List<HotelforSearch> crazy(String dateStart,String dateEnd,String destination,int number){
		return hsRepo.crazy(dateStart,dateEnd,destination,number);
	}
	
	public Hotel selectHotel(int hotelID) {
		return hRepo.findById(hotelID).get();
	}
	
	public List<RoomStyleforSearch> getRoomStyle(String dateStart,String dateEnd,int hotelID,int number) {
		return rssRepo.crazy(dateStart, dateEnd, hotelID, number);
	}
	
	public RoomStyle findRoomData(int roomStyleID) {
		return rsRepo.findById(roomStyleID).get();
	}
}
