package com.ship.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Dong {
	private int dongNum; 		// ���� ��ȣ	
	private String dongName;	// ���� ��
	private int townNum; 		// ���� ��ȣ foreign
	private double dongX; 		// ���� ��ȣ foreign
	private double dongY; 		// ���� ��ȣ foreign
}
