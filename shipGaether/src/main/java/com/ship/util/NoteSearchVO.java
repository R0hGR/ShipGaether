package com.ship.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoteSearchVO {
	private int usrNum;
	private String category;
	private String keyword;
	private String theme; // all , unread , read
	
	public NoteSearchVO( int usrNum, String category, String keyword) {
		this.usrNum=usrNum;
		this.category=category;
		this.keyword=keyword;
	}
	
}
