package tw.cocokang.attraction.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.cocokang.exception.AttractionNotFoundException;

@Service
@Transactional
public class AttractionService {
	
	@Autowired
	private AttractionRepository aRepo;

	//insert
	public void insert(Attraction attraction,Integer preferID) {
		aRepo.save(attraction);
	}
	//update
	 public void update(Attraction attraction,Integer preferid){  
		 aRepo.save(attraction);
	 }  
	//Delete
	public void delete(Integer attid) {
		aRepo.deleteById(attid); 
	}
	//Get Attraction By attName
	public Attraction findByattNameLike(String attName){
			Optional<Attraction> op = aRepo.findByattNameLike(attName);
			
			if(op.isEmpty()) {
				//如果是空的拋出狀況(自訂訊息)
				throw new AttractionNotFoundException("Can't find Attraction");
			}
			return op.get();
		}
//	public List<Attraction> findByNameLike(String attName){
//		return aRepo.findByattNameLike(attName);
//	}
	//Get Attraction By attid
    public Attraction selectByAttid(Integer attid){  
    return aRepo.findById(attid).get();  
    }  
	//Get all Attractions
	 public List<Attraction> getAll(){
	 return aRepo.findAll();  
	 }  

}
