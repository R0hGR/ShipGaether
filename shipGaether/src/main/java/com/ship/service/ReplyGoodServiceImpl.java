package com.ship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ship.domain.ReplyGood;
import com.ship.mapper.ReplyGoodMapper;

@Service
public class ReplyGoodServiceImpl implements ReplyGoodService {
	@Autowired
	private ReplyGoodMapper replyGoodMapper;

	@Override
	public List<ReplyGood> selectAllS() {
		return replyGoodMapper.selectAll();
	}
	@Override
	public void insertReplyGoodS(ReplyGood replyGood) {
		replyGoodMapper.insertReplyGood(replyGood);		
	}
	@Override
	public void deleteReplyGoodS(ReplyGood replyGood) {
		replyGoodMapper.deleteReplyGood(replyGood);		
	}
	@Override
	public List<ReplyGood> selectAllCountS(){
		return replyGoodMapper.selectAllCount();
	}
	
	@Override
	public ReplyGood selectCountS(int replyNum) {
		return replyGoodMapper.selectCount(replyNum);
	}

}
