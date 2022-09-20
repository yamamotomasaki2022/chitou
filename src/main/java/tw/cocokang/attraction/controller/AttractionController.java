package tw.cocokang.attraction.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import tw.cocokang.attraction.model.Attraction;
import tw.cocokang.attraction.model.AttractionService;

@Controller
public class AttractionController {
	
    @Autowired
	private AttractionService aService;
    
    
    @GetMapping("/listAttractions")
    public String AttractionListAction(Model m) {
        m.addAttribute("listAttraction", aService.getAll());
        return "kangListBackground";
    }
//	insert
    @GetMapping("/addAttraction")
    public String insertview(Model m) {
    	Attraction attraction = new Attraction();
        m.addAttribute("attraction", attraction);
        return "kangInsertAttractionBackground";
    }

    @PostMapping("/addAttractionAction")
//    public String insert(@ModelAttribute("attraction") Attraction attraction,Integer preferid,Model m) {
//		m.addAttribute("attraction", attraction);
//    	aService.insert(attraction, preferid);
//        return "redirect:/";
//    }
    	public String insert(@ModelAttribute("attraction") Attraction attraction,Integer preferid,Model m){    
		m.addAttribute("attraction", attraction);
//		return "attraction";	
		aService.insert(attraction,preferid);    

        List < Attraction > attractionAll = aService.getAll();
        m.addAttribute("listAttraction", attractionAll);
        return "kangListBackground";
    }    

	//update
    @GetMapping("/updateAttraction/{attid}")
	public String updateview(@RequestParam("attid") Integer attid, Model m) {
		Attraction selectByAttid= aService.selectByAttid(attid);
		m.addAttribute("selectByAttid", selectByAttid);	
//		System.out.println("selectByAttid"+selectByAttid.getAttid());
		return "kangUpdateAttractionBackground"; 
	}
    
	@PostMapping("/updateAttraction")
	public String updateAction(@ModelAttribute("selectByAttid") Attraction attraction,Integer preferid,Model m) {
//		System.out.println(attraction.getPreferid());
		aService.update(attraction,preferid);

		   List < Attraction > attractionAll = aService.getAll();
	        m.addAttribute("listAttraction", attractionAll);
	        return "kangListBackground";
	}
	//delete
	@GetMapping("/deleteAttraction")
	public String delete(@RequestParam("attid") Integer attid,Model m) {
		if(attid != null) {
			aService.delete(attid);
		}
		        List < Attraction > attractionAll = aService.getAll();
		        m.addAttribute("listAttraction", attractionAll);
		return"kangListBackground";
	}


  //Get Attraction By attName
    
//	@PostMapping("/searchAttraction")
//	public String selectbyname(@RequestParam("search")String attName, Model m) {
//    	Attraction attraction = aService.findByattNameLike(attName);
//    	m.addAttribute("attraction", attraction);
//    	return "kangSelectBackground";
//}
    @RequestMapping(path="/searchAttraction", method=RequestMethod.POST)
	public String selectbyname(@RequestParam("search")String attName, Model m) {
    	Attraction attraction = aService.findByattNameLike(attName);
    	m.addAttribute("attraction", attraction);
    	return "kangSelectBackground";
}

}
