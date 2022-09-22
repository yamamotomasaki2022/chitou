package tw.cocokang.attraction.util;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

public class UploadFileHelper {
	
	public static String upload(ServletContext servletContext,MultipartFile multipartFile) {
		try {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHss");
			String fileName =simpleDateFormat.format(new Date())+multipartFile.getOriginalFilename();
			Path path =Paths.get(servletContext.getRealPath("/WEB-INF/resources/images/coco/"+ fileName));
			Files.write(path,multipartFile.getBytes());
			return fileName;
		} catch (Exception e) {
			return null;
		}
	}
}
