package com.ship.util;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.stereotype.Component;

@WebListener
@Component
public class ShipSessionListener implements HttpSessionListener, HttpSessionAttributeListener {

	private static final Set<Integer> sessionNums = new HashSet<Integer>();
	private static int sessionDelNum;
	
	private static final Map<Integer, HttpSession> sessions = new ConcurrentHashMap<>();

	@Override
	public void sessionCreated(HttpSessionEvent hse) {
		String sessionId = (String) hse.getSession().getId();
		System.out.println("# sessionCreated!!!! 방금 생성된 세션아이디 : " + sessionId);
				
	}

	
	@Override
	public void sessionDestroyed(HttpSessionEvent hse) {
		System.out.println("# sessionDestroyed!!!! ");
		HttpSession session = hse.getSession();
		Integer sessionId = (Integer)session.getAttribute("sessionId");
		if(sessionId != null) {
			System.out.println(" # sessionDestroyed sessionId :"+sessionId);		
			sessionNums.remove(sessionId);
			ShipSessionListener.sessionDelNum=sessionId;			
		}

	}

	@Override
	public void attributeAdded(HttpSessionBindingEvent hsbe) {
		// 프라퍼티 추가시 호출
		
		if (hsbe.getName() == "sessionId") {
			System.out.println("if절 들어옴 시작 : " + (Integer) hsbe.getSession().getAttribute("sessionId"));
			System.out.println(hsbe.getSession().getAttribute("sessionId").getClass());
			int usrNum = (int) hsbe.getSession().getAttribute("sessionId");
			System.out.println(" # usrNum : " + usrNum);
			sessions.put((Integer) hsbe.getSession().getAttribute("sessionId"), hsbe.getSession());
			sessionNums.add((Integer)hsbe.getSession().getAttribute("sessionId"));
			System.out.println("if절 들어옴 끝 : " + sessions);
		}
		System.out.println(" ------------------------------------------------------- ");
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent hsbe) {
		// TODO Auto-generated method stub
		// 세션 값 변경시 호출 , HttpSessionAttributeListener
		System.out.println(" # attributeReplaced : " + hsbe.getName());
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent hsbe) {
		System.out.println(" # attributeRemoved ");		
	}

	public static Map<Integer, HttpSession> getOnlineSessions() {
		return sessions;
	}
	
	public static Set<Integer> getOnlineSessionNums() {
		return sessionNums;
	}
	
	public static int getSessionDelNum() {
		return sessionDelNum;
	}

}
