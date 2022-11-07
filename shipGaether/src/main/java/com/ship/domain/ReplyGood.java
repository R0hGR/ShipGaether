package com.ship.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReplyGood {
	private int replyGoodNum; 	// ������ƿ� ��ȣ
	private int crewNum; 		// ������ƿ� ������� foreign
	 
	private int replyNum; 		// ���ƿ� ���� ��� foreign
	private int count; 		// ���ƿ� ���� ��� foreign
	
	public ReplyGood(int crewNum , int replyNum) {
		this.crewNum=crewNum;
		this.replyNum=replyNum;
	}
}
