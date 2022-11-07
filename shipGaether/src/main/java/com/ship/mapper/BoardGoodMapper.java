package com.ship.mapper;

import java.util.List;

import com.ship.domain.BoardGood;


public interface BoardGoodMapper {
	List<BoardGood> selectAll();
	List<BoardGood> selectAllCount();
	void insertBoardGood(BoardGood boardGood);
	void deleteBoardGood(BoardGood boardGood);
	BoardGood selectCount(int boardNum);
}
