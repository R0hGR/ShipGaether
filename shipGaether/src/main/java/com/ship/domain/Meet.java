package com.ship.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Meet {
	private int meetNum; 		// 만남 번호
	private int shipNum; 		// 만남이 속한 모임 번호 foreign
	private String meetLoc;		// 만남 장소
	private String meetContent;	// 만남 내용
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone="Asia/Seoul")
	private Date meetMdate;		// 만날 날짜
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone="Asia/Seoul")
	private Date meetWdate;		// 만남 작성날짜
	
	private int meetStatus; 	// 만남 상태 0신청받고있는지 1성사된만남인지 
	private int limitStatus;	// 만남 인원제한 여부 0,1
	private int limitEnd; 		// 만남 인원제한 몇명 까지
	
}
