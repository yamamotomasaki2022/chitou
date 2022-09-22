package tw.weber.hotel.controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.weber.hotel.model.Hotel;
import tw.weber.hotel.model.RoomStyle;
import tw.weber.hotel.model.RoomStyleBackService;



@Controller
@SessionAttributes({"hotelResult"})
public class RoomStyleBackController {
	
	@Autowired
	private RoomStyleBackService styleService;
	
	@GetMapping(path = "/room")
	public String SearchAllroom(Model model) {
		Hotel hotel = (Hotel)model.getAttribute("hotelResult");
		System.err.println("hotelID:"+hotel.getHotelID());
		List<RoomStyle> result = styleService.findAllByHotelID(hotel.getHotelID());
		model.addAttribute("result",result);
		return "weber/room/roomStyleMain";
	}	
	
	@GetMapping(path = "/searchRoom")
	public String SearchByKey(@RequestParam("type")String type,@RequestParam("keyword")String keyword,Model model) {
		List<RoomStyle> result = styleService.selectByKey(type,keyword);
		
		model.addAttribute("result",result);
		
		return "weber-room";
	}	
	
	@GetMapping(path = "/insertStylePage")
	public String insertRoomPage(Model m) {
		RoomStyle style = new RoomStyle();
		m.addAttribute("style",style);
		return "weber/room/newRoomStyle";
	}
	
	@PostMapping(path = "/insertStyle")
	public String insertroom(@ModelAttribute("room")RoomStyle style,@RequestParam("roomAmount")int roomAmount,
			@RequestParam("upload")MultipartFile[] mfiles,Model model) throws IllegalStateException, IOException {
		System.out.println("確認接值"+style.getName()+","+roomAmount);
		Hotel hotel = (Hotel)model.getAttribute("hotelResult");
		style.setHotel(hotel);
		style.setRoomAmount(roomAmount);
		RoomStyle result = styleService.insert(style);
		if(!mfiles[0].isEmpty()) {
			styleService.insertPhoto(result.getStyleID(), mfiles);
		}else {
			System.out.println("沒有照片");
		}
		
		return "redirect:room";
	}
	
	@PostMapping(path = "/toUpdateStyle")
	public String updateRoomPage(@RequestParam("styleID")int styleID,Model m) {
		RoomStyle result = styleService.findById(styleID);
		int count = styleService.countPhotos(styleID);
		System.out.println("有"+count+"張照片");
		int roomCount = styleService.countRooms(result);
		System.out.println("有"+roomCount+"間房間");
		result.setRoomAmount(roomCount);
		m.addAttribute("style",result);
		m.addAttribute("photoCount",count);
		return "weber/room/updateRoomStyle";
	}
	
	@PutMapping(path = "/updateStyle")
	public String updateHotel(@ModelAttribute("Style")RoomStyle style,
			@RequestParam("upload")MultipartFile[] mfiles,Model model) throws IllegalStateException, IOException {
		
		System.out.println("修改:sylteID"+style.getStyleID());
		if(!mfiles[0].isEmpty()) {
			styleService.insertPhoto(style.getStyleID(), mfiles);
		}else {
			System.out.println("沒有新增照片");
		}
		Hotel hotel = (Hotel)model.getAttribute("hotelResult");
		style.setHotel(hotel);
		
		styleService.update(style);
		
		return "redirect:room";
	}
	
	@DeleteMapping(path = "/deleteStyle")
	public String deleteroom(@RequestParam("styleID")int styleID) {
		styleService.delete(styleID);
		return "redirect:room" ;
	}
	
	@GetMapping(path = "/ajax/roomData/{hotelID}")
	@ResponseBody
	public List<RoomStyle> allDataForAjax(@PathVariable("hotelID")int hotelID) {
		List<RoomStyle> result = styleService.findAllByHotelID(hotelID);
		return result;
	}
	
//	@GetMapping(path = "/roomAjax")
//	@ResponseBody
//	public List<room> allDataForAjax() {
//		List<room> result = roomBackService.selectAll();
//		return result;
//	}
}
