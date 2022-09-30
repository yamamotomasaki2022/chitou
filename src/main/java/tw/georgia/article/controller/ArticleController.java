package tw.georgia.article.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.regex.Matcher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.georgia.article.model.Article;
import tw.georgia.article.model.ArticleService;
import tw.georgia.article.model.Category;


@Controller
public class ArticleController {
	
	@Autowired
	private ArticleService articleService;
	
	
	private String staticPath = getStaticPath();
	
	
	String mainUrl="http://localhost:8080/article.main";
	
	
//	寫絕對路徑辦法(圖片)
	private String getStaticPath() {
		String path = this.getClass().getClassLoader().getResource("").getPath();
		path = path.substring(1).replace("target", "src").replaceAll("classes", "main") + "webapp" + File.separator + "WEB-INF"
				+ File.separator + "resources" + File.separator + "images" + File.separator + "georgia" + File.separator + "picture";
		path = path.replaceAll("/", Matcher.quoteReplacement(File.separator));
		return path;
	}
	
//	**********文章首頁********************************************
	@RequestMapping(path = "/article.main",method = RequestMethod.GET)
	public String articleMain(Model m) {

		List<Article> list = articleService.findAll();
		m.addAttribute("list", list);
		//request.setAttribute("list",list);
		return "georgia/article/articleMain";
	}	
	
//	**********前往新增文章*********************************************
	@RequestMapping(path = "/article.new",method = RequestMethod.GET)
	public String newArticle() {
		return "georgia/article/articleCreate";
	}
//	**********前往新增文章*********************************************
	@RequestMapping(path = "/article.test",method = RequestMethod.GET)
	public String test() {
		return "georgia/article/NewFile";
	}
	
//	*********新增文章*************************************************
	@PostMapping(path = "/article.insert")
	public String insertArticle(
								@RequestParam("title") String title,
								@RequestParam("subtitle") String subtitle,
								@RequestParam("chooseCountry") String chooseCountry,
								@RequestParam("chooseType") String chooseType,
								@RequestParam("photo") MultipartFile mf,
								@RequestParam("content") String content) throws IllegalStateException, IOException {
		int categoryID = Integer.parseInt(chooseCountry+chooseType);
//		int countryID = Integer.parseInt(chooseCountry);
//		System.out.println(countryID);
		String photo = mf.getOriginalFilename();
		System.out.println(photo);
		String saveFileDir = staticPath;
        File saveFilePath = new File(saveFileDir, photo);
        mf.transferTo(saveFilePath);
		
		String date =DateTimeFormatter.ofPattern("yyyy/MM/dd").format(LocalDateTime.now());

		Category category = new Category();
		category.setCategoryID(categoryID);
//		category.setCountryID(countryID);
		
//		Category category, Integer posterID, String title, String subtitle, String photo, String content,String date		
		Article insertBean = new Article(category,title,subtitle,photo,content,date);
		
		articleService.insert(insertBean);
		return "redirect:"+mainUrl;
	}
	
//	*********前往更新文章*************************************************
	@RequestMapping(path = "/article.renew",method = RequestMethod.POST)
	public String renewArticle(@RequestParam("postID") int postID,Model m) {
		
		Article findByIdBean = articleService.findByID(postID);
		m.addAttribute("findByIdBean", findByIdBean);
		return "georgia/article/articleUpdate";
	}
	
//	*********更新文章*************************************************
	@PutMapping(path = "/article.update")
	public String updateArticle(@RequestParam("postID") int postID,
								@RequestParam("posterID") int posterID,
								@RequestParam("title") String title,
								@RequestParam("subtitle") String subtitle,
								@RequestParam("chooseCountry") String chooseCountry,
								@RequestParam("chooseType") String chooseType,
								@RequestParam("photo") MultipartFile mf,
								@RequestParam("content") String content,
								@RequestParam("date") String date) throws IllegalStateException, IOException {
		int categoryID = Integer.parseInt(chooseCountry+chooseType);
//		int countryID = Integer.parseInt(chooseCountry);
		
		Category category = new Category();
		category.setCategoryID(categoryID);
//		category.setCountryID(countryID);
		
		String photo = mf.getOriginalFilename();
		System.out.println(photo);
		String saveFileDir = staticPath;
        File saveFilePath = new File(saveFileDir, photo);
        mf.transferTo(saveFilePath);
		
		Article updateBean = new Article(category,postID,posterID,title,subtitle,photo,content,date);
		articleService.update(updateBean);
		return "redirect:"+mainUrl;
	}
	
//	*********刪除文章*************************************************
	@DeleteMapping(path = "/article.delete")
	public String deleteArticle(@RequestParam("postID") int postID) {
//		Article deleteBean=new Article();
		articleService.delete(postID);
		return "redirect:"+mainUrl;
	}
	
//	*********查詢*************************************************
	@RequestMapping(path = "/article.read",method = RequestMethod.POST)
	public String readArticle(@RequestParam("chooseCountry") String chooseCountry,
								@RequestParam("chooseType") String chooseType,
								Model m) {
		if (chooseType == "") {
			int countryID = Integer.parseInt(chooseCountry);
			List<Article> searchBean = articleService.findCountry(countryID);
			m.addAttribute("searchBean", searchBean);
		}else {
			int categoryID = Integer.parseInt(chooseCountry+chooseType);
			List<Article> searchBean = articleService.findType(categoryID);
			m.addAttribute("searchBean", searchBean);
		}
		return "georgia/article/articleRead";
	}
	
	
//	*********顯示文章頁面*************************************************
	@RequestMapping(path = "/article.show",method = RequestMethod.POST)
	public String showArticle(@RequestParam("postID") int postID,
								Model m) {
		Article findByID = articleService.findByID(postID);
		m.addAttribute("findByID", findByID);
		
		return "georgia/article/articleDetail";
	}
	
}
