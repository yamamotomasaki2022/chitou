package tw.georgia.article.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.georgia.article.model.Article;
import tw.georgia.article.model.ArticleService;

@Controller
public class ArticleController {
	
	@Autowired
	private ArticleService articleService;
	
	String mainUrl="http://localhost:8080/article.main";


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
	
//	*********新增文章*************************************************
	@PostMapping(path = "/article.insert")
	public String insertArticle(@RequestParam("posterID") int posterID,
								@RequestParam("title") String title,
								@RequestParam("chooseCountry") String chooseCountry,
								@RequestParam("chooseType") String chooseType,
								@RequestParam("photo") String photo,
								@RequestParam("content") String content) {
		System.out.println(content);
		int typeID = Integer.parseInt(chooseCountry+chooseType);
		int countryID = Integer.parseInt(chooseCountry);
		String date =DateTimeFormatter.ofPattern("yyyy/MM/dd").format(LocalDateTime.now());
		//int posterID, int countryID, int typeID, String title, String content, String date, String photo
		Article insertBean = new Article(posterID,countryID,typeID,title,content,date,photo);
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
								@RequestParam("chooseCountry") String chooseCountry,
								@RequestParam("chooseType") String chooseType,
								@RequestParam("title") String title,
								@RequestParam("content") String content,
								@RequestParam("date") String date,
								@RequestParam("photo") String photo) {
		System.out.println(date);
		int typeID = Integer.parseInt(chooseCountry+chooseType);
		int countryID = Integer.parseInt(chooseCountry);
		Article updateBean = new Article(postID,posterID,countryID,typeID,title,content,date,photo);
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
			int typeID = Integer.parseInt(chooseCountry+chooseType);
			List<Article> searchBean = articleService.findType(typeID);
			m.addAttribute("searchBean", searchBean);
		}
		return "georgia/article/articleRead";
	}
}
