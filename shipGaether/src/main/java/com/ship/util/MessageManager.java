package com.ship.util;

import java.util.HashMap;

import org.springframework.stereotype.Component;

import com.ship.util.RandomCode;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Component
public class MessageManager {
	
	public String sendUsrPhoneCode(String to) throws CoolsmsException{
		
		String apiKey = "NCSTENSYCZ2P2WZK"; // ���� ����ȸ�� : COOLSMS  / �� �����ϰ� ���� apiKey��
		String apiSecret = "U5ALK5TXDRVGVJYKLURLPWISZ8NYXYGQ";
		
		Message coolsms = new Message(apiKey, apiSecret);
		
		String phoneCode = new RandomCode().makePhoneCode(4);		  
		
		HashMap<String, String> message = new HashMap<String, String>();
		message.put("to", to);    // ������ȭ��ȣ (ajax�� view ȭ�鿡�� �޾ƿ� ������ �ѱ�)
		message.put("from", "01087648381");    // �߽���ȭ��ȣ. �׽�Ʈ�ÿ��� �߽�,���� �Ѵ� ���� ��ȣ�� �ϸ� ��
		message.put("type", "sms");
		message.put("text", "안녕하세요. \n Ship-Gaether 입니다. \n 인증번호는 [" + phoneCode + "] 입니다.");
		
	    coolsms.send(message); // �޽��� ����
		return phoneCode;
	}
}
