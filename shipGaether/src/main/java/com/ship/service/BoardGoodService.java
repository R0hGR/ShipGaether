package com.ship.service;

import java.util.List;

import com.ship.domain.BoardGood;


public interface BoardGoodService {
	List<BoardGood> selectAllS();
	List<BoardGood> selectAllCountS();
	void insertBoardGoodS(BoardGood boardGood);
	void deleteBoardGoodS(BoardGood boardGood);
	BoardGood selectCountS(int boardNum);
	
}
