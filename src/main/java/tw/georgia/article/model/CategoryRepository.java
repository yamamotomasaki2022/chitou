package tw.georgia.article.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface CategoryRepository extends JpaRepository<Category, Integer> {
	
	@Modifying
	@Query("from Category where countryID= :countryID")
	public List<Category> findByCountryid(int countryID);
	
}
