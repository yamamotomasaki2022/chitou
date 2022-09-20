package tw.coco.attraction.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import tw.coco.model.Attraction;
import tw.coco.model.AttractionService;

@Controller
public class AttractionController {
	
	@Autowired
	private AttractionService_Luana attractionService;
	
	@RequestMapping(path = "/attraction.controller", method = RequestMethod.GET)
	//model處理controller的環境 之前是request.setAttribute現在換成model裡的Attribute處理
	//model=中間幫忙處理的人
	public String processMainAction(Model m) {
		//Members mem1 = new Members();
		Attraction attraction = new Attraction();
		//左key(自行命名)右value
		m.addAttribute("attraction", attraction);
		return "attraction";
}
	//list
	@RequestMapping(path = "/listAttractions",method = RequestMethod.GET)
	 public String listAttraction(Model m) {
	        List < Attraction > attractionAll = attractionService.selectByAttractionAll();
	        m.addAttribute("listAttraction", attractionAll);
	        return "kangListBackground";
	    }
	
//	insert
	@GetMapping("/addAttraction")
	public String insertview(Model m) {
		Attraction attraction = new Attraction();
		m.addAttribute("attraction", attraction);
		return "kangInsertAttractionBackground";
	}
	
    @RequestMapping(path="/addAttractionAction",method = RequestMethod.POST)    
    public String insert(@ModelAttribute("attraction") Attraction attraction,Integer preferid,Model m){    
		m.addAttribute("attraction", attraction);
//		return "attraction";	
    	attractionService.insert(attraction,preferid);    

        List < Attraction > attractionAll = attractionService.selectByAttractionAll();
        m.addAttribute("listAttraction", attractionAll);
        return "kangListBackground";
    }    
//	//Get Attraction By attName
    
    @RequestMapping(path="/searchAttraction", method=RequestMethod.POST)
	public String selectbyname(@RequestParam("search")String attName, Model m) {
    	List<Attraction> attraction = attractionService.selectByAttName(attName);
    	m.addAttribute("attraction", attraction);
    	return "kangSelectBackground";
}
    
//	@PostMapping("/searchAttraction")
//	public String selectbyname(@RequestParam("search") String attName, Model m) {
//		List<Attraction> attraction = attractionService.selectByAttName(attName);
//		m.addAttribute("attName", attraction);
//		return listAttraction(m);
//	}
////	@RequestMapping(path="/searchAttraction", method=RequestMethod.POST)
//	public String more(String attName, Model m) {
//		List<Attraction> attraction = attractionService.selectByAttName(attName);
//		m.addAttribute("attName", attraction);
//		return "kangSelectBackground";
//	}
//    @RequestMapping("/searchAttraction")
//    public ModelAndView search(@RequestParam String attName) {
//        List<Attraction> attraction = attractionService.selectByAttName(attName);
//        ModelAndView mav = new ModelAndView("search");
//        mav.addObject("listAttraction2", attraction);  
//        return mav;    
//    }


	//update
	@GetMapping("/updateAttraction")
	public String updateview(@RequestParam("attid") Integer attid, Model m) {
		Attraction selectByAttid= attractionService.selectByAttid(attid);
		m.addAttribute("selectByAttid", selectByAttid);	
		System.out.println("selectByAttid"+selectByAttid.getAttid());
		return "kangUpdateAttractionBackground"; 
	}
	
	@PostMapping("/updateAttraction")
	public String updateAction(@ModelAttribute("selectByAttid") Attraction attraction,Integer preferid,Model m) {
		System.out.println(attraction.getPreferid());
			attractionService.update(attraction,preferid);


		   List < Attraction > attractionAll = attractionService.selectByAttractionAll();
	        m.addAttribute("listAttraction", attractionAll);
	        return "kangListBackground";
	}

	//delete
	@RequestMapping(path = "/deleteAttraction",method = RequestMethod.GET)
	public String delete(@RequestParam("attid") Integer attid,Model m) {
		if(attid != null) {
			attractionService.delete(attid);
		}
		        List < Attraction > attractionAll = attractionService.selectByAttractionAll();
		        m.addAttribute("listAttraction", attractionAll);
		return"kangListBackground";
	}

}
