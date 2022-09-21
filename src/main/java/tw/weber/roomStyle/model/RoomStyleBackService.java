package tw.weber.roomStyle.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.weber.hotel.model.Hotel;

@Service
@Transactional
public class RoomStyleBackService {
	
	@Autowired
	private RoomStyleRepository rsRepo;
	
	public List<RoomStyle> findAll(){
		return rsRepo.findAll();
	}
	
	public List<RoomStyle> findAllByHotelID(int hotelID){
		Hotel hotel = new Hotel();
		hotel.setHotelID(hotelID);
		return rsRepo.findAllByHotel(hotel);
	}
	
	public RoomStyle findById(int roomID){
		Optional<RoomStyle> op = rsRepo.findById(roomID);
		return op.get();
	}
	
	public List<RoomStyle> selectByKey(String type,String keyword){
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
	
	public RoomStyle insert(RoomStyle room) {
		return rsRepo.save(room);
	}
	
	public RoomStyle update(RoomStyle room) {
		return rsRepo.save(room);
	}
	
	public boolean delete(int roomID) {
		rsRepo.deleteById(roomID);
		return true;
	}
	
}
