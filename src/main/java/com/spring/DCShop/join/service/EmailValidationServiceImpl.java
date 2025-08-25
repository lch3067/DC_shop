package com.spring.DCShop.join.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailSendException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EmailValidationServiceImpl implements EmailValidationService, InitializingBean {

	private JavaMailSender mailSender;

	// --- SMTP 기본 설정을 @Value로 주입 ---
	@Value("${mail.host}")
	private String host;

	@Value("${mail.port}")
	private int port;

	@Value("${mail.username}")
	private String username;

	@Value("${mail.password}")
	private String password;

	@Value("${mail.protocol}")
	private String protocol;

	@Value("${mail.defaultEncoding}")
	private String defaultEncoding;

	@Value("${mail.from}")
	private String from;

	// 상세 속성
	@Value("${mail.smtp.auth}")
	private String smtpAuth;
	@Value("${mail.smtp.starttls.enable}")
	private String starttlsEnable;
	@Value("${mail.smtp.starttls.required}")
	private String starttlsRequired;
	@Value("${mail.smtp.connectiontimeout}")
	private String connTimeout;
	@Value("${mail.smtp.timeout}")
	private String readTimeout;
	@Value("${mail.smtp.writetimeout}")
	private String writeTimeout;
	@Value("${mail.debug}")
	private String debug;

	// 인증코드 TTL
	@Value("${email.code.ttl.millis}")
	private long codeTtlMillis;

	@Override
	public void afterPropertiesSet() throws Exception {

		// 없으면 내부 생성(프로퍼티 기반)
		JavaMailSenderImpl sender = new JavaMailSenderImpl();
		sender.setHost(host);
		sender.setPort(port);
		sender.setUsername(username);
		sender.setPassword(password);
		sender.setProtocol(protocol);
		sender.setDefaultEncoding(defaultEncoding);

		// ✅ STARTTLS/SSL 등 필수 속성 주입
		Properties props = sender.getJavaMailProperties();
		props.setProperty("mail.smtp.auth", smtpAuth); // "true"
		props.setProperty("mail.smtp.starttls.enable", starttlsEnable); // "true" (587일 때)
		props.setProperty("mail.smtp.starttls.required", starttlsRequired); // "true"
		// 587에서는 SSL off, 465에서는 SSL on
		if (port == 465) {
			props.setProperty("mail.smtp.ssl.enable", "true");
			props.setProperty("mail.smtp.starttls.enable", "false");
			props.setProperty("mail.smtp.starttls.required", "false");
		} else {
			props.setProperty("mail.smtp.ssl.enable", "false");
		}
		props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
		props.setProperty("mail.smtp.connectiontimeout", connTimeout);
		props.setProperty("mail.smtp.timeout", readTimeout);
		props.setProperty("mail.smtp.writetimeout", writeTimeout);
		props.setProperty("mail.mime.charset", defaultEncoding);
		// 필요 시 신뢰 호스트
		props.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com");
		// 임시 디버그
		props.setProperty("mail.debug", debug);

		this.mailSender = sender;

		// (선택) 실제 적용값 로그로 눈으로 확인
		System.out.println("[MAIL] host=" + sender.getHost() + ", port=" + sender.getPort() + ", starttls="
				+ props.getProperty("mail.smtp.starttls.enable") + ", ssl="
				+ props.getProperty("mail.smtp.ssl.enable"));
	}

	@Override
	public String sendValidationCode(HttpServletRequest request) {

		String to = request.getParameter("to");
		System.out.println(to);
		String code = generate6Digits();
		String subject = "[인증번호] " + code;
		String body = new StringBuilder().append("인증번호는 ").append(code).append(" 입니다.\n").append("유효시간: ")
				.append(codeTtlMillis / 1000).append("초").toString();

		sendTextMail(to, subject, body);

		long expireAt = System.currentTimeMillis() + codeTtlMillis;
		request.getSession(true).setAttribute("EMAIL_CODE", code);
		request.getSession().setAttribute("EMAIL_CODE_EXPIRE", expireAt);

		return code;
	}

	@Override
	public Map<String, Object> verifyCode(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<String, Object>();

		Object saved = request.getSession().getAttribute("EMAIL_CODE");
		Object expObj = request.getSession().getAttribute("EMAIL_CODE_EXPIRE");
		String input = request.getParameter("code");

		if (!(saved instanceof String) || !(expObj instanceof Long)) {
			res.put("ok", false);
			res.put("reason", "NO_SESSION"); // 코드 발송 전이거나 세션 만료
			return res;
		}

		long now = System.currentTimeMillis();
		long exp = (Long) expObj;

		if (now > exp) {
			res.put("ok", false);
			res.put("reason", "EXPIRED");
			return res;
		}

		boolean ok = ((String) saved).equals(input);
		res.put("ok", ok);
		if (!ok) {
			res.put("reason", "MISMATCH");
		} else {
			// 일회성 사용
			request.getSession().removeAttribute("EMAIL_CODE");
			request.getSession().removeAttribute("EMAIL_CODE_EXPIRE");
		}
		return res;
	}

	private void sendTextMail(String to, String subject, String text) {
		MimeMessage mime = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(mime, false, defaultEncoding);
			InternetAddress fromAddr = parseFrom(from); // "Name <addr>" 지원
			helper.setFrom(fromAddr);
			helper.setTo(to);
			helper.setSubject(subject);
			helper.setText(text, false);
			mailSender.send(mime);
		} catch (MessagingException e) {
			throw new MailSendException("메일 전송 실패", e);
		}
	}

	private InternetAddress parseFrom(String fromProp) {
		try {
			String name = fromProp;
			String addr = fromProp;
			int lt = fromProp.indexOf('<');
			int gt = fromProp.indexOf('>');
			if (lt >= 0 && gt > lt) {
				name = fromProp.substring(0, lt).trim();
				addr = fromProp.substring(lt + 1, gt).trim();
			}
			return new InternetAddress(addr, name, defaultEncoding);
		} catch (Exception e) {
			// 형식이 이상하면 그대로 세팅 시도
			try {
				return new InternetAddress(fromProp);
			} catch (Exception ex) {
				throw new IllegalArgumentException("mail.from 형식 오류: " + fromProp);
			}
		}
	}

	private String generate6Digits() {
		int randomNumber = (int) (Math.random() * 899999) + 100000;
		return Integer.toString(randomNumber);
	}

}