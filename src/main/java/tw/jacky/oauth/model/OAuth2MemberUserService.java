package tw.jacky.oauth.model;

import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;


@Service
public class OAuth2MemberUserService extends DefaultOAuth2UserService {

	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
//		從google獲取user的資料
		OAuth2User user =  super.loadUser(userRequest);
//		多形-> 將 你的user class 轉型成爲 google的user class 
		return new OAuth2MemberUser(user);
		
	}

	
	
	
	
}
