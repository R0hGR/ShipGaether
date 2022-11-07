package com.ship.mapper;

import java.util.List;

import com.ship.domain.ReplyGood;

public interface ReplyGoodMapper {
	List<ReplyGood> selectAll();
	List<ReplyGood> selectAllCount();
	ReplyGood selectCount(int replyNum);
	void insertReplyGood(ReplyGood replyGood);
	void deleteReplyGood(ReplyGood replyGood);

}
