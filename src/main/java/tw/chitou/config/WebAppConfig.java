package tw.chitou.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebAppConfig implements WebMvcConfigurer {

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/login/page").setViewName("login");
		registry.addViewController("/login/welcome").setViewName("welcome");
		registry.addViewController("/logout").setViewName("logoutResult");
		registry.addViewController("logout/page").setViewName("logout");
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/resources/css/");
		registry.addResourceHandler("/images/**").addResourceLocations("/WEB-INF/resources/images/");
		registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/resources/js/");
		registry.addResourceHandler("/fonts/**").addResourceLocations("/WEB-INF/resources/fonts/");
        registry.addResourceHandler("/resources/images/coco/**").addResourceLocations("/WEB-INF/resources/images/coco");
	}
	
}
