package tw.georgia.article.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CategoryService {
	
	@Autowired
	private CategoryRepository categoryRepository;

//	**************查詢國家********************
	public List<Category> findCountry(int countryID){
		return categoryRepository.findByCountryid(countryID);
	}

}
