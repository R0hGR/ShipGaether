package com.ship.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Reply {
	private int replyNum; // �Խñ� ��ȣ
	private int crewNum; // �ۼ��� Crew��ȣ foreign
	private int boardNum; // �θ�Խñ� �Խñ۹�ȣ
	private int bundleNum; // ���� ����
	private int bundleOrder; // ���� ����
	private int bundleDepth; // ���� ����
	private String replyContent; // ��� ����
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone = "Asia/Seoul")
	private Date replyWdate; // ��� �ۼ���¥
	private int replyChange; // ��� ���� ���� 0,1
	private int replyGood; // ��� ���ƿ� ����
	private int replyOpen; // ��� ���� ���� 0,1
	private String crewPhoto;

	private int count; // ��� ���� ���� 0,1

	private String crewNickname;
	private String month;
	private String monthCount;

}
