package tw.chitou.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import tw.chitou.handler.AccessDenialHandler;
import tw.chitou.handler.LoginFailureHandler;
import tw.chitou.handler.LoginSucessHandler;
import tw.jacky.login.model.AuthUserDetailsService;
import tw.jacky.oauth.handler.OAuth2LoginSuccessHandler;
import tw.jacky.oauth.model.OAuth2MemberUser;
import tw.jacky.oauth.model.OAuth2MemberUserService;

//import tw.leonchen.controller.AuthUserDetailsService;

@SuppressWarnings("deprecation")
@EnableWebSecurity   //開啓web security	
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private AuthUserDetailsService auds;
	
	@Autowired
	private LoginSucessHandler loginSucessHandler;
	
	@Autowired
	private LoginFailureHandler loginFailureHandler;
	
	@Autowired
	private AccessDenialHandler accessDenialHandler;
	
	@Autowired
	private LogoutSuccessHandler logoutSuccessHandler;
	
	@Autowired
	private OAuth2MemberUserService oAuth2MemberUserService;
	
	@Autowired
	private OAuth2LoginSuccessHandler oAuth2LoginSuccessHandler;
 	
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
			.userDetailsService(auds)
			.passwordEncoder(new BCryptPasswordEncoder());
			
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeHttpRequests() // 定義哪些url需要被保護
//		允許可以進入到google API
		.antMatchers("/oauth2/**").permitAll()
//		表示get方法之下，路徑之下的所有文件夾都要驗證 ，path= 我要限制的網址： (localhost:8080/admin/...)之下都要驗證 
//		網址(/admin/**) 表示admin之下的的所有路徑
		.antMatchers(HttpMethod.GET,"/member/**").hasAnyAuthority("unverified_member","verified_member")
		.antMatchers(HttpMethod.GET,"/manager/**").hasAnyAuthority("admin","manager","boss777")
		.antMatchers(HttpMethod.GET).permitAll()
		.antMatchers(HttpMethod.POST,"/manager/**").hasAnyAuthority("unverified_member","admin","manager","boss777")
		.antMatchers(HttpMethod.POST,"/member/**").hasAnyAuthority("verified_member")
		.antMatchers(HttpMethod.POST).permitAll()
		.anyRequest().authenticated()
//		and 加上另外的功能
		.and()
//		設定session key的名字
		.rememberMe().tokenValiditySeconds(86400).key("jacky-rememberme")
		.and()
//		關掉csrf
		.csrf().disable()
//		導入的login界面
		.formLogin()
		.loginPage("/toAdminLoginPage")
//		.loginProcessingUrl("/testout")
//		.defaultSuccessUrl("/admin/testpage")
		.successHandler(loginSucessHandler)
//		.failureUrl("/login.html?error=true");
		.failureHandler(loginFailureHandler)
		.and()
//		拒絕訪問權限
		.exceptionHandling()
//		.accessDeniedPage("/accessDenied.jsp");
		.accessDeniedHandler(accessDenialHandler)
		.and()
		.oauth2Login()
			.loginPage("/toAdminLoginPage")
			.userInfoEndpoint().userService(oAuth2MemberUserService)
			.and()
			.successHandler(oAuth2LoginSuccessHandler)
			
		.and()
		
//		log out
		.logout()
		.invalidateHttpSession(true)
		.deleteCookies("JSESSIONID")
//		.logoutSuccessUrl("/home");
		.logoutUrl("/logout")
		.logoutSuccessHandler(logoutSuccessHandler);
	}
	
}
