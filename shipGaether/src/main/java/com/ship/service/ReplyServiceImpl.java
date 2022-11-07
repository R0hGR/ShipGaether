package com.ship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ship.domain.Reply;
import com.ship.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyMapper replyMapper;

	@Override
	public List<Reply> selectThreeMonthsCountReplyS(int shipNum) {
		return replyMapper.selectThreeMonthsCountReply(shipNum);
	}

	@Override
	public List<Reply> selectAllS() {
		return replyMapper.selectAll();
	}

	@Override
	public List<Reply> selectAllCountS() {
		return replyMapper.selectAllCount();
	}

	@Override
	public void insertReplyS(Reply reply) {
		replyMapper.insertReply(reply);
	}

	@Override
	public void updateDeepReplyS(Reply reply) {
		replyMapper.updateDeepReply(reply);
	}

	@Override
	public void deleteReplyS(int replyNum) {
		int childrens = replyMapper.selectChildReplys(replyNum);
		if (childrens > 1) {
			replyMapper.updateReplyLikeDelete(replyNum);
		} else {
			replyMapper.deleteReply(replyNum);
		}
	}

	@Override
	public void updateReplyS(Reply reply) {
		replyMapper.updateReply(reply);
	}
}
