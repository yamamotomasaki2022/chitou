package tw.coco.attraction.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AttractionService {
	
	@Autowired
	private AttractionDao aDao;
	//利用dao間接return

	
	//insert
	public boolean insert(Attraction attraction,Integer preferID) {
		return aDao.insert(attraction,preferID);
	}
	//update
	
//	 public void update(Attraction attraction) {
//		 return aDao.update.merge(attraction);
//		 }
	public boolean update(Attraction attraction,Integer preferid) {
		return aDao.update(attraction, preferid);
	}
//	public Attraction update(Attraction attraction) {
//		return aDao.update(attraction);
//	}
	
//	  public void update(Attraction attraction) {
//		  aDao.update(attraction);	 
//	    }
	//Delete
	public boolean delete(Integer attid) {
		return aDao.delete(attid);
	}
	//Get Attraction By attName
	 public List<Attraction> selectByAttName(String attName) {
			return aDao.selectByAttName(attName);
	 }
	//Get all Attractions
	public List<Attraction> selectByAttractionAll() {
		return aDao.selectByAttractionAll();
	}
    public Attraction selectByAttid(Integer attid){ 
		return aDao.selectByAttid(attid);
	}
    
//    public static Attraction selectByAttid(Integer attid){
//	     return aDao.selectByAttid(attid);
//	    }

}
