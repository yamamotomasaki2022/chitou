package tw.jacky.login.model;



import org.springframework.data.jpa.repository.JpaRepository;

public interface AdminChitouRepository extends JpaRepository<AdminChitou, Integer> {
	
	
	
	public AdminChitou findByUsername (String username);
	
	

}
