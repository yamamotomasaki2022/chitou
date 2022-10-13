package tw.cocokang.attraction.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.regex.Matcher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.cocokang.attraction.model.Attraction;
import tw.cocokang.attraction.model.AttractionService;
import tw.cocokang.attraction.model.Hobbyclassification;
import tw.cocokang.attraction.model.Pricingplan;

@Controller
public class AttractionController {

	@Autowired
	private AttractionService aService;

	public String path = "coco/attraction-background/";
	public String path1 = "coco/attraction-user/";
	public String planPath = "coco/attractionplan/";
	
	 //--------------------Attraction
	//總覽
	@GetMapping("/listAttractions")
	public String AttractionListAction(Model m) {
		m.addAttribute("listAttraction", aService.getAll());
		return path + "kangListView";
	}
	
	@GetMapping("/AttractionList")
	public String AttractionListActionk(Model m) {
		m.addAttribute("listAttraction", aService.getAll());
		return path1 + "AttractionList";
	}
	
	//景點說明
	@GetMapping("/Attractions")
	public String AttractionListAction4(Model m) {
		m.addAttribute("listAttraction", aService.getAll());
		return path1 + "Attraction";
	}
	
	//test home background home page
//	@GetMapping("/homeAttractions")
//	public String AttractionListAction1(Model m) {
//		return "BackgroundHomePage";
//	}
	@GetMapping("/homeAttractions")
	public String AttractionListAction2(Model m) {
		return "NewHome";
	}
	@GetMapping("/beforehome")
	public String AttractionListAction3(Model m) {
		return "Home";
	}
	//weihan
	@GetMapping("/newHotelsStyle")
	public String AttractionListActionwei(Model m) {
		return "HotelsStyle";
	}
	@GetMapping("/newHotelsList")
	public String AttractionListActionwei1(Model m) {
		return "HotelsList";
	}
	@GetMapping("/newHotelsOrder")
	public String AttractionListActionwei2(Model m) {
		return "HotelsOrder";
	}
//Jacky 
	@GetMapping("/newAdminCreateAdmin")
	public String AttractionListActionma1(Model m) {
		return "AdminCreateAdmin";
	}
	
	@GetMapping("/newAdminCreateMember")
	public String AttractionListActionma2(Model m) {
		return "AdminCreateMember";
	}
	
	@GetMapping("/newAdminModifyMemberPage")
	public String AttractionListActionma4(Model m) {
		return "AdminModifyMemberPage";
	}
	@GetMapping("/newMemberChangePassword")
	public String AttractionListActionma5(Model m) {
		return "MemberChangePassword";
	}
	@GetMapping("/newMemberRegisterPage")
	public String AttractionListActionma7(Model m) {
		return "MemberRegisterPage";
	}
	@GetMapping("/MemberHomePage")
	public String AttractionListActionma(Model m) {
		return "MemberHomePage";
	}
//	//undone
//	@GetMapping("/newMemberChangePassword")
//	public String AttractionListActionma6(Model m) {
//		return "MemberChangePassword";
//	}
	@GetMapping("/newAdminModifyAdminPage")
	public String AttractionListActionma3(Model m) {
		return "AdminModifyAdminPage";
	}
	
	
	//	寫絕對路徑辦法(圖片)
	private String getStaticPath() {
		String path = this.getClass().getClassLoader().getResource("").getPath();
		path = path.substring(1).replace("target", "src").replaceAll("classes", "main") + "webapp" + File.separator + "WEB-INF"
				+ File.separator + "resources" + File.separator + "images" + File.separator + "coco" + File.separator + "attractionpicture";
		path = path.replaceAll("/", Matcher.quoteReplacement(File.separator));
		return path;
	}
	
	
//	insert Attraction
	@GetMapping("/addAttraction")
	public String insertview(Model m) {
		Attraction attraction = new Attraction();
		m.addAttribute("attraction", attraction);
		return path + "kangNEWInsertAttractionBackground";
	}

	@PostMapping("/addAttractionAction")
	public String insert(@ModelAttribute("attraction") Attraction attraction,
			@RequestParam("photoo")MultipartFile mf,
			Integer preferid, Model m) throws IllegalStateException, IOException {
		  Hobbyclassification hobbyclassification = new Hobbyclassification();
		  hobbyclassification.setPreferid(preferid);
		  
		  attraction.setHobbyclassification(hobbyclassification);
			String photo = mf.getOriginalFilename();
			String saveFileDir = getStaticPath();
//	        File saveFilePath = new File(saveFileDir, photo);
//	        mf.transferTo(saveFilePath); 
		  attraction.setPhoto(photo);
		m.addAttribute("attraction", attraction);
		aService.insert(attraction,preferid);

		List<Attraction> attractionAll = aService.getAll();
		m.addAttribute("listAttraction", attractionAll);
		return path + "kangListView";
	}
		

