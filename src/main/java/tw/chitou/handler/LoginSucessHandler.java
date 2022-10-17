package tw.chitou.handler;

import java.io.IOException;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import tw.jacky.login.model.AdminChitou;
import tw.jacky.login.model.LoginService;
import tw.jacky.login.model.MemberBasicInfo;
import tw.jacky.login.model.MemberDetailInfo;


@Component
public class LoginSucessHandler implements AuthenticationSuccessHandler {
	
	
	@Autowired
	private LoginService lService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		
		UserDetails userDetails   =(UserDetails)authentication.getPrincipal();
//		outcome : [authorities]
		Collection<? extends GrantedAuthority> authorities = userDetails.getAuthorities();
		
//		System.out.println("成功的進入了sucesshandler");

//		判斷權限用
//		System.out.println(authorities.toString().equals("[unverified_member]"));
		
		
		if (authorities.toString().equals("[unverified_member]")) {
			System.out.println("成功的進入了sucesshandler的if判斷内");
			String username = request.getParameter("username");
			MemberBasicInfo memberbasicinfo = lService.findBasicInfobyUsername(username);
			MemberDetailInfo memberdetailinfo = lService.findDetailByMemberid(memberbasicinfo.getMemberid());
			request.getSession().setAttribute("memberbasicinfo", memberbasicinfo);
			request.getSession().setAttribute("memberdetailinfo", memberdetailinfo);
			request.setAttribute("login", 1);
			request.getRequestDispatcher("/WEB-INF/jsp/NewHome.jsp").forward(request, response);
		}
		
		else if (authorities.toString().equals("[verified_member]")) {
			System.out.println("成功的進入了sucesshandler的if判斷内");
			String username = request.getParameter("username");
			MemberBasicInfo memberbasicinfo = lService.findBasicInfobyUsername(username);
			MemberDetailInfo memberdetailinfo = lService.findDetailByMemberid(memberbasicinfo.getMemberid());
			request.getSession().setAttribute("memberbasicinfo", memberbasicinfo);
			request.getSession().setAttribute("memberdetailinfo", memberdetailinfo);
			request.setAttribute("login", 1);
			request.getRequestDispatcher("/WEB-INF/jsp/NewHome.jsp").forward(request, response);
		}
		
		else if(authorities.toString().equals("[boss777]")) {
			System.out.println("成功的進入了sucesshandler的if判斷内的boss");
			List<AdminChitou> adminlist = lService.adminFindAll();
			List<MemberBasicInfo> memberlist = lService.memberFindAll();
			request.getSession().setAttribute("adminlist", adminlist);
			request.getSession().setAttribute("memberlist", memberlist);
//			request.getSession().setAttribute("session_status", 3);
//			request.setAttribute("status", 3);
//			request.getSession().setAttribute("bean", 5);
//			System.out.println("sessionid :" + request.getSession().getId());
			
			
//			request.getRequestDispatcher("/WEB-INF/jsp/jacky/login/adminlogin/AdminHomePage.jsp").forward(request, response);	
			response.sendRedirect("/manager/Chart/"+"3");
//			response.sendRedirect("/manager/AdminHomePage");
		}
		else if(authorities.toString().equals("[admin]")){
			System.out.println("成功的進入了sucesshandler的if判斷内的 admin");
			List<AdminChitou> adminlist = lService.adminFindAll();
			List<MemberBasicInfo> memberlist = lService.memberFindAll();
			request.getSession().setAttribute("adminlist", adminlist);
			request.getSession().setAttribute("memberlist", memberlist);
			request.getSession().setAttribute("session_status", 1);
//			request.getRequestDispatcher("/WEB-INF/jsp/jacky/login/adminlogin/AdminHomePage.jsp").forward(request, response);	
			response.sendRedirect("/manager/Chart/"+"1");
		}
		
//		super.onAuthenticatioSuccess(request, response, authentication);
		
		System.out.println("跳到auth判斷公式之外");
	}
	
	
	
	

	
	

}
