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
		
		System.out.println("成功的進入了sucesshandler");

//		判斷權限用
//		System.out.println(authorities.toString().equals("[unverified_member]"));
		
		if (authorities.toString().equals("[unverified_member]")) {
			System.out.println("成功的進入了sucesshandler的if判斷内");
			request.getRequestDispatcher("/WEB-INF/jsp/jacky/login/hihi.jsp").forward(request, response);
		}else if(authorities.toString().equals("[boss777]")) {
			System.out.println("成功的進入了sucesshandler的if判斷内");
			request.getRequestDispatcher("/WEB-INF/jsp/jacky/login/hihiBoss.jsp").forward(request, response);
			
		}
		super.onAuthenticationSuccess(request, response, authentication);
		
		System.out.println("跳到auth判斷公式之外");
	}
	
	
	
	

	
	

}
