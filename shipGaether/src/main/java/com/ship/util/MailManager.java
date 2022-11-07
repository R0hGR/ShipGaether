package com.ship.util;

import javax.mail.internet.MimeMessage;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.ship.util.RandomCode;

@Component
public class MailManager {
   @Autowired
   private JavaMailSender mailSender;
      
   public String sendUsrEmailCode(String usrEmail , String usrName) {
      
      String code = new RandomCode().makeEmailCode(4);
      String mailContent = new MailContent().makeSignUpContent(usrName, code);
      
      String subject = "Ship-Geather에서 보낸 메일입니다";      
      String from = "ship-geather@naver.com";
      String to = usrEmail;
      try {
         MimeMessage mail = mailSender.createMimeMessage();         
         MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
         // true는 멀티파트 메세지를 사용하겠다는 의미
         // 단순한 텍스트일때  
         // MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");

         mailHelper.setFrom(from);
         // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
         // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 하려면
         // mailHelper.setFrom("쉽게더 <ship-gaether@naver.com>");
         mailHelper.setTo(to);
         mailHelper.setSubject(subject);
         mailHelper.setText(mailContent, true);
         // true는 html을 사용하겠다.
         // 단순 텍스트 일때
         // mailHelper.setText(content);
         mailSender.send(mail);

      } catch (Exception e) {
         e.printStackTrace();
      }
      return code;
   }
   
   public String sendUsrFindPwd() {
      
      return "";
   }
}