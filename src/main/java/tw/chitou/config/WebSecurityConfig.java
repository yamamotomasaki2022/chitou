package tw.chitou.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import tw.jacky.login.model.AuthUserDetailsService;

//import tw.leonchen.controller.AuthUserDetailsService;

@SuppressWarnings("deprecation")
@EnableWebSecurity   //開啓web security	
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private AuthUserDetailsService auds;
	
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
//		表示get方法之下，路徑之下的所有文件夾都要驗證 ，path= 我要限制的網址： (localhost:8080/admin/...)之下都要驗證 
//		網址(/admin/**) 表示admin之下的的所有路徑
		.antMatchers(HttpMethod.GET,"/admin/**").hasAnyAuthority("admin","manager","boss");
		.antMatchers(HttpMethod.GET).permitAll()
		.antMatchers(HttpMethod.POST,"/admin/**").authenticated()
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
		.formLogin().loginPage("/toAdminLoginPage")
//		.loginProcessingUrl("/testout")
		.defaultSuccessUrl("/admin/testpage")
		.failureUrl("/login.html?error=true");
		
		
		http.logout()
		.deleteCookies("JSESSIONID");
		
	}
	
}
