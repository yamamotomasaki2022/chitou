package tw.weber.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.cocokang.attraction.util.UploadFileHelper;

@Controller
public class CkeditorController {
	
	private UploadFileHelper fileHelper = new UploadFileHelper();
	
	@GetMapping(path = "/yeeee")
	@ResponseBody
	public String upload(@RequestParam("yee")String yee) {
		return yee;
	}
	
	@GetMapping(path = "/paaa")
	@ResponseBody
	public String uploadimage() {
		
	}
}
