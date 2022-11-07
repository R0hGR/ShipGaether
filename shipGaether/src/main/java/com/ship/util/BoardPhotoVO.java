package com.ship.util;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardPhotoVO {
	
	
	//	board_file col
	private int boardFileNum;
	private	String boardFileName;	// 원래 이름
	private String boardFileSaveName;	// 저장 될 이름
	private int boardFileSize;	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone="Asia/Seoul")
	private Date boardFileUdate;
	private int boardFileStatus;	

	//	board col	
	private int boardNum; 			// �Խñ� ��ȣ
	private int bundleNum; 			// ���� ��ȣ
	private int bundleOrder;		// ���� ����
	private int bundleDepth;		// ���� ����
	private String boardWriter;		// �Խñ� �ۼ���
	private String boardSubject;	// �Խñ� ����
	private String boardContent;	// �Խñ� ����
	private int boardChange;		// �Խñ� ���� ���� 	0,1
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone="Asia/Seoul")
	private Date boardWdate;		// �Խñ��ۼ���¥
	private int boardView;			// �Խñ� ��ȸ��
	private int boardGood;			// �Խñ� ���ƿ� ����
	private int boardReply;			// �Խñ� ���ƿ� ����
	private int boardOpen;			// �Խñ� ���� ���� 	0,1
	private int crewNum;			// �ۼ��� Crew��ȣ foreign
}
