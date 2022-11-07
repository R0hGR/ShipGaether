package com.ship.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardNumVO {
	private int boardNum;
	private int shipNum;
	private int preBoardNum;
	private int nextBoardNum;
	
	public BoardNumVO(int boardNum, int shipNum ) {
		this.boardNum=boardNum;
		this.shipNum=shipNum;
	}

}
