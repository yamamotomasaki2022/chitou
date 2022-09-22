package tw.weber.hotel.model;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
@Transactional
public class HotelBackService {
	
	@Autowired
	private HotelRepository hRepo;
	
	//C:\Users\weber\AppData\Local\Temp\tomcat.8080.3056583608791830196\work\Tomcat\localhost\ROOT\.\src\main\webapp\WEB-INF\resources\images\hotelNB9\hotelPhotos\260.jpg 
	private String photoFolder = ".//src//main//webapp//WEB-INF//resources//images//weber//hotel//";
	
	public List<Hotel> findAll(){
		return hRepo.findAll();
	}
	
	public Hotel findById(int hotelID){
		Optional<Hotel> op = hRepo.findById(hotelID);
		return op.get();
	}
	
	public List<Hotel> selectByKey(String type,String keyword){
		if(type.equals("hotelID")) {
			return hRepo.findAllByHotelIDContaining(keyword);
		}else if(type.equals("name")) {
			return hRepo.findAllByNameContaining(keyword);
		}else if(type.equals("address")) {
			return hRepo.findAllByAddressContaining(keyword);
		}else if(type.equals("type")) {
			return hRepo.findAllByTypeContaining(keyword);
		}else if(type.equals("intro")) {
			return hRepo.findAllByIntroContaining(keyword);
		}else if(type.equals("country")) {
			return hRepo.findAllByCountryContaining(keyword);
		}else if(type.equals("phone")) {
			return hRepo.findAllByPhoneContaining(keyword);
		}else if(type.equals("status")) {
			return hRepo.findAllByStatusContaining(keyword);
		}else if(type.equals("capacity")) {
			return hRepo.findAllByCapacity(keyword);
		}else if(type.equals("owner")) {
			return hRepo.findAllByOwnerContaining(keyword);
		}else if(type.equals("averagePrice")) {
			return hRepo.findAllByAveragePriceContaining(keyword);
		}
		return null;
	}
	
	public Hotel insert(Hotel hotel) {
		return hRepo.save(hotel);
	}
	
	public boolean delete(int hotelID) {
		hRepo.deleteById(hotelID);
		deletePhotoFolder(hotelID);
		return true;
	}
	
	public Hotel update(Hotel hotel) {
		return hRepo.save(hotel);
	}
	
	public boolean insertPhoto(int hotelID,MultipartFile[] mfiles) throws IllegalStateException, IOException {
		File parentDir = new File(photoFolder + "hotelNB" + hotelID);
		if(!parentDir.exists()) {
			parentDir.mkdirs();
		}
		int j = 1;
		for(MultipartFile file:mfiles) {
			String searchFileExist = parentDir+"/photo"+j+".jpg";
			File photo = new File(searchFileExist).getAbsoluteFile();
			while(photo.exists()) {
				System.out.println("photo"+j+" is exist");
				j++;
				searchFileExist = parentDir+"/photo"+j+".jpg";
				photo = new File(searchFileExist).getAbsoluteFile();
			}
			file.transferTo(photo);
			j++;
		}

		return true;
	}
	
	public int loadPhoto(int hotelID) {
		File parentDir = new File(photoFolder + "hotelNB" + hotelID);
		int i = 0;
		if(parentDir.exists()) {
			File[] files = parentDir.listFiles();
			for(File file:files) {
				i++;
				System.out.println(i);
			}
//			while(true) {
//				String filePath = parentDir+"/photo"+(i+1)+".jpg";
//				File photo = new File(filePath).getAbsoluteFile();
//				if(!photo.exists()) {
//					break;
//				}
//				i++;
//			}
		}
		return i;
	}
	
	public boolean deletePhotoFolder(int hotelID) {
		File parentDir = new File(photoFolder + "hotelNB" + hotelID);
		if(parentDir.exists()) {
			File[] files = parentDir.listFiles();
			for(File file:files) {
				System.out.println("刪除檔案:"+file.getName()+"結果"+file.delete());
			}
			return parentDir.delete();
		}
		return false;
	}
}
