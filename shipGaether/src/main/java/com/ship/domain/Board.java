package com.ship.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Board {
	private int boardNum; // �Խñ� ��ȣ
	private int bundleNum; // ���� ��ȣ
	private int bundleOrder; // ���� ����
	private int bundleDepth; // ���� ����
	private String boardWriter; // �Խñ� �ۼ���
	private String boardSubject; // �Խñ� ����
	private String boardContent; // �Խñ� ����
	private int boardChange; // �Խñ� ���� ���� 0,1
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone = "Asia/Seoul")
	private Date boardWdate; // �Խñ��ۼ���¥
	private int boardView; // �Խñ� ��ȸ��
	private int boardGood; // �Խñ� ���ƿ� ����
	private int boardReply; // �Խñ� ���ƿ� ����
	private int boardOpen; // �Խñ� ���� ���� 0,1
	private int crewNum; // �ۼ��� Crew��ȣ foreign

	private String crewPhoto; // �ۼ��� Crew��ȣ foreign
	private int boardFileCount; // �ۼ��� Crew��ȣ foreign

	private String boardImg;
	private String boardText;
	private int popularCount;
	private int boardRank;

	private String crewNickname; // �Խñ� ����
	
   private String month;
   private String monthCount;
	   
}
