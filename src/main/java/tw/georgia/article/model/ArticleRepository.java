package tw.georgia.article.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ArticleRepository extends JpaRepository<Article, Integer> {

	@Query("from Article where countryID= :countryID")
	public List<Article> findByCountryid(int countryID);
	
	
	@Query("from Article where categoryID= :categoryID")
	public List<Article> findByCategoryID(int categoryID);
}
