package tw.georgia.article.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.georgia.article.model.Article;
import tw.georgia.article.model.ArticleService;
import tw.georgia.article.model.Category;
import tw.georgia.article.model.CategoryService;
import tw.georgia.article.model.Reply;
import tw.georgia.article.model.ReplyService;
import tw.jacky.login.model.MemberBasicInfo;


@Controller
@SessionAttributes("memberbasicinfo")
public class ArticleController {
	
	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ReplyService replyService;
	
	
	private String staticPath = getStaticPath();
	
	
	String userUrl="http://localhost:8080/article.user";
	String adminUrl="http://localhost:8080/article.admin";
	
	
//	寫絕對路徑辦法(圖片)
	private String getStaticPath() {
		String path = this.getClass().getClassLoader().getResource("").getPath();
		path = path.substring(1).replace("target", "src").replaceAll("classes", "main") + "webapp" + File.separator + "WEB-INF"
				+ File.separator + "resources" + File.separator + "images" + File.separator + "georgia" + File.separator + "picture";
		path = path.replaceAll("/", Matcher.quoteReplacement(File.separator));
		return path;
	}
	
//	●測試
//	--主頁輪播測試
//	●會員
//	--文章管理(會員)
//	--留言管理(會員)
//	--前往新增文章
//	--新增文章
//	--前往更新文章
//	--更新文章
//	--查詢(會員)
//	--文章刪除
//	--評論刪除
//	--顯示文章頁面(會員)
//	●管理
//	--文章首頁(管理員)
//	--評論首頁(管理員)
//	--文章隱藏
//	--評論隱藏
//	--查詢(管理員)
//	--顯示文章頁面(管理員)
//	●
//	--顯示文章頁面
//	--留言區
//	--留言區新增留言
	
	//	**********主頁輪播測試*********************************************
	@RequestMapping(path = "/article.test",method = RequestMethod.GET)
	public String test() {
		return "georgia/article/NewFile";
	}
	
	//***************期待成為主頁***************
	@RequestMapping(path = "/article.main",method = RequestMethod.GET)
	public String test2() {
		return "georgia/article/NewFile2";
	}
	
	//********************AJAX  TEST************************
	@GetMapping(path = "/article.test3")
	public String test3(Model m) {
		List<Article> list = articleService.findAll();
		m.addAttribute("list", list);
		return "georgia/article/test";
	}
	
//	***************************************************************
//	***       會員 會員 會員 會員 會員 會員 會員 會員 會員 會員              ***
//	***       會員 會員 會員 會員 會員 會員 會員 會員 會員 會員              ***
//	***       會員 會員 會員 會員 會員 會員 會員 會員 會員 會員              ***
//	***************************************************************
	
//	**********文章管理(會員)********************************************
	@RequestMapping(path = "/article.user",method = RequestMethod.GET)
	public String articleUserMain(Model m) {
		MemberBasicInfo memberBasicInfo = (MemberBasicInfo)m.getAttribute("memberbasicinfo");
		int posterID = memberBasicInfo.getMemberid();

		List<Article> list = articleService.findPoster(posterID);
		m.addAttribute("list", list);
		//request.setAttribute("list",list);
		return "georgia/article/articleUserMain";
	}	

