package tw.weber.hotel.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class HotelBackService {
	
	@Autowired
	private HotelRepository hRepo;
	
	public List<Hotel> findAll(){
		return hRepo.findAll();
	}
	
	public Hotel findById(int hotelID){
		Optional<Hotel> op = hRepo.findById(hotelID);
		return op.get();
	}
	
	public List<Hotel> selectByKey(String type,String keyword){
		if(type.equals("hotelID")) {
			return hRepo.findAllByHotelIDContaining(keyword);
		}else if(type.equals("name")) {
			return hRepo.findAllByNameContaining(keyword);
		}else if(type.equals("address")) {
			return hRepo.findAllByAddressContaining(keyword);
		}else if(type.equals("type")) {
			return hRepo.findAllByTypeContaining(keyword);
		}else if(type.equals("intro")) {
			return hRepo.findAllByIntroContaining(keyword);
		}else if(type.equals("country")) {
			return hRepo.findAllByCountryContaining(keyword);
		}else if(type.equals("phone")) {
			return hRepo.findAllByPhoneContaining(keyword);
		}else if(type.equals("status")) {
			return hRepo.findAllByStatusContaining(keyword);
		}else if(type.equals("capacity")) {
			return hRepo.findAllByCapacity(keyword);
		}else if(type.equals("owner")) {
			return hRepo.findAllByOwnerContaining(keyword);
		}else if(type.equals("averagePrice")) {
			return hRepo.findAllByAveragePriceContaining(keyword);
		}
		return null;
	}
	
	public Hotel insert(Hotel hotel) {
		return hRepo.save(hotel);
	}
	
	public boolean delete(int hotelID) {
		hRepo.deleteById(hotelID);
		return true;
	}
	
	public Hotel update(Hotel hotel) {
		return hRepo.save(hotel);
	}
}
