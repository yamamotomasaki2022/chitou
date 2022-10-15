package tw.trista.flightticket.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;



public interface flightticketorderRepository extends JpaRepository<flightticketorder, String> {

	public List<flightticketorder> findAllByOrderid(String orderid);
}

