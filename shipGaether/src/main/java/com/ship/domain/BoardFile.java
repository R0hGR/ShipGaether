package com.ship.domain;

import java.sql.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BoardFile {
	private int boardFileNum;
	private	String boardFileName;	// 원래 이름
	private String boardFileSaveName;	// 저장 될 이름
	private int boardFileSize;	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone="Asia/Seoul")
	private Date boardFileUdate;
	private int boardFileStatus;
	private int boardNum;
	
	private int count;
	
	
	public BoardFile(String boardFileName, String boardFileSaveName ,int boardFileSize) {
		this.boardFileName = boardFileName;
		this.boardFileSaveName = boardFileSaveName;
		this.boardFileSize = boardFileSize;		
	}
	

	

}
