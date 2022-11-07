package com.ship.service;

import java.util.List;

import com.ship.domain.Reply;


public interface ReplyService {
	List<Reply> selectThreeMonthsCountReplyS(int shipNum);
	List<Reply> selectAllS();
	List<Reply> selectAllCountS();
	
	void insertReplyS(Reply reply);
	void updateDeepReplyS(Reply reply);
	void deleteReplyS(int replyNum);	
	void updateReplyS(Reply reply);
}
