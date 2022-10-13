package tw.cocokang.attraction.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.cocokang.attraction.model.Attraction;
import tw.cocokang.attraction.model.AttractionService;

@Controller
public class AttractionFrontController {
	
	@Autowired
	private AttractionService aService;
	
	public String path = "coco/attraction-user/";
	
	@GetMapping("/AttractionSearch")
	public String attraction(Model m){
		List<Attraction> attractionlist = aService.getAll();
		m.addAttribute("AttractionList",attractionlist);
		return path + "AttractionList";
	}
	
	@GetMapping("/AttracionSearchName")
	public String attraction(@RequestParam String keyword,Model m) {
		List<Attraction> attractionlist = aService.findAttractionsAction(keyword);
		m.addAttribute("AttractionList",attractionlist);
		return path + "AttractionList";
	}
	
	@GetMapping("/AttractionPage")
	public String AttractionListAction(@RequestParam int attID,Model m) {
		Attraction attraction = aService.selectByAttid(attID);
		m.addAttribute("attraction", attraction);
		String[] index ={"One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen"};
		m.addAttribute("index",index);
		return path + "AttractionPage";
	}
	
	@ResponseBody
	@GetMapping("/getatt")
	public Attraction getatt(@RequestParam int attID,Model m) {
		Attraction attraction = aService.selectByAttid(attID);
		return attraction;
	}
}
