package tw.jacky.oauth.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Oauth2Controller {

	
	@ResponseBody
	@GetMapping("/user1")
	public Principal Action(Principal a) {

		return a;
	}

}
