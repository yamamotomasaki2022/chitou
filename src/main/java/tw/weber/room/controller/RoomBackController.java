package tw.weber.room.controller;

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

import tw.weber.roomStyle.model.RoomStyleBackService;
import tw.weber.roomStyle.model.RoomStyle;



@Controller
public class RoomBackController {
	
	@Autowired
	private RoomStyleBackService rsService;
	
	@GetMapping(path = "/room")
	public String SearchAllroom(@RequestParam("hotelID")int hotelID,Model model) {
		List<RoomStyle> result = rsService.findAllByHotelID(hotelID);
		model.addAttribute("hotelID",hotelID);
		model.addAttribute("result",result);
		
		return "weber/room/roomMain";
	}	
	
	@GetMapping(path = "/searchRoom")
	public String SearchByKey(@RequestParam("type")String type,@RequestParam("keyword")String keyword,Model model) {
		List<RoomStyle> result = rsService.selectByKey(type,keyword);
		
		model.addAttribute("result",result);
		
		return "weber-room";
	}	
	
	@GetMapping(path = "/insertRoomPage")
	public String insertRoomPage(Model m) {
		RoomStyle room = new RoomStyle();
		m.addAttribute("room",room);
		return "weber-newRoom";
	}
	
	@PostMapping(path = "/insertRoom")
	public String insertroom(@ModelAttribute("room")RoomStyle room) {
		rsService.insert(room);
		return "redirect:room";
	}
	
	@PostMapping(path = "/toUpdateRoom")
	public String updateroomPage(@RequestParam("roomID")int roomID,Model m) {
		RoomStyle result = rsService.findById(roomID);
		
		m.addAttribute("result",result);
		
		return "weber-updateRoom";
	}
	
	@DeleteMapping(path = "/deleteRoom")
	public String deleteroom(@RequestParam("roomID")int roomID) {
		rsService.delete(roomID);
		return "redirect:room" ;
	}
	
	@PutMapping(path = "/updateRoom")
	public String updateroom(@ModelAttribute("room")RoomStyle room) {
		rsService.update(room);
		
		return "redirect:room";
	}
	
	@GetMapping(path = "/ajax/roomData/{hotelID}")
	@ResponseBody
	public List<RoomStyle> allDataForAjax(@PathVariable("hotelID")int hotelID) {
		System.out.println("進來了");
		List<RoomStyle> result = rsService.findAllByHotelID(hotelID);
		return result;
	}
	
//	@GetMapping(path = "/roomAjax")
//	@ResponseBody
//	public List<room> allDataForAjax() {
//		List<room> result = roomBackService.selectAll();
//		return result;
//	}
}
