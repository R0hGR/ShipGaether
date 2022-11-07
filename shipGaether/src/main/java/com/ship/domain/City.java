package com.ship.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class City {
	private int cityNum; 		// 시도 번호
	private String cityName;	// 시도 명
	
//	private int city_Num; 		// 시도 번호	
//	private String city_Name;	// 시도 명	
}
