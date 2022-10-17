package tw.trista.flightticket.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class flightticketorderservice {

	
	@Autowired
	private flightticketorderRepository dao;
	
	//新增
		public flightticketorder insert(flightticketorder flightorderbean) {
			return dao.save(flightorderbean);
		}
		
		
		public List<flightticketorder> findByLastname(String lastname) {
			return dao.findByLastname(lastname);
		}
}
