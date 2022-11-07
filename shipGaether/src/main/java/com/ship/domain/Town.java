package com.ship.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Town {
	private int townNum; 		// 군구 번호	
	private String townName;	// 군구 명
	private int cityNum; 		// 도시 번호 foreign
}
