package com.ship.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Notification {
	private int notiNum; 		// 알림 번호
	private String notiSubject;	// 알림 제목
	private String notiContent;	// 알림 내용
	private int notiStatus; 	// 알림 확인 상태
		
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone="Asia/Seoul")
	private Date notiWdate;		// 알림등록날짜
		
	private int usrNum; 		// 알림받을 회원번호 foreign 
	private int shipNum;		// 알림보낸 모임번호 foreign
	
}
