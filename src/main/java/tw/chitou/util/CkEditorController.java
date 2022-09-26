package tw.chitou.util;

import java.io.File;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.util.Enumeration;
import java.util.Iterator;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class CkEditorController {
	
	private String parentFolder = ".//src//main//webapp//WEB-INF//resources//images//";
	private String urlSuffix = "/images/";
	
	public CkResponse uploadImage(MultipartFile upload,String folderName) throws IllegalStateException, IOException {
		String fileName = folderName + "/" + System.currentTimeMillis() + upload.getName() + ".jpg";
		String filePath = parentFolder + fileName;
		File realFile = new File(filePath).getAbsoluteFile();
		upload.transferTo(realFile);
		CkResponse response = new CkResponse();
		response.setUploaded("true");
		response.setUrl(urlSuffix + fileName);
		return response;
	}
	
	@PostMapping(path = "/ckUploadCoco")
	public CkResponse uploadimageCoco(@RequestParam("upload")MultipartFile upload) throws IllegalStateException, IOException {
		return uploadImage(upload, "coco");
	}
	
	@PostMapping(path = "/ckUploadGeorgia")
	public CkResponse uploadimageGeogia(@RequestParam("upload")MultipartFile upload) throws IllegalStateException, IOException {
		return uploadImage(upload, "georgia//ckPics");
	}
	
}
