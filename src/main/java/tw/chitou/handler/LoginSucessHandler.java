package tw.chitou.handler;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import tw.jacky.login.model.LoginService;


@Component
public class LoginSucessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	
	
	@Autowired
	private LoginService lService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		
		UserDetails userDetails   =(UserDetails)authentication.getPrincipal();
//		outcome : [authorities]
		Collection<? extends GrantedAuthority> authorities = userDetails.getAuthorities();
		String username = userDetails.getUsername();
		System.out.println(authorities.toString());
		System.out.println("登入成功的賬號:" + username);
		
		
		
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
	

	
	

}
