package tw.chitou.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class UserNotFoundExceptionHandler {
	
//	404的頁面
	@ExceptionHandler(UserNotFoundException.class)
	public Object exceptionHandler(UserNotFoundException e) {
//		String myMessage = e.getMyMessage();
	
//		String message ="錯誤咯~" + myMessage;
		
//		return ResponseEntity.status(HttpStatus.NOT_FOUND).body(message);
		
		
//		測試頁面成功 error/文件之下的error1.jsp
		return "error/error1";
				
		
		
		
	}
	

}
