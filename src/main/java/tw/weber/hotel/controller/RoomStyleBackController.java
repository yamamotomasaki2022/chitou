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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.weber.hotel.model.BookSearch;
import tw.weber.hotel.model.Hotel;
import tw.weber.hotel.model.Reservation;
import tw.weber.hotel.model.Room;
import tw.weber.hotel.model.RoomStyle;
import tw.weber.hotel.model.RoomStyleBackService;



@Controller
@SessionAttributes({"hotelResult"})
@RequestMapping(path = "/admin")
public class RoomStyleBackController {
	
	@Autowired
	private RoomStyleBackService styleService;
	
	private String suffix = "weber/room/";
	private String roomMainPage = suffix + "RoomStyleMain";  
	private String returnRoom = "redirect:/admin/room" ;
	private String insertPage = suffix + "RoomStyleInsert";
	private String updatePage = suffix +"RoomStyleUpdate";
	
	@GetMapping(path = "/room")
	public String SearchAllroom(Model model) {
		Hotel hotel = (Hotel)model.getAttribute("hotelResult");
		System.err.println("hotelID:"+hotel.getHotelID());
		List<RoomStyle> result = styleService.findAllByHotelID(hotel.getHotelID());
		model.addAttribute("result",result);
		return roomMainPage;
	}	
	
	@GetMapping(path = "/searchRoom")
	public String SearchByKey(@RequestParam("type")String type,@RequestParam("keyword")String keyword,Model model) {
		List<RoomStyle> result = styleService.selectByKey(type,keyword);
		
		model.addAttribute("result",result);
		
		return roomMainPage;
	}	
	
	@GetMapping(path = "/insertStylePage")
	public String insertRoomPage(Model m) {
		RoomStyle style = new RoomStyle();
		m.addAttribute("style",style);
		return insertPage;
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
		
		return returnRoom;
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
		return updatePage;
	}
	
	@PostMapping(path = "/updateStyle")
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
		
		return returnRoom;
	}
	
	@PostMapping(path = "/deleteStyle")
	public String deleteroom(@RequestParam("styleID")int styleID) {
		styleService.delete(styleID);
		return returnRoom ;
	}
	
	@GetMapping(path = "/ajax/roomData/{hotelID}")
	@ResponseBody
	public List<RoomStyle> allDataForAjax(@PathVariable("hotelID")int hotelID) {
		List<RoomStyle> result = styleService.findAllByHotelID(hotelID);
		return result;
	}
	
	@GetMapping(path = "/searchRoomStatus")
	@ResponseBody
	public List<Room> searchRoomStatus(int styleID){
		return styleService.getRoomList(styleID);
	}
	
	@GetMapping(path = "/searchRoomStatusByDate")
	@ResponseBody
	public List<BookSearch> searchRoomStatusByDate(int styleID,String date){
		return styleService.getRoomStatusByDate(styleID, date);
	}
	
	@GetMapping(path = "/searchRoomStatusByRoomID")
	@ResponseBody
	public Reservation searchRoomStatusByRoomID(int roomID,String date) {
		return styleService.getReservationByDateAndRoom(roomID, date);
	}
//	@GetMapping(path = "search")
	
	
	
//	@GetMapping(path = "/roomAjax")
//	@ResponseBody
//	public List<room> allDataForAjax() {
//		List<room> result = roomBackService.selectAll();
//		return result;
//	}
}