	// update Attraction
	@GetMapping("/updateAttraction")
	public String updateview(@RequestParam("attid") Integer attid, Model m) {
		Attraction selectByAttid = aService.selectByAttid(attid);
		m.addAttribute("selectByAttid", selectByAttid);
		return path + "kangNEWUpdateAttractionBackground";
	}

	@PostMapping("/updateAttraction")
	public String updateAction(@ModelAttribute("selectByAttid") Attraction attraction,
			@RequestParam("photoo")MultipartFile mf,
			Integer preferid, Model m) throws IllegalStateException, IOException {
		  Hobbyclassification hobbyclassification = new Hobbyclassification();
		  hobbyclassification.setPreferid(attraction.getPreferid());
		  
		  attraction.setHobbyclassification(hobbyclassification);
		  
		  String photo = mf.getOriginalFilename();
			String saveFileDir = getStaticPath();
	        File saveFilePath = new File(saveFileDir, photo);
	        if(!mf.isEmpty()) {
	        	mf.transferTo(saveFilePath); 
	        	attraction.setPhoto(photo);
	        }else {
	        	Attraction originbean = aService.selectByAttid(attraction.getAttid());
	        	String origin = originbean.getPhoto();
	        	attraction.setPhoto(origin);
	        }
		m.addAttribute("attraction", attraction);
		  
		  System.out.println(attraction.getAttDescription());
		  aService.update(attraction, preferid);

		List<Attraction> attractionAll = aService.getAll();
		m.addAttribute("listAttraction", attractionAll);
		return path + "kangListView";
	}

	// delete Attraction
	@GetMapping("/deleteAttraction")
	public String delete(@RequestParam("attid") Integer attid, Model m) {
		if (attid != null) {
			aService.delete(attid);
		}
		List<Attraction> attractionAll = aService.getAll();
		m.addAttribute("listAttraction", attractionAll);
		return path + "kangListView";
	}

	// Get Attraction By attName
	@PostMapping("/searchAttraction")
	public String selectbyname(@RequestParam("search") String attName, Model m) {
		List<Attraction> attraction = aService.findAttractionsAction(attName);
		m.addAttribute("attraction", attraction);
		return path + "kangNEWSelectBackground";
	}


	//詳細內文
	@RequestMapping(path ="/showView",method = RequestMethod.GET )
	public String showDescription(@RequestParam("attid") Integer attid,Model m) {
		Attraction selectByAttid =aService.selectByAttid(attid);
		m.addAttribute("selectByAttid", attid);
		return path + "kangshowDescription";
	}
	
	 //--------------------Pricing plan

	//顯示景點內方案
	@RequestMapping(path = "showAttractionPlans",params = {"attractionid"}, method = RequestMethod.GET)
	public String attractionPlans(@RequestParam("attractionid") Integer attractionid ,Model m){
		Attraction attraction = aService.selectByAttid(attractionid);
		List<Pricingplan> listPlan = aService.showPricingplans(attraction);
		m.addAttribute("listPlan",listPlan);
		m.addAttribute("attraction",attraction);
		return "coco/attractionplan/ListView";
	}
	//跳轉到新增方案
	@GetMapping(path = "/toAddPlan")
	public String addPlan(Model m,int attractionid) {
		m.addAttribute("attractionid",attractionid);
		return planPath + "PlanAdd"; 
	}
	
	//執行新增方案
	@PostMapping(path = "/addPricingPlanAction")
	public String addPricingPlanAction(@ModelAttribute Pricingplan pricingplan,int attractionid) {
		aService.insertPlan(pricingplan,attractionid);
		return "redirect:showAttractionPlans?attractionid="+attractionid;
	}
	
	//跳轉到更新方案
	@GetMapping(path = "/toUpdatePlan")
	public String toUpdatePlan(@RequestParam int planID,Model m) {
		Pricingplan plan = aService.getSinglePlan(planID);
		m.addAttribute("plan",plan);
		return planPath + "PlanUpdate";
	}
	
	//執行更新方案
	@PostMapping(path = "updatePlanAction")
	public String updatePlanAction(@ModelAttribute Pricingplan plan) {
		aService.updatePlan(plan, plan.getAttractionid());
		return "redirect:showAttractionPlans?attractionid="+plan.getAttractionid();
	}
	
	//刪除方案
	@PostMapping(path = "deletePlan")
	public String deletePlan(@RequestParam int planid,@RequestParam int attractionid) {
		aService.deletePlan(planid);
		return "redirect:showAttractionPlans?attractionid="+attractionid;
	}
}
