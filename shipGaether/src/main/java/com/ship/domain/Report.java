package com.ship.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Report {
	private int reportNum; 			// 신고번호
	private int usrNum; 			// 신고한 회원번호 foreign
	private int shipNum; 			// 신고당한 모임번호 foreign	
	private String reportContent;	// 신고내용
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone="Asia/Seoul")
	private Date reportRdate;		// 신고날짜		
	private int reportStatus;		// 신고  처리 상태 0,1
}
