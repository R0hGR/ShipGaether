package com.ship.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Survey {
	private int surveyNum; 			// 가입질문번호
	private int shipNum; 			// 가입질문한 모임번호 foreign
	private String surveyContent;	// 가입질문내용
}
