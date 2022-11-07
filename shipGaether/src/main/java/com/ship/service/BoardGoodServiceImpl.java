package com.ship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ship.domain.BoardGood;
import com.ship.mapper.BoardGoodMapper;

@Service
public class BoardGoodServiceImpl implements BoardGoodService {
	@Autowired
	private BoardGoodMapper boardGoodMapper;

	@Override
	public List<BoardGood> selectAllS() {
		return boardGoodMapper.selectAll();
	}
	@Override
	public List<BoardGood> selectAllCountS(){
		return boardGoodMapper.selectAllCount();
	}
	
	@Override
	public void insertBoardGoodS(BoardGood boardGood) {
		boardGoodMapper.insertBoardGood(boardGood);
	}
	
	@Override
	public BoardGood selectCountS(int boardNum) {
		return boardGoodMapper.selectCount(boardNum);
	}
	
	@Override
	public void deleteBoardGoodS(BoardGood boardGood) {
		boardGoodMapper.deleteBoardGood(boardGood);
	}
	

}
