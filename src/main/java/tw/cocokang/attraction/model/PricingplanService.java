package tw.cocokang.attraction.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PricingplanService {
	
	@Autowired
	private PricingplanRepository ppRepo;
	
	public List<Pricingplan> listPricingplans(Attraction attraction){
		return ppRepo.findAllByAttraction(attraction);
	}
}
