package com.ship.service;

import java.util.List;

import com.ship.domain.ReplyGood;


public interface ReplyGoodService {
	List<ReplyGood> selectAllS();
	List<ReplyGood> selectAllCountS();
	ReplyGood selectCountS(int replyNum);
	void insertReplyGoodS(ReplyGood replyGood);
	void deleteReplyGoodS(ReplyGood replyGood);
}
