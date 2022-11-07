package com.ship.service;

import java.util.List;

import com.ship.domain.Board;
import com.ship.domain.BoardGood;
import com.ship.domain.Reply;
import com.ship.util.BoardNumVO;
import com.ship.util.BoardSearchVO;


public interface BoardService {
	List<Board> selectThreeMonthsCountBoardS(int shipNum);
	List<Board> selectAllS();
	List<Board> selectByBoardViewS();
	List<Board> selectAllwithFileS();
	
	List<Board> selectBoardOfShipS(int shipNum);
	List<Board> selectBoardOfShipOrderByS(BoardSearchVO bsvo);
	
	List<Board> selectBoardByBoardALLS(BoardSearchVO bsvo);
	List<Board> selectBoardByBoardContentS(BoardSearchVO bsvo);
	List<Board> selectBoardByBoardSubjectS(BoardSearchVO bsvo);
	List<Board> selectBoardByCrewNicknameS(BoardSearchVO bsvo);	
	List<Board> selectAutoBoardSubjectS(BoardSearchVO bsvo);
	
	void insertNewBoardS(Board board);
	void updateBoardS(Board board);
	void deleteBoardS(int boardNum);
	void updateBoardReplyS(int boardNum);
	void updateBoardGoodS(int boardNum);
	void updateBoardViewS(int boardNum); 
	
	void syncBoardGoodS(BoardGood boardGood);
	void syncBoardReplyS(Reply reply);
	
	Board selectOneBoardS(int boardNum);	
	BoardNumVO selectSurroundingBoardNumS(BoardNumVO bnvo);
	void resetBoardGoodS();
	void resetBoardReplyS();
	
}
	