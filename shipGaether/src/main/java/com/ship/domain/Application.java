package com.ship.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Application {
	private int appNum; 		// ���Խ�û����ȣ
	private int usrNum; 		// ���Խ�ûȸ����ȣ foreign
	private int shipNum; 		// ���Խ�û���ӹ�ȣ foreign	
	private String appAnswer;	// �������������� �亯
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone="Asia/Seoul")
	private Date appAdate;		// ���Խ�û��¥
	private int appStatus;
	
	///////////////////////////////////////////////
	
	private String usrId; 
	private String usrEmail; 
	private String usrPhone; 
	private String usrPwd;
	private String usrName;
	private String usrNickname;
	private Date usrBirth; 
	//private String usrBirthday;
	private String usrGender; 
	private int usrCity; 
	private int usrTown;
	private int usrPhoto; 
	private String usrPhotoPath;

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone = "Asia/Seoul")
	private Date usrRdate; // ���Գ�¥
	
	
	public Application(Integer usrNum, Integer shipNum) {
		this.usrNum = usrNum;
		this.shipNum = shipNum;
	}
	
	
		
	private String shipName;	// 모임이름
	private String shipTitle;	// 모임소개
	private String shipSurvey;	// survey
	private String shipCaptain;	// 모임장-캡틴
	
	private int shipSample;			//샘플사용여부
	private String shipSampleName;	//샘플이름
	private String shipPhotoName;	//샘플이름
	private String shipBannerName;	//샘플이름
	
	private int cityNum; 		// 도시번호
	private int townNum; 		// 군구번호
	private int limitStatus; 	// 가입연령제한여부
	private Date limitStart;	// 연령제한시작
	private Date limitEnd;		// 연령제한끝
	private int limitGender;		// 연령제한끝
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone="Asia/Seoul")
	private Date shipCdate;		// 모임개설날짜
	private int shipOpen;		// 모임공개여부 0 or 1
	private int shipCount;		// 회원수	
	
	private int sample;		// 샘플사진 사용여부 0 f or 1 t
	
	
}
