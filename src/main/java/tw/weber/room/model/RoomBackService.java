package tw.weber.room.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RoomBackService {
	
	@Autowired
	private RoomRepository rRepo;
	
	public List<Room> findAll(){
		return rRepo.findAll();
	}
	
	public Room findById(int roomID){
		Optional<Room> op = rRepo.findById(roomID);
		return op.get();
	}
	
	public List<Room> selectByKey(String type,String keyword){
//		if(type.equals("hotelID")) {
//			return rRepo.findAllByHotelIDContaining(keyword);
//		}else if(type.equals("name")) {
//			return rRepo.findAllByNameContaining(keyword);
//		}else if(type.equals("address")) {
//			return rRepo.findAllByAddressContaining(keyword);
//		}else if(type.equals("type")) {
//			return rRepo.findAllByTypeContaining(keyword);
//		}else if(type.equals("intro")) {
//			return rRepo.findAllByIntroContaining(keyword);
//		}else if(type.equals("country")) {
//			return rRepo.findAllByCountryContaining(keyword);
//		}else if(type.equals("phone")) {
//			return rRepo.findAllByPhoneContaining(keyword);
//		}else if(type.equals("status")) {
//			return rRepo.findAllByStatusContaining(keyword);
//		}else if(type.equals("capacity")) {
//			return rRepo.findAllByCapacity(keyword);
//		}else if(type.equals("owner")) {
//			return rRepo.findAllByOwnerContaining(keyword);
//		}else if(type.equals("averagePrice")) {
//			return rRepo.findAllByAveragePriceContaining(keyword);
//		}
		return null;
	}
	
	public Room insert(Room room) {
		return rRepo.save(room);
	}
	
	public Room update(Room room) {
		return rRepo.save(room);
	}
	
	public boolean delete(int roomID) {
		rRepo.deleteById(roomID);
		return true;
	}
	
}
