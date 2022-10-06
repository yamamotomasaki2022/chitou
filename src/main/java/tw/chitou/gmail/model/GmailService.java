package tw.chitou.gmail.model;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.jacky.login.model.LoginService;
import tw.jacky.login.model.MemberBasicInfo;
import tw.jacky.login.model.MemberBasicInfoRepository;

@Service
@Transactional
public class GmailService {

	@Autowired
	JavaMailSender javaMailSender;
	
	@Autowired
	MailSender mailSender;
	
	@Autowired
	MemberBasicInfoRepository mbrepo;

	public void mimemail(String fromEmail, List<String> toList, String subject, String html) {

		try {
			MimeMessage message = javaMailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message);
			for (String to : toList) {
				messageHelper.addTo(to);
				messageHelper.setSubject(subject);
//				解析成html
				messageHelper.setText(html, true);
				javaMailSender.send(message);
			}
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	
	public boolean verify(String verificationcode) {
		MemberBasicInfo member = mbrepo.finyByVerificationcode(verificationcode);
		
		if(member == null) {
			System.out.println("沒有取得驗證碼");
			return false;
		}else {
			System.out.println("已經取得了驗證碼");
			member.setStatusid(5);
			mbrepo.save(member);
			return true;
		}
		
		
	}
	

}
