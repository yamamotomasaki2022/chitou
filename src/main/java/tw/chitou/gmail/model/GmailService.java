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

@Service
@Transactional
public class GmailService {

	@Autowired
	JavaMailSender javaMailSender;
	
	@Autowired
	MailSender mailSender;

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

}
