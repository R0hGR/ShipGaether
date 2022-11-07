package com.ship.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ship.domain.Chat;
import com.ship.service.ChatService;
import com.ship.service.UsrService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	@Autowired
	UsrService usrService;
	
	@GetMapping("/chat")
	public List<Chat> list(int roomId, HttpSession session){
		List<Chat> listN = chatService.listS(roomId);
		for(Chat list: listN) {
			if(list.getChatSender().equals((session.getAttribute("sessionId")+""))) {
			}else{
				if(list.getUsrPhotoPath().equals("default")){
					list.setUsrPhotoPath("images/defaultPhoto.jpg");
				}else {
					list.setUsrPhotoPath("images/ship/usr/"+list.getChatSender()+"/"+list.getUsrPhotoPath());
				}
				list.setChatSender(usrService.usrInfoS(Integer.parseInt(list.getChatSender())).getUsrNickname());
			}
		}
		log.info(listN);
		return listN;
	}
	
	@RequestMapping(value="/chat/insert", method=RequestMethod.POST)
	public int insert(Chat chat){
		chatService.insertS(chat);
		System.out.println("chat......." + chat);
		Integer last = chatService.lastS(chat.getRoomId());
		System.out.println("last......." + last);
		return last;
	}
	
	@RequestMapping(value="/chat/delete", method=RequestMethod.POST)
	public void delete(int chatId){
		chatService.deleteS(chatId);
	}
}
