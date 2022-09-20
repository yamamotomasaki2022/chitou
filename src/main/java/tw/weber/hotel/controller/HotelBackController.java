package tw.weber.hotel.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.weber.hotel.model.Hotel;
import tw.weber.hotel.model.HotelBackService;



@Controller
public class HotelBackController {
	
	@Autowired
	private HotelBackService hService;
	
	@GetMapping(path = "/hotel")
	public String SearchAllHotel(Model model) {
		List<Hotel> result = hService.findAll();
		
		model.addAttribute("result",result);
		
		return "weber/hotel/hotelMain";
	}	
	
	@GetMapping(path = "/searchHotel")
	public String SearchByKey(@RequestParam("type")String type,@RequestParam("keyword")String keyword,Model model) {
		List<Hotel> result = hService.selectByKey(type,keyword);
		
		model.addAttribute("result",result);
		
		
		return "weber/hotel/hotelMain";
	}	
	
	@GetMapping(path = "/insertHotelPage")
	public String insertHotelPage(Model m) {
		Hotel hotel = new Hotel();
		m.addAttribute("hotel",hotel);
		return "weber/hotel/newHotel";
	}
	
	@PostMapping(path = "/insertHotel")
	public String insertHotel(@ModelAttribute("hotel")Hotel hotel,@RequestParam("upload")MultipartFile[] mfiles) throws IOException {
		
		Hotel result = hService.insert(hotel);
//		hService.insertPhoto(hotel.getHotelID(), mfiles);
		if(!mfiles[0].isEmpty()) {
			hService.insertPhoto(result.getHotelID(), mfiles);
		}else {
			System.out.println("沒有照片");
		}
		
		return "redirect:hotel";
	}
	
	@PostMapping(path = "/toUpdateHotel")
	public String updateHotelPage(@RequestParam("hotelID")int hotelID,Model m) {
		Hotel result = hService.findById(hotelID);
		m.addAttribute("hotelID",hotelID);
		m.addAttribute("result",result);
		
		return "weber/hotel/updateHotel";
	}
	
	@DeleteMapping(path = "/deleteHotel")
	public String deleteHotel(@RequestParam("hotelID")int hotelID) {
		hService.delete(hotelID);
		boolean result = hService.deletePhotoFolder(hotelID);
		System.out.println("刪除目錄結果:"+result);
		return "redirect:hotel" ;
	}
	
	@PutMapping(path = "/updateHotel")
	public String updateHotel(@ModelAttribute("hotel")Hotel hotel,@RequestParam("upload")MultipartFile[] mfiles) throws IllegalStateException, IOException {
		System.out.println("修改:hotelID"+hotel.getHotelID());
		if(!mfiles[0].isEmpty()) {
			hService.insertPhoto(hotel.getHotelID(), mfiles);
		}else {
			System.out.println("沒有照片");
		}
		
		hService.update(hotel);
		
		return "redirect:hotel";
	}
	
//	@GetMapping(path = "/hotelAjax/{hotelID}")
//	@ResponseBody
//	public Hotel allDataForAjax(@PathVariable("hotelID")int hotelID) {
//		Hotel result = hService.findById(hotelID);
//		return result;
//	}
	
	@GetMapping(path = "/loadHotelPhotoAjax/{hotelID}")
	@ResponseBody
	public String loadPhoto(@PathVariable("hotelID")int hotelID) {
		int amount = hService.loadPhoto(hotelID);
		return Integer.toString(amount);
	}

}
