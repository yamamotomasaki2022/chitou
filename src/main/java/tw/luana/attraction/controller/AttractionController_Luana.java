package tw.luana.attraction.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.luana.attraction.model.AttractionService_Luana;

@Controller
public class AttractionController_Luana {

	@Autowired
	private AttractionService_Luana attractionService;
	
	@Autowired
	private HttpSession session;
	
	
	@RequestMapping(path = "/Luana_index", method = RequestMethod.GET)
	public String processMainAction() {
		return "Luana_index";
	}	
	
	//顯示所有景點
	@RequestMapping(path = "Luana_allAttractions", method = RequestMethod.GET)
	public String showAllAttraction(Model m) {
		m.addAttribute("allAttractions",attractionService.showAllAttractions());
		return "Luana_allAttractions";
	}
	
	//搜尋景點
	@RequestMapping(path = "searchAttractionReasults",params = {"Luana_attraction"}, method = RequestMethod.POST)
	public String searchResults(@RequestParam("Luana_attraction") String attraction,Model m)
			 {
		
		m.addAttribute("searchReasults",attractionService.searchAttraction(attraction));		
		return "Luana_searchAttractionReasults";

	}
	
	//顯示景點內方案
	@RequestMapping(path = "showAttractionPlans",params = {"attractionId"}, method = RequestMethod.POST)
	public String attractionPlans(@RequestParam("attractionId") int attractionId ,Model m){

		m.addAttribute("planList",attractionService.showAttractionPlans(attractionId));

		return "Luana_attractionPlans";

	}
	
}
