package tw.cocokang.attraction.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PricingplanService {
	
	@Autowired
	private PricingplanRepository pRepo;
	
	@Autowired
	private AttractionRepository aRepo;
	
	public List<Pricingplan> listPricingplans(Attraction attraction){
		return pRepo.findAllByAttraction(attraction);
	}
	
	public Pricingplan addNewPricingPlan(Pricingplan pricingplan,int attractionid) {
		Optional<Attraction> attraction = aRepo.findById(attractionid);
		pricingplan.setAttraction(attraction.get());
		return pRepo.save(pricingplan);
	}
	
	
}