	//	**********留言管理(會員)********************************************
	@RequestMapping(path = "/article.user.reply",method = RequestMethod.GET)
	public String articleUserComment(Model m) {
		MemberBasicInfo memberBasicInfo = (MemberBasicInfo)m.getAttribute("memberbasicinfo");
		int replyer = memberBasicInfo.getMemberid();
		
		List<Reply> list = replyService.findByReplyer(replyer);
		
		m.addAttribute("list", list);
		//request.setAttribute("list",list);
		return "georgia/article/articleUserComment";
	}	
	
//	**********前往新增文章*********************************************
	@RequestMapping(path = "/article.new",method = RequestMethod.GET)
	public String newArticle() {
		return "georgia/article/articleCreate";
	}

	
//	*********新增文章*************************************************
	@PostMapping(path = "/article.insert")
	public String insertArticle(
								@RequestParam("title") String title,
								@RequestParam("subtitle") String subtitle,
								@RequestParam("chooseCountry") String chooseCountry,
								@RequestParam("chooseType") String chooseType,
								@RequestParam("photo") MultipartFile mf,
								@RequestParam("content") String content,
								Model m) throws IllegalStateException, IOException {
		
		MemberBasicInfo memberBasicInfo = (MemberBasicInfo)m.getAttribute("memberbasicinfo");

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
		
		Article insertBean = new Article(memberBasicInfo, category, title, subtitle, photo, content, date);
		
		articleService.insert(insertBean);
		return "redirect:"+userUrl;
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
//								@RequestParam("posterID") int posterID,
								@RequestParam("title") String title,
								@RequestParam("subtitle") String subtitle,
								@RequestParam("chooseCountry") String chooseCountry,
								@RequestParam("chooseType") String chooseType,
								@RequestParam("photo") MultipartFile mf,
								@RequestParam("content") String content,
								@RequestParam("date") String date) throws IllegalStateException, IOException {
		System.out.println(chooseCountry);
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
		
		Article updateBean = articleService.findByID(postID);
		updateBean.setCategory(category);
		updateBean.setTitle(title);
		updateBean.setSubtitle(subtitle);
		updateBean.setPhoto(photo);
		updateBean.setContent(content);
//		Article updateBean = new Article(category,postID,posterID,title,subtitle,photo,content,date);
//		articleService.updateArticle(title,subtitle,photo,categoryID,content,postID);
		articleService.update(updateBean);
		return "redirect:"+userUrl;
	}
	
//	*********查詢(會員)*************************************************
	@RequestMapping(path = "/article.user.read",method = RequestMethod.POST)
	public String articleUserRead(@RequestParam("chooseCountry") String chooseCountry,
								@RequestParam("chooseType") String chooseType,
								Model m) {
		MemberBasicInfo memberBasicInfo = (MemberBasicInfo)m.getAttribute("memberbasicinfo");
		int posterID = memberBasicInfo.getMemberid();
		List<Article> search = new LinkedList<Article>();
		if (chooseType == "") {
			int countryID = Integer.parseInt(chooseCountry);
			List<Category> cateList = categoryService.findCountry(countryID);
			for(Category cateBean:cateList) {
				Set<Article> articleSet = cateBean.getArticle();
				for (Article article : articleSet) {
					if(article.getMember().getMemberid()!=posterID)
						continue;
					search.add(article);
				}
		        Collections.sort(search, new Comparator<Article>(){
		        	public int compare(Article a1, Article a2) {
		        		if(a1.getPostID() > a2.getPostID()){
		                    return 1;
		                }
		                if(a1.getPostID() == a2.getPostID()){
		                    return 0;
		                }
		                return -1;
		            }
		        }); 
		        	}
//				List<Article> search = articleService.findType(cateBean.getCategoryID());
				m.addAttribute("search", search);
//			List<Article> searchBean = articleService.findCountry(countryID);
//			m.addAttribute("searchBean", searchBean);
		}else {
			int categoryID = Integer.parseInt(chooseCountry+chooseType);
			List<Article> searchType = articleService.findTypeForUser(categoryID,posterID);
			m.addAttribute("search", searchType);
		}
		return "georgia/article/articleUserRead";
	}

//	*****************文章刪除******************************************
	@RequestMapping(path = "/article.userDelete",method = RequestMethod.POST)
	public String userDelete(@RequestParam("postID") int postID,
								Model m) {
		Article bean = articleService.findByID(postID);
		bean.setUserDelete(1);
//		bean.setManageHidden(0);
//		System.out.println(bean.getManageHidden());
		
		Article updateBean = articleService.update(bean);
		
		return "redirect:"+userUrl;
	}
	
//	*****************評論刪除******************************************
	@RequestMapping(path = "/article.userDelete.reply",method = RequestMethod.POST)
	public String userDeleteReply(@RequestParam("replyID") int replyID,
			Model m) {
		Reply bean = replyService.findByID(replyID);
		bean.setUserDelete(1);
//		bean.setManageHidden(0);
//		System.out.println(bean.getManageHidden());
		
		Reply updateBean = replyService.update(bean);
		
		return "redirect:"+userUrl;
	}
	
//	*********顯示文章頁面(會員)*************************************************
	@RequestMapping(path = "/article.user.show",method = RequestMethod.POST)
	public String articleUserDetail(@RequestParam("postID") int postID,
								Model m) {
		Article findByID = articleService.findByID(postID);
		m.addAttribute("findByID", findByID);
		
		return "georgia/article/articleUserDetail";
	}
	
	
//	***************************************************************
//	***       管理 管理 管理 管理 管理 管理 管理 管理 管理 管理 管理          ***
//	***       管理 管理 管理 管理 管理 管理 管理 管理 管理 管理 管理          ***
//	***       管理 管理 管理 管理 管理 管理 管理 管理 管理 管理 管理          ***
//	***************************************************************
	
//	**********文章首頁(管理員)********************************************
	@RequestMapping(path = "/article.admin",method = RequestMethod.GET)
	public String articleAdminMain(Model m) {
		
		List<Article> list = articleService.findAll();
		m.addAttribute("list", list);
		//request.setAttribute("list",list);
		return "georgia/article/articleAdminMain";
	}	
	
//	**********評論首頁(管理員)********************************************
	@RequestMapping(path = "/article.admin.reply",method = RequestMethod.GET)
	public String articleAdminComment(Model m) {
		
		List<Reply> list = replyService.findAll();
		m.addAttribute("list", list);
		//request.setAttribute("list",list);
		return "georgia/article/articleAdminComment";
	}	
	
//	*****************文章隱藏******************************************
	@RequestMapping(path = "/article.manageHidden",method = RequestMethod.POST)
	public String manageHidden(@RequestParam("postID") int postID,
			Model m) {
		Article bean = articleService.findByID(postID);
		bean.setManageHidden(1);
//		bean.setManageHidden(0);
//		System.out.println(bean.getManageHidden());
		
		Article updateBean = articleService.update(bean);
		
		return "redirect:"+adminUrl;
	}
	
//	*****************評論隱藏******************************************
	@RequestMapping(path = "/article.manageHidden.reply",method = RequestMethod.POST)
	public String manageHiddenReply(@RequestParam("replyID") int replyID,
			Model m) {
		Reply bean = replyService.findByID(replyID);
		bean.setManageHidden(1);
//		bean.setManageHidden(0);
//		System.out.println(bean.getManageHidden());
		
		Reply updateBean = replyService.update(bean);
		
		return "redirect:"+adminUrl;
	}

//	*********查詢(管理員)*************************************************
	@RequestMapping(path = "/article.admin.read",method = RequestMethod.POST)
	public String articleAdminRead(@RequestParam("chooseCountry") String chooseCountry,
			@RequestParam("chooseType") String chooseType,
			Model m) {
		List<Article> search = new LinkedList<Article>();
		if (chooseType == "") {
			int countryID = Integer.parseInt(chooseCountry);
			List<Category> cateList = categoryService.findCountry(countryID);
			for(Category cateBean:cateList) {
				Set<Article> articleSet = cateBean.getArticle();
				for (Article article : articleSet) {
					search.add(article);
				}
				Collections.sort(search, new Comparator<Article>(){
					public int compare(Article a1, Article a2) {
						if(a1.getPostID() > a2.getPostID()){
							return 1;
						}
						if(a1.getPostID() == a2.getPostID()){
							return 0;
						}
						return -1;
					}
				}); 
			}
//				List<Article> search = articleService.findType(cateBean.getCategoryID());
			m.addAttribute("search", search);
//			List<Article> searchBean = articleService.findCountry(countryID);
//			m.addAttribute("searchBean", searchBean);
		}else {
			int categoryID = Integer.parseInt(chooseCountry+chooseType);
			List<Article> searchType = articleService.findType(categoryID);
			m.addAttribute("search", searchType);
		}
		return "georgia/article/articleAdminRead";
	}
	
//	*********顯示文章頁面(管理員)*************************************************
	@RequestMapping(path = "/article.admin.show",method = RequestMethod.POST)
	public String articleAdminDetail(@RequestParam("postID") int postID,
			Model m) {
		Article findByID = articleService.findByID(postID);
		m.addAttribute("findByID", findByID);
		
		return "georgia/article/articleAdminDetail";
	}
	

	
//	*********顯示文章頁面*************************************************
	@RequestMapping(path = "/article.show",method = RequestMethod.POST)
	public String showArticle(@RequestParam("postID") int postID,
								Model m) {
		Article findByID = articleService.findByID(postID);
		m.addAttribute("findByID", findByID);
		
		return "georgia/article/articleDetail";
	}
	
//	*********留言區*************************************************
	@GetMapping(path = "/article.comment")
	@ResponseBody
	public List<Reply> comment(@RequestParam("postID") int postID) {
		List<Reply> search = new LinkedList<Reply>();
		
		Article findByID = articleService.findByID(postID);
		Set<Reply> replySet = findByID.getReply();
		for (Reply reply : replySet) {
			search.add(reply);
		}
        Collections.sort(search, new Comparator<Reply>(){
        	public int compare(Reply a1, Reply a2) {
        		if(a1.getReplyID() > a2.getReplyID()){
                    return 1;
                }
                if(a1.getReplyID() == a2.getReplyID()){
                    return 0;
                }
                return -1;
            }
        }); 
		System.out.println(search.size());
		return search;
	}
//	*********留言區新增留言*************************************************
	@PostMapping(path = "/article.commentinsert")
	@ResponseBody
	public String commentinsert(@RequestParam("postID") int postID,
								@RequestParam("comment") String comment,
								Model m) {
		MemberBasicInfo memberBasicInfo = (MemberBasicInfo)m.getAttribute("memberbasicinfo");
		
		String replytime =DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm").format(LocalDateTime.now());

		Article article = new Article();
		article.setPostID(postID);
		
		Reply reply = new Reply(memberBasicInfo, article, comment, replytime);
		replyService.insert(reply);
		return "ok";
	}
	
	
//	******************************************
//	**      預設 預設  預設  預設  預設            **
//	**      預設 預設  預設  預設  預設            **
//	**      預設 預設  預設  預設  預設            **
//	******************************************	
	
//	**********文章預設首頁********************************************
	@RequestMapping(path = "/article.default.main",method = RequestMethod.GET)
	public String articleDefaultMain(Model m) {

		List<Article> list = articleService.findAll();
		m.addAttribute("list", list);
		//request.setAttribute("list",list);
		return "georgia/article/articleMain";
	}	
	
//	*********刪除文章*************************************************
	@DeleteMapping(path = "/article.delete")
	public String deleteArticle(@RequestParam("postID") int postID) {
//		Article deleteBean=new Article();
		articleService.delete(postID);
		return "redirect:";
	}
	
//	*********查詢*************************************************
	@RequestMapping(path = "/article.read",method = RequestMethod.POST)
	public String readArticle(@RequestParam("chooseCountry") String chooseCountry,
			@RequestParam("chooseType") String chooseType,
			Model m) {
		List<Article> search = new LinkedList<Article>();
		if (chooseType == "") {
			int countryID = Integer.parseInt(chooseCountry);
			List<Category> cateList = categoryService.findCountry(countryID);
			for(Category cateBean:cateList) {
				Set<Article> articleSet = cateBean.getArticle();
				for (Article article : articleSet) {
					search.add(article);
				}
				Collections.sort(search, new Comparator<Article>(){
					public int compare(Article a1, Article a2) {
						if(a1.getPostID() > a2.getPostID()){
							return 1;
						}
						if(a1.getPostID() == a2.getPostID()){
							return 0;
						}
						return -1;
					}
				}); 
			}
//				List<Article> search = articleService.findType(cateBean.getCategoryID());
			m.addAttribute("search", search);
//			List<Article> searchBean = articleService.findCountry(countryID);
//			m.addAttribute("searchBean", searchBean);
		}else {
			int categoryID = Integer.parseInt(chooseCountry+chooseType);
			List<Article> searchType = articleService.findType(categoryID);
			m.addAttribute("search", searchType);
		}
		return "georgia/article/articleRead";
	}

	
}
