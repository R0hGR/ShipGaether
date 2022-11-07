package com.ship.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Registration {
	private int regNum; 		// 만남신청서 번호
	private int crewNum;		// 만남 신청한 crew번호 foreign
	private int meetNum;		// 신청당한 만남 meet번호 foreign
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone="Asia/Seoul")
	private Date regRdate;		// 만남신청서 작성날짜	
}
