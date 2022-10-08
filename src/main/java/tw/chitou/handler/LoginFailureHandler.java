package tw.chitou.handler;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import tw.jacky.login.model.LoginService;


@Component
public class LoginFailureHandler implements AuthenticationFailureHandler {
//	 private final Logger logger = LoggerFactory.getLogger(this.getClass());
	 
	 @Autowired 
	 LoginService  lService;
	 
	 /**
	  * 記錄帳號認證錯誤次數, 大於 table:systemConfig - field:max_login_errors 則鎖住
	  */
	 @Override
	 public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
	   AuthenticationException exception) throws IOException, ServletException {
		 
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		
		if (username == null || username.length() == 0) {
			errors.put("name", "name is required");
		}

		if (password == null || password.length() == 0) {
			errors.put("pwd", "password is required");
		}

		if (errors != null && !errors.isEmpty()) {
			request.getRequestDispatcher("/WEB-INF/jsp/jacky/login/adminlogin/AdminLogin.jsp").forward(request, response);		
		}
		
		
		errors.put("msg", "please input correct username or passward");
		request.getRequestDispatcher("/WEB-INF/jsp/jacky/login/adminlogin/AdminLogin.jsp").forward(request, response);				
	}

		
		 
//	  SystemConfig sc = sysService.getSystemConfigByParamName("max_login_errors");
//	  int maxLoginErrors = Integer.parseInt(sc.getParamValue());
//	  
//	  String username = request.getParameter("username");   // 取得登入帳號   
//	  User user = sysService.getUserByUsername(username);
//	  int loginErrorTimes = user.getLoginErrorTimes() +1;
//	  user.setLoginErrorTimes(loginErrorTimes);
//	  
//	  if (loginErrorTimes > maxLoginErrors) {
//	   user.setAccountNonLocked(false);         
//	  }
//	  sysService.UserSave(user);
//	  response.sendRedirect("/login/failure?username=" + username);
	 }


