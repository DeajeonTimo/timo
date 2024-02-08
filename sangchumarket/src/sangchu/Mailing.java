package sangchu;

import java.util.Properties;

import javax.mail.PasswordAuthentication;
import javax.mail.Session;

import org.apache.commons.mail.Email;
import org.apache.commons.mail.SimpleEmail;


public class Mailing {
	/*
		최초 작성자 : 김석호
		최초 작성일 : 2023.08.07 14:53
		
		관리자 이메일 발송용 메일링 객체입니다.
		텍스트 메일만 구현해놨으며, 싱글톤입니다.
	*/
	
	// 메일을 위한 뭐시기
	private final String host = "smtp.naver.com";
	private final String user = "dltmdrl7197@naver.com";
	private final String password = "wndvm2wh!";
	private static Mailing mail;
	
	private Properties props;
	// Session 객체를 생성하여 이메일 전송에 필요한 세션 설정
	private Session session;
	
	public static Mailing getMailservice() {
		if(mail==null) mail = new Mailing();
		return mail;
	}
	
	// 생성자 메소드
	private Mailing() {
		// 이메일 전송에 필요한 속성을 설정하기 위해 Properties 객체 생성
		props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);		//네이버는 587
		props.put("mail.smtp.auth", true);		//SMTP 서버 인증여부(네이버는 요구함)
		session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
	}
	
	/**
	 * 관리자가 유저에게 메일을 보내는 메소드
	 * @param email 이메일을 받을 유저의 이메일
	 * @param message 발송할 이메일 내용(2차회원가입url 및 쿼리스트링 조합)
	 * @return 메일발송 성공 : 1, 실패 : 0
	 */
	public int mailing(String email, String message, String subject) {
		//email 객체 생성
		Email emailService = new SimpleEmail();
		
		// SMTP 서버 연결설정
		emailService.setHostName("smtp.naver.com");
		emailService.setSmtpPort(587);	//네이버는 587
		emailService.setCharset("euc-kr");
		emailService.setAuthentication(user, password);	
				
		// SMTP SSL, TLS 설정
		emailService.setSSLOnConnect(true);
		emailService.setStartTLSEnabled(true);
		
		try {
	        // 발신자 ID
			emailService.setFrom(user);
	
	        // 수신자 ID
			emailService.addTo(email);
	        
	        // 메일 제목 설정
			emailService.setSubject(subject);
	
	        // 메일 본문 설정
			emailService.setMsg(message);
	
	        // 메일 전송
			emailService.send();
	        return 1;
		} catch (Exception e) {
          System.out.println("메일 발송에 실패하였습니다." + e.getMessage());
          return 0;
		}
	} // 메일링 메소드 끝
	
	
}
