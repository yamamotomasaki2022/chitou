package tw.weber.room.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.weber.roomStyle.model.RoomStyle;

@Service
@Transactional
public class RoomBackService {
	
	@Autowired
	private RoomRepository rRepo;
	
	public int[] addRooms(int roomAmount,RoomStyle roomStyle) {
		int[] roomNumbers = new int[roomAmount];
		for(int i = 0; i < roomAmount ; i++) {
			Room room = new Room();
			room.setStyle(roomStyle);
			Room result = rRepo.save(room);
			roomNumbers[i-1] = result.getRoomID();
			System.out.println("new room:"+result.getRoomID());
		}
		return roomNumbers;
	}
	
//	public List<Room> findAll(){
//		return rRepo.findAll();
//	}
//	
//	public Room findById(int roomID){
//		Optional<Room> op = rRepo.findById(roomID);
//		return op.get();
//	}
//	
//	public Room insert(Room room) {
//		return rRepo.save(room);
//	}
//	
//	public Room update(Room room) {
//		return rRepo.save(room);
//	}
//	
//	public boolean delete(int roomID) {
//		rRepo.deleteById(roomID);
//		return true;
//	}
	
}
