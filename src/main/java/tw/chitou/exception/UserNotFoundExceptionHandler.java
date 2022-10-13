package tw.chitou.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class UserNotFoundExceptionHandler {
	
	
	@ExceptionHandler(UserExistException.class)
	public Object exceptionHandler(UserExistException e) {
//		String myMessage = e.getMyMessage();
	
//		String message ="錯誤咯~" + myMessage;
		
//		return ResponseEntity.status(HttpStatus.NOT_FOUND).body(message);
		
		
//		測試頁面成功 error/文件之下的error1.jsp
		return "error/error1";
				
		
		
		
	}
	

}
