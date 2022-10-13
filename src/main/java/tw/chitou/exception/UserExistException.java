package tw.chitou.exception;

import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.http.HttpStatus;


// https://www.tpisoftware.com/tpu/articleDetails/1334 參考
//@ResponseStatus(HttpStatus.NOT_FOUND)
public class UserExistException extends RuntimeException {

	private static final long serialVersionUID=1L;
	
	private String MyMessage;
	
	
	public UserExistException() {
	}
	
	public UserExistException(String MyMessage) {
		this.MyMessage=MyMessage;
	}
	
	public String getMyMessage() {
		return MyMessage;
	}
	
	public void setMyMessage(String MyMessage) {
		this.MyMessage = MyMessage;
	}
	
	
	
	

}
