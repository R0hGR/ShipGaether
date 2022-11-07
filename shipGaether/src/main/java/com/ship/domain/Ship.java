package com.ship.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Ship {
	private int shipNum; 		// 모임번호
	private String shipName;	// 모임이름
	private String shipTitle;	// 모임소개
	private String shipSurvey;	// survey
	private String shipCaptain;	// 모임장-캡틴
	
	private int shipSample;			//샘플사용여부
	private String shipSampleName;	//샘플이름
	private String shipPhotoName;	//샘플이름
	private String shipBannerName;	//샘플이름
	
	private int cityNum; 		// 도시번호
	private int townNum; 	
	private int dongNum; // 군구번호
	private int limitStatus; 	// 가입연령제한여부
	private Date limitStart;	// 연령제한시작
	private Date limitEnd;		// 연령제한끝
	private int limitGender;		// 연령제한끝
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone="Asia/Seoul")
	private Date shipCdate;		// 모임개설날짜
	private int shipOpen;		// 모임공개여부 0 or 1
	private int shipCount;		// 회원수	
	private int usrNum;			// 캡틴의 회원번호 foreign
	
	private int sample;		// 샘플사진 사용여부 0 f or 1 t
	
	private String updateThing;
	
	//add
	public Ship(Integer shipNum, Integer usrNum) {
		this.shipNum = shipNum;
		this.usrNum = usrNum;
	}
	public Ship(int shipNum, String updateThing) {
		this.shipNum = shipNum;
		this.updateThing = updateThing;
	}
	public Ship(int shipNum, Date limitStart , Date limitEnd) {
		this.shipNum = shipNum;
		this.limitStart = limitStart;
		this.limitEnd = limitEnd;
	}
	
	public Ship(int shipNum, Integer cityNum, Integer townNum, Integer dongNum) {
		this.shipNum = shipNum;
		this.cityNum = cityNum;
		this.townNum = townNum;
		this.dongNum = dongNum;
	}
	
	private int crewNum; 		// ũ���ȣ
	private String crewRole; 	// ���� �� ����
	private int crewBookmark;	// ���ã�� ����
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone="Asia/Seoul")
	private Date crewJdate;		// ���Գ�¥
	private String crewNickname; 	// ���� �� ����
	private String crewPhoto; 	// ���� �� ����
	
	private int myUsrNum;			// 캡틴의 회원번호 foreign
}
