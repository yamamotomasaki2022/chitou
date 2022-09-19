package tw.georgia.article.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ArticleRepository extends JpaRepository<Article, Integer> {

	public List<Article> findByCountryid(int countryID);
	public List<Article> findByTypeid(int typeID);
}
