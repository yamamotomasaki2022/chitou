package tw.chitou.config;



import java.util.Locale;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@Configuration
public class WebAppConfig implements WebMvcConfigurer {

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/home").setViewName("NewHome");
		registry.addViewController("/test").setViewName("test");
		registry.addViewController("/chart").setViewName("AdminChart");
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/resources/css/");
		registry.addResourceHandler("/images/**").addResourceLocations("/WEB-INF/resources/images/");
		registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/resources/js/");
		registry.addResourceHandler("/fonts/**").addResourceLocations("/WEB-INF/resources/fonts/");
//        registry.addResourceHandler("/resources/images/coco/**").addResourceLocations("/WEB-INF/resources/images/coco");
		//跟上面那個效果一樣就不用加了
	}
	
	
	@Bean
	public LocaleResolver localeResolver() {
		SessionLocaleResolver slr= new SessionLocaleResolver();
		slr.setDefaultLocale(Locale.TAIWAN);
		
		return slr;
	}
	
	
	@Bean
	public LocaleChangeInterceptor localeChangeInterceptor() {
		LocaleChangeInterceptor lci= new LocaleChangeInterceptor();
		lci.setParamName("lang");
		
		return lci;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(localeChangeInterceptor());
	}
	
	
	
}
