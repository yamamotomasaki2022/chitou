package tw.georgia.article.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ArticleService {
	@Autowired
	private ArticleRepository articleRepository;
	
	
//	************新增********************************
	public Article insert(Article bean) {
		return articleRepository.save(bean);
	}
	
//	***********修改***********************************
	public Article update(Article bean) {
		return articleRepository.save(bean);
	}
	
//	*************刪除********************************
	public void delete(int postID) {
		articleRepository.deleteById(postID);
	}
	
//	*************查詢全部*****************************
	public List<Article> findAll() {
		return articleRepository.findAll();
	}
	
//	***********查詢ID***********************
	public Article findByID(int postID) {
		Optional<Article> optional=articleRepository.findById(postID);
		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
//	**************查詢國家********************
	public List<Article> findCountry(int countryID){
		return articleRepository.findByCountryid(countryID);
	}
	
//	*************查詢分類*********************
	public List<Article> findType(int typeID){
		return articleRepository.findByTypeid(typeID);
	}
	
}
