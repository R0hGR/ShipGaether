package com.ship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ship.domain.Board;
import com.ship.domain.BoardGood;
import com.ship.domain.Reply;
import com.ship.mapper.BoardMapper;
import com.ship.util.BoardNumVO;
import com.ship.util.BoardSearchVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;

	@Override
	public List<Board> selectThreeMonthsCountBoardS(int shipNum) {
		return boardMapper.selectThreeMonthsCountBoard(shipNum);
	}

	@Override
	public List<Board> selectAllS() {
		return boardMapper.selectAll();
	}

	@Override
	public List<Board> selectByBoardViewS() {
		return boardMapper.selectByBoardView();
	}

	@Override
	public List<Board> selectAllwithFileS() {
		return boardMapper.selectAllwithFile();
	}

	@Override
	public List<Board> selectBoardOfShipS(int shipNum) {
		return boardMapper.selectBoardOfShip(shipNum);
	}

	@Override
	public List<Board> selectBoardOfShipOrderByS(BoardSearchVO bsvo) {
		return boardMapper.selectBoardOfShipOrderBy(bsvo);
	}

	@Override
	public List<Board> selectBoardByBoardALLS(BoardSearchVO bsvo) {
		return boardMapper.selectBoardByBoardALL(bsvo);
	}

	@Override
	public List<Board> selectBoardByBoardContentS(BoardSearchVO bsvo) {
		return boardMapper.selectBoardByBoardContent(bsvo);
	}

	@Override
	public List<Board> selectBoardByBoardSubjectS(BoardSearchVO bsvo) {
		return boardMapper.selectBoardByBoardSubject(bsvo);
	}

	@Override
	public List<Board> selectBoardByCrewNicknameS(BoardSearchVO bsvo) {
		return boardMapper.selectBoardByCrewNickname(bsvo);
	}

	@Override
	public List<Board> selectAutoBoardSubjectS(BoardSearchVO bsvo) {
		return boardMapper.selectAutoBoardSubject(bsvo);
	}

	@Override
	public void insertNewBoardS(Board board) {
		boardMapper.insertNewBoard(board);
	}

	@Override
	public void updateBoardS(Board board) {
		boardMapper.updateBoard(board);
	}

	@Override
	public void deleteBoardS(int boardNum) {
		boardMapper.deleteBoard(boardNum);
	}

	@Override
	public void updateBoardReplyS(int boardNum) {
		boardMapper.updateBoardReply(boardNum);
	}

	@Override
	public void updateBoardGoodS(int boardNum) {
		boardMapper.updateBoardGood(boardNum);
	}

	@Override
	public void updateBoardViewS(int boardNum) {
		boardMapper.updateBoardView(boardNum);
	}

	@Override
	public void syncBoardGoodS(BoardGood boardGood) {
		boardMapper.syncBoardGood(boardGood);
	}

	@Override
	public void syncBoardReplyS(Reply reply) {
		boardMapper.syncBoardReply(reply);
	}

	@Override
	public Board selectOneBoardS(int boardNum) {
		return boardMapper.selectOneBoard(boardNum);
	}

	@Override
	public BoardNumVO selectSurroundingBoardNumS(BoardNumVO bnvo) {
		return boardMapper.selectSurroundingBoardNum(bnvo);
	}

	@Override
	public void resetBoardGoodS() {
		boardMapper.resetBoardGood();
	}

	@Override
	public void resetBoardReplyS() {
		boardMapper.resetBoardReply();
	}
}
