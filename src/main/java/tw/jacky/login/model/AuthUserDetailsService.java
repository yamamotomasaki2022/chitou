package tw.jacky.login.model;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;



// 接續別人的API，使用人家的制定好的class
@Service
public class AuthUserDetailsService implements UserDetailsService {
	
	@Autowired
	private LoginService lService;

	@Override
	public UserDetails loadUserByUsername(String username)  {
		
		String role= "";
		
		AdminChitou adminchitou = lService.findByAdminUersname(username);
		System.out.println("UserDetails-測試權限:"+adminchitou.getAdminstatus());
		
		Integer adminstatus = adminchitou.getAdminstatus();
		if(adminstatus == 1) {
			role = "admin";
			System.out.println("是否進入if:" + role);
			return new User(adminchitou.getUsername(), adminchitou.getPassword(), AuthorityUtils.commaSeparatedStringToAuthorityList(role));
		}else if (adminstatus==2) {
			role="manager";
			System.out.println("是否進入if:" + role);
			return new User(adminchitou.getUsername(), adminchitou.getPassword(), AuthorityUtils.commaSeparatedStringToAuthorityList(role));
			
		}else {
			role= "boss777";
			System.out.println("是否進入if:" + role);
			return new User(adminchitou.getUsername(), adminchitou.getPassword(), AuthorityUtils.commaSeparatedStringToAuthorityList(role));
		}
		
	}

}
