package com.ship.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Crew {
	private int crewNum; 		// ũ���ȣ
	private int usrNum; 		// ȸ����ȣ foreign
	private int shipNum; 		// ���ӹ�ȣ foreign	
	private String crewRole; 	// ���� �� ����
	private int crewBookmark;	// ���ã�� ����
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone="Asia/Seoul")
	private Date crewJdate;		// ���Գ�¥
	private String crewNickname; 	// ���� �� ����
	private String crewPhoto; 	// ���� �� ����
	
	
   private String month;
   private String monthCount;
	   
	public Crew(int usrNum,int shipNum,String crewRole,int crewBookmark,String usrNickname){
		this.usrNum=usrNum;
		this.shipNum=shipNum;
		this.crewRole=crewRole;
		this.crewBookmark=crewBookmark;
		this.crewNickname=usrNickname;		
	}
	
	public Crew(int usrNum,int shipNum) {
		this.usrNum=usrNum;
		this.shipNum=shipNum;
	}
	
	public Crew(int shipNum,String crewNickname) {
		this.shipNum=shipNum;
		this.crewNickname=crewNickname;
	}
}
