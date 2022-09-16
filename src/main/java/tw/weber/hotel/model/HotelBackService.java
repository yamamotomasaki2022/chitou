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
		return hRepo.findAllByKey(type,keyword);
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
