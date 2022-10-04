package tw.weber.hotel.model;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
@Transactional
public class ReservationService {
	
	@Autowired
	ReservationRepository reRepo;
	
	public Reservation save(Reservation reservation) {
		return reRepo.save(reservation);
	}
}
