package sy.handler;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

public class EmailHandler {

	private MimeMessage message;
	private MimeMessageHelper messageHelper;

	private JavaMailSenderImpl sender;

	public static EmailHandler getInstance() throws Exception {
		return new EmailHandler();
	}

	private EmailHandler() throws Exception {
		setting();
		message = this.sender.createMimeMessage();
		messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		setFrom("pallenstudy@gmail.com", "pallen");
	}
	private void setting() {
		sender = new JavaMailSenderImpl();
		sender.setHost("smtp.gmail.com");
		sender.setPort(587);
		sender.setUsername("pallenstudy@gmail.com");
		sender.setPassword("study00000");
		
		
		Properties options = new Properties();
		
		options.put("mail.transport.protocol", "smtp");		//전송방법
		options.put("mail.smtp.auth", "true");						//인증 활성화
		options.put("mail.debug", "true");//생략 가능			//디버그
		options.put("mail.smtp.starttls.enable", "true");	//암호화 활성화
		
		sender.setJavaMailProperties(options);
	}
	public void setSubject(String subject) throws MessagingException {
		messageHelper.setSubject(subject);
	}

	public void setText(String htmlContent) throws MessagingException {
		messageHelper.setText(htmlContent, true);
	}

	private void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException {
		messageHelper.setFrom(email, name);
	}
	
	public void setTo(String email) throws MessagingException {
		messageHelper.setTo(email);
	}

	public void addInline(String contentId, DataSource dataSource) throws MessagingException {
		messageHelper.addInline(contentId, dataSource);
	}

	public void send() {
		sender.send(message);
	}

}
