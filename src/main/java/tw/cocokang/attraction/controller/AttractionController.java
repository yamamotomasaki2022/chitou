package tw.cocokang.attraction.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import tw.cocokang.attraction.model.Attraction;
import tw.cocokang.attraction.model.AttractionService;
import tw.cocokang.attraction.model.Hobbyclassification;
import tw.cocokang.attraction.util.JSONFileUpload;
import tw.cocokang.attraction.util.UploadFileHelper;

//@Controller
public class AttractionController implements ServletContextAware{
	
	private ServletContext servletContext;
	
	@Autowired
	private AttractionService aService;

	public String path = "coco/attraction/";

	@GetMapping("/listAttractions")
	public String AttractionListAction(Model m) {
		m.addAttribute("listAttraction", aService.getAll());
//		return path + "kangListBackground";
		return path + "kangListView";
	}

//	insert
	@GetMapping("/addAttraction")
	public String insertview(Model m) {
		Attraction attraction = new Attraction();
		m.addAttribute("attraction", attraction);
//		return path + "kangInsertAttractionBackground";
		return path + "kangNEWInsertAttractionBackground";
	}

	@PostMapping("/addAttractionAction")
	public String insert(@ModelAttribute("attraction") Attraction attraction, Integer preferid, Model m) {
		  Hobbyclassification hobbyclassification = new Hobbyclassification();
		  hobbyclassification.setPreferid(attraction.getPreferid());
		  attraction.setHobbyclassification(hobbyclassification);
		  

		m.addAttribute("attraction", attraction);
		aService.insert(attraction);

		List<Attraction> attractionAll = aService.getAll();
		m.addAttribute("listAttraction", attractionAll);
		return path + "kangListBackground";
	}
	
	// Upload Image
		@RequestMapping(method = RequestMethod.GET)
		public String uploadImage() {
			return  path +"addAttractionAction"; 
		}
		
		@RequestMapping(value = "upload_ckeditor", method= RequestMethod.POST,produces = {
				MimeTypeUtils.APPLICATION_JSON_VALUE
		} )
		public ResponseEntity<JSONFileUpload> UploadCKEditor(@RequestParam("upload")MultipartFile upload){
			try {
				String fileName= UploadFileHelper.upload(servletContext, upload);
				return new ResponseEntity<JSONFileUpload>(new JSONFileUpload("/WEB-INF/resources/images/coco/"+fileName), HttpStatus.OK);
			} catch (Exception e) {
			return new ResponseEntity<JSONFileUpload>(HttpStatus.BAD_REQUEST);
			}
		}
		
		@Override
		public void setServletContext(ServletContext servletContext) {
			this.servletContext =servletContext;
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
