package com.ship.mapper;

import java.util.List;

import com.ship.domain.Reply;

public interface ReplyMapper {
	List<Reply> selectThreeMonthsCountReply(int shipNum);
	List<Reply> selectAll();
	List<Reply> selectAllCount();
	
	void insertReply(Reply reply);
	void updateDeepReply(Reply reply);
	
	int selectChildReplys(int replyNum);
	void deleteReply(int replyNum);	
	void updateReplyLikeDelete(int replyNum);
	void updateReply(Reply reply);
	

}
