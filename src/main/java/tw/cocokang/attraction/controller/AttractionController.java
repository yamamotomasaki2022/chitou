package tw.cocokang.attraction.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;

import tw.cocokang.attraction.model.Attraction;
import tw.cocokang.attraction.model.AttractionService;
import tw.cocokang.attraction.model.Hobbyclassification;

@Controller
public class AttractionController {

	@Autowired
	private AttractionService aService;

	public String path = "coco/attraction/";

	@GetMapping("/listAttractions")
	public String AttractionListAction(Model m) {
		m.addAttribute("listAttraction", aService.getAll());
		return path + "kangListBackground";
	}

//	insert
	@GetMapping("/addAttraction")
	public String insertview(Model m) {
		Attraction attraction = new Attraction();
		m.addAttribute("attraction", attraction);
		return path + "kangInsertAttractionBackground";
	}

	@PostMapping("/addAttractionAction")
	public String insert(@ModelAttribute("attraction") Attraction attraction, Integer preferid, Model m) {

//		Integer preferid_2 = attraction.getHobbyclassification().getPreferid();		
//		Attraction attractionbean = aService.selectByAttid(attraction.getAttid());
		  Hobbyclassification hobbyclassification = new Hobbyclassification();
		  hobbyclassification.setPreferid(attraction.getPreferid());
		  attraction.setHobbyclassification(hobbyclassification);
		  

		m.addAttribute("attraction", attraction);
		aService.insert(attraction);

		List<Attraction> attractionAll = aService.getAll();
		m.addAttribute("listAttraction", attractionAll);
		return path + "kangListBackground";
	}

	// update
	@GetMapping("/updateAttraction")
	public String updateview(@RequestParam("attid") Integer attid, Model m) {
		Attraction selectByAttid = aService.selectByAttid(attid);
		m.addAttribute("selectByAttid", selectByAttid);
//		System.out.println("selectByAttid"+selectByAttid.getAttid());
		return path + "kangUpdateAttractionBackground";
	}

	@PostMapping("/updateAttraction")
	public String updateAction(@ModelAttribute("selectByAttid") Attraction attraction, Integer preferid, Model m) {

		
		
		  Hobbyclassification hobbyclassification = new Hobbyclassification();
		  hobbyclassification.setPreferid(attraction.getPreferid());
		  attraction.setHobbyclassification(hobbyclassification);
		  
		  aService.update(attraction, preferid);

		List<Attraction> attractionAll = aService.getAll();
		m.addAttribute("listAttraction", attractionAll);
		return path + "kangListBackground";
	}

	// delete
	@GetMapping("/deleteAttraction")
	public String delete(@RequestParam("attid") Integer attid, Model m) {
		if (attid != null) {
			aService.delete(attid);
		}
		List<Attraction> attractionAll = aService.getAll();
		m.addAttribute("listAttraction", attractionAll);
		return path + "kangListBackground";
	}

	// Get Attraction By attName
	@PostMapping("/searchAttraction")
	public String selectbyname(@RequestParam("search") String attName, Model m) {
//    	Attraction attraction = aService.findByattNameLike(attName);
		List<Attraction> attraction = aService.findAttractionsAction(attName);
		m.addAttribute("attraction", attraction);
		return path + "kangSelectBackground";

	}

}
