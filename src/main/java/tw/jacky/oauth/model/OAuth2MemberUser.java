package tw.jacky.oauth.model;

import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.oauth2.core.user.OAuth2User;


// JavaBean使用別人的資訊
public class OAuth2MemberUser implements OAuth2User {
	
	private OAuth2User oAuth2User;

	@Override
	public Map<String, Object> getAttributes() {
		return oAuth2User.getAttributes();
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		String role = "verified_member";
		return AuthorityUtils.commaSeparatedStringToAuthorityList(role);
	}

	@Override
	public String getName() {
		return oAuth2User.getAttribute("name");
	}

	public OAuth2MemberUser(OAuth2User oAuth2User) {
		super();
		this.oAuth2User = oAuth2User;
	}
	
	public String getEmail() {
		return oAuth2User.getAttribute("email");
	}
	
	public String getProfile() {
		return oAuth2User.getAttribute("profile");
	}


	
	

	
	
	
	
	
	

}
