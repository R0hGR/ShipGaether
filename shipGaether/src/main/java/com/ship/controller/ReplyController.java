package com.ship.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ship.domain.Reply;
import com.ship.domain.ReplyGood;
import com.ship.service.BoardService;
import com.ship.service.ReplyGoodService;
import com.ship.service.ReplyService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	@Autowired
	private ReplyGoodService replyGoodService;
	@Autowired
	private BoardService boardService;
	
	
	@PostMapping("/rest/getReplyCounts")
	public @ResponseBody List<Reply> selectReplyAllCount(){
				
		List<Reply> replyCounts = replyService.selectAllCountS();
		return replyCounts;
	}

	@PostMapping("/rest/insertReply")
	public @ResponseBody String insertReply(Reply reply) {
		log.info(" # insertReply reply : "+ reply);
		if( reply.getBundleOrder() > 0 ) {
			replyService.updateDeepReplyS(reply);
		}
		replyService.insertReplyS(reply);		
		List<Reply> replys = replyService.selectAllCountS();
		
		for( Reply item : replys) {
			log.info(" item : "+ item);
			boardService.syncBoardReplyS(item);
			//싱크
		}
		
		return "";
	}
	
	@PostMapping("/rest/updateReply")
	public @ResponseBody String updateReplyasd(Reply reply) {
		log.info(" # reply : " + reply);
		replyService.updateReplyS(reply);
		return "";
	}
	
	@PostMapping("/rest/deleteReply")
	public @ResponseBody String deleteReply(int replyNum) {
		log.info(" # deleteReply replyNum : "+ replyNum);
		
		replyService.deleteReplyS(replyNum);
		
		//초기화
		boardService.resetBoardReplyS();
		List<Reply> replys = replyService.selectAllCountS();
		for( Reply item : replys) {
			log.info(" item : "+ item);
			boardService.syncBoardReplyS(item);
			//싱크
		}
				
		return "";
	}	
	@PostMapping("/rest/addReplyGood")
	public @ResponseBody ReplyGood addReplyGood(ReplyGood replyGood) {
		log.info(" # addReplyGood replyGood : "+ replyGood); 
		replyGoodService.insertReplyGoodS(replyGood);
		ReplyGood rg = replyGoodService.selectCountS(replyGood.getReplyNum());
		return rg;
	}	
	@PostMapping("/rest/cancelReplyGood")
	public @ResponseBody ReplyGood cancelReplyGood(ReplyGood replyGood) {
		log.info(" # cancelReplyGood replyGood : "+ replyGood);
		replyGoodService.deleteReplyGoodS(replyGood);
		ReplyGood rg = replyGoodService.selectCountS(replyGood.getReplyNum());
		log.info(" # cancelReplyGood rg : "+ rg);
		return rg;
	}	
	@PostMapping("/rest/getReplyGood")
	public @ResponseBody List<ReplyGood> getReplyGood(String request) {
		log.info(" # getReplyGood replyGood : "+request);
		List<ReplyGood> replyGoods = replyGoodService.selectAllS();	
		return replyGoods; 
	}	
	@PostMapping("/rest/getReplyGoodCounts")
	public @ResponseBody List<ReplyGood> getReplyGoodCounts(String request) {
		log.info(" # getReplyGood replyGood : "+request);		
		List<ReplyGood> replyCounts = replyGoodService.selectAllCountS();				
		return replyCounts;
	}	
	
	

}
