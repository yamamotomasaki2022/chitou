package tw.jacky.oauth.handler;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import javax.management.loading.PrivateClassLoader;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import tw.jacky.login.model.LoginService;
import tw.jacky.login.model.MemberBasicInfo;
import tw.jacky.login.model.MemberDetailInfo;
import tw.jacky.oauth.model.OAuth2MemberUser;
import tw.jacky.oauth.model.OAuth2MemberUserService;

@Component
public class OAuth2LoginSuccessHandler implements AuthenticationSuccessHandler {

	@Autowired
	OAuth2MemberUserService oAuth2MemberUserService;

	@Autowired
	LoginService lService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		OAuth2MemberUser oAuth2MemberUser = (OAuth2MemberUser) authentication.getPrincipal();

		String email = oAuth2MemberUser.getEmail();
		String name = oAuth2MemberUser.getName();

		List<MemberBasicInfo> memberlist = lService.memberFindAll();

		try {
			MemberBasicInfo memberbean = lService.findByEmail(email);
			MemberDetailInfo memberdetailbean = lService.findDetailByMemberid(memberbean.getMemberid());
			request.getSession().setAttribute("memberbasicinfo", memberbean);
			request.getSession().setAttribute("memberdetailinfo", memberdetailbean);
			request.setAttribute("operation", 1);

		} catch (Exception e) {
			String photo = "images/jacky/login/default1.png";
			MemberBasicInfo memberBasicInfo = new MemberBasicInfo(5, email, "default_pw", photo, email);
			MemberBasicInfo insertedBean = lService.adminInsertMember(memberBasicInfo);
			MemberDetailInfo memberDetailInfo = new MemberDetailInfo(insertedBean.getMemberid());
			lService.adminInsertMemberDetailInfo(memberDetailInfo);
			request.getSession().setAttribute("memberbasicinfo", memberBasicInfo);
			request.getSession().setAttribute("memberdetailinfo", memberDetailInfo);
			request.setAttribute("operation", 1);
//			request.getRequestDispatcher("/WEB-INF/jsp/jacky/login/memberlogin/MemberHomePage.jsp").forward(request,
//					response);
//			response.sendRedirect("toMemberHomePage");
			request.getRequestDispatcher("/WEB-INF/jsp/NewHome.jsp").forward(request,
					response);

		}


//		request.getRequestDispatcher("/WEB-INF/jsp/jacky/login/memberlogin/MemberHomePage.jsp").forward(request,
//				response);
//		response.sendRedirect("toMemberHomePage");
		request.getRequestDispatcher("/WEB-INF/jsp/NewHome.jsp").forward(request,
				response);
	}

}
//		for (MemberBasicInfo member : memberlist) {
//			if (email.equals(member.getEmail())) {
//				System.out.println("google郵箱與DB郵箱重複");
//				break;
//			}
//			if (email.equals(member.getUsername())) {
//				System.out.println("google郵箱與DB用戶名重複");
//			} else {
//				String photo = "images/jacky/login/default1.png";
//				MemberBasicInfo memberBasicInfo = new MemberBasicInfo(5, email, "default_pw", photo, email);
//				MemberBasicInfo insertedBean = lService.adminInsertMember(memberBasicInfo);
//				MemberDetailInfo memberDetailInfo = new MemberDetailInfo(insertedBean.getMemberid());
//				lService.adminInsertMemberDetailInfo(memberDetailInfo);
//				request.getSession().setAttribute("memberbasicinfo", memberBasicInfo);
//				request.getSession().setAttribute("memberdetailinfo", memberDetailInfo);
//
//				break;
//			}
//
//		}
