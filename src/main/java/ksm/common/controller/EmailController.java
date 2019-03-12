package ksm.common.controller;

import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ksm.common.common.CommandMap;
import ksm.member.service.MemberService;

@Controller
public class EmailController {
	@Resource(name = "memberService")
	private MemberService memberService;
	
	@RequestMapping("/emailAuth")
	public ModelAndView emailAuth(HttpServletResponse response, HttpServletRequest request,CommandMap commandMap) throws Exception
	{
		
		String email = (String) commandMap.get("member_email");
		String authNum = "";
		
		System.out.println(email);
		
		authNum = RandomNum();
		sendEmail(email,authNum);
		
		ModelAndView mav = new ModelAndView("/member/emailauth");
		mav.addObject("email",email);
		mav.addObject("authNum",authNum);
		
		return mav;
	}
	
	private void sendEmail(String email, String authNum)
	{
		String host = "smtp.gmail.com";
		String subject = "KingsMan 인증번호 전달";
		String fromName = "KingsMan 관리자";
		String from = "khiclass@gmail.com";
		String to1 = email;
		String content = "인증번호 ["+authNum+"]";
		
		try
		{
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			
			Session mailSession = Session.getInstance(props, 
				new javax.mail.Authenticator()
				{
					protected PasswordAuthentication getPasswordAuthentication()
					{
						return new PasswordAuthentication("khiclass@gmail.com","khacademy");
					}
				});
			
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from,MimeUtility.encodeText(fromName,"UTF-8","B"))); //보내는사람
			InternetAddress[] address1 = {new InternetAddress(to1)};
			msg.setRecipients(Message.RecipientType.TO, address1); // 받는 사람설정 1
			msg.setSubject(subject); // 제목 설정
			msg.setSentDate(new java.util.Date()); // 보내는 날짜 설정 
			msg.setContent(content,"text/html;charset=euc-kr"); // 내용 설정(HTML 형식)
			
			Transport.send(msg);
		}
		catch(MessagingException e)
		{
			e.printStackTrace();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public String RandomNum()
	{
		StringBuffer buffer = new StringBuffer();
		
		for(int i=0;i<=6;i++)
		{
			int n = (int)(Math.random()*10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	
	@RequestMapping("/emailAuth2")
	public ModelAndView emailAuth2(HttpServletResponse response, HttpServletRequest request,CommandMap commandMap) throws Exception
	{
		
		String pw = memberService.selectFindPw(commandMap.getMap());
		
		String email = (String) commandMap.get("member_email");
		String authNum = pw;
		
		System.out.println(email);
		System.out.println(pw);
		
		sendEmail2(email,authNum);
		
		ModelAndView mav = new ModelAndView("result_pw.member");
		mav.addObject("pw",pw);
		mav.addObject("email",email);
		mav.addObject("authNum",authNum);
		
		return mav;
	}
	
	private void sendEmail2(String email, String authNum)
	{
		String host = "smtp.gmail.com";
		String subject = "KingsMan 비밀번호 전달";
		String fromName = "KingsMan 관리자";
		String from = "khiclass@gmail.com";
		String to1 = email;
		String content = "비밀번호는 ["+authNum+"]"+" 입니다.";
		
		try
		{
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			
			Session mailSession = Session.getInstance(props, 
				new javax.mail.Authenticator()
				{
					protected PasswordAuthentication getPasswordAuthentication()
					{
						return new PasswordAuthentication("khiclass@gmail.com","khacademy");
					}
				});
			
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from,MimeUtility.encodeText(fromName,"UTF-8","B"))); //보내는사람
			InternetAddress[] address1 = {new InternetAddress(to1)};
			msg.setRecipients(Message.RecipientType.TO, address1); // 받는 사람설정 1
			msg.setSubject(subject); // 제목 설정
			msg.setSentDate(new java.util.Date()); // 보내는 날짜 설정 
			msg.setContent(content,"text/html;charset=euc-kr"); // 내용 설정(HTML 형식)
			
			Transport.send(msg);
		}
		catch(MessagingException e)
		{
			e.printStackTrace();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
