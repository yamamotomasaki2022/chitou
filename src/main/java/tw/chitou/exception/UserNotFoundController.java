package tw.chitou.exception;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserNotFoundController {
	
	@RequestMapping("/testException")
	public void getException() {
//		自定義的 usernotfoundexception可用
		throw new UserNotFoundException();
	}

}
