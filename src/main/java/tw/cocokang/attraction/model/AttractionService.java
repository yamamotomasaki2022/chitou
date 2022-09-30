package tw.cocokang.attraction.model;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class AttractionService {
	
	@Autowired
	private AttractionRepository aRepo;
	
	
	@Autowired
	private PricingplanRepository pRepo;
	
	 //--------------------Attraction
	
	//insert
	public void insert(Attraction attraction,int preferid) {
		aRepo.save(attraction);
	}
//	public void insert(Attraction attraction) {
//		aRepo.save(attraction);
//	}
	//update
	 public void update(Attraction attraction,Integer preferid){  
		 System.out.println(attraction.getPreferid());
		 aRepo.save(attraction);
	 }  
//	 public void update(Attraction attraction){  
//		 aRepo.save(attraction);
//	 }  
	//Delete
	public void delete(Integer attid) {
		aRepo.deleteById(attid); 
	}
	//Get Attraction By attName
	public List<Attraction> findAttractionsAction(String attName){
			return aRepo.findAttractions(attName);
		}
	//Get Attraction By attid
    public Attraction selectByAttid(Integer attid){  
    return aRepo.findById(attid).get();  
    }  
	//Get all Attractions
	 public List<Attraction> getAll(){
	 return aRepo.findAll();  
	 }  
	 
	 //--------------------Pricing plan
	 
	 
		//insert plan
		public void insertPlan(Pricingplan pricingplan,Integer attractionid) {
			pRepo.save(pricingplan);
		}	 
	 
		//update plan
		 public void updatePlan(Pricingplan pricingplan,Integer attractionid){  
			 System.out.println(pricingplan.getAttractionid());
			 pRepo.save(pricingplan);
		 }  
		//Delete plan
			public void deletePlan(Integer planid) {
				aRepo.deleteById(planid); 
			}
		//顯示景點內方案
		 public List<Pricingplan> showPricingplans(Integer attractionid) {
		 return pRepo.showPricingplans(attractionid);
	}
}
