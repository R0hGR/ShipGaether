package com.ship.mapper;

import java.util.List;

import com.ship.domain.Board;
import com.ship.domain.BoardGood;
import com.ship.domain.Reply;
import com.ship.util.BoardNumVO;
import com.ship.util.BoardSearchVO;

public interface BoardMapper {

	List<Board> selectThreeMonthsCountBoard(int shipNum);

	List<Board> selectAll();

	List<Board> selectByBoardView();

	List<Board> selectAllwithFile();

	List<Board> selectBoardOfShip(int shipNum);

	List<Board> selectBoardOfShipOrderBy(BoardSearchVO bsvo);

	List<Board> selectBoardByBoardALL(BoardSearchVO bsvo);

	List<Board> selectBoardByBoardContent(BoardSearchVO bsvo);

	List<Board> selectBoardByBoardSubject(BoardSearchVO bsvo);

	List<Board> selectBoardByCrewNickname(BoardSearchVO bsvo);

	List<Board> selectAutoBoardSubject(BoardSearchVO bsvo);

	void insertNewBoard(Board board);

	void updateBoard(Board board);

	void deleteBoard(int boardNum);

	void updateBoardReply(int boardNum);

	void updateBoardGood(int boardNum);

	void updateBoardView(int boardNum);

	void syncBoardGood(BoardGood boardGood);

	void syncBoardReply(Reply reply);

	Board selectOneBoard(int boardNum);

	BoardNumVO selectSurroundingBoardNum(BoardNumVO bnvo);

	void resetBoardGood();

	void resetBoardReply();

}