package tw.jacky.login.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface MemberBasicInfoRepository extends JpaRepository<MemberBasicInfo, Integer> {

	public MemberBasicInfo findByMemberid(int id);

	public MemberBasicInfo findByUsername(String username);
	
	@Query("FROM MemberBasicInfo Where verificationcode = ?1")
	public MemberBasicInfo finyByVerificationcode(String verificationcode);
	
	public MemberBasicInfo findByEmail(String email);

}
