package com.ship.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BoardGood {
	private int boardGoodNum; 	// �Խñ����ƿ� ��ȣ
	private int crewNum; 		// �Խñ����ƿ� ������� foreign
	private int boardNum; 		// ���ƿ� ���� �Խñ� foreign
	private int count; 		// ���ƿ� ���� �Խñ� foreign
}
