package tw.jacky.login.model;

import java.util.List;

import org.hibernate.criterion.LikeExpression;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface MemberBasicInfoRepository extends JpaRepository<MemberBasicInfo, Integer> {
	
	
	public MemberBasicInfo findByMemberid (int id);
	
	
	
	
	
	
}
