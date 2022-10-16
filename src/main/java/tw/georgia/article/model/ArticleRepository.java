package tw.georgia.article.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface ArticleRepository extends JpaRepository<Article, Integer> {

	@Query("from Article where categoryID= :categoryID and posterID= :posterID")
	public List<Article> findByCategoryIDForUser(int categoryID,int posterID);
	
	@Query("from Article where categoryID= :categoryID order by postID DESC")
	public List<Article> findByCategoryID(int categoryID);
	
	@Query("from Article where posterID= :posterID")
	public List<Article> findByPosterID(int posterID);
	
}
