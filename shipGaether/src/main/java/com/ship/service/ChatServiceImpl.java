package com.ship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.ship.domain.Chat;
import com.ship.mapper.ChatMapper;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatMapper chatMapper;
	
	@Override
	public List<Chat> listS(int roomId) {
		return chatMapper.list(roomId);
	}

	@Override
	public void insertS(Chat chat) {
		chatMapper.insert(chat);
	}

	@Override
	public void deleteS(int chatId) {
		chatMapper.delete(chatId);
	}

	@Override
	public int lastS(int roomId) {
		return chatMapper.last(roomId);
	}
	
	@Override
	public Chat lastChattingS(int chatId) {
		return chatMapper.lastChatting(chatId);
	}
	
	@Override
	public void updateS(int usrNum, String usrPhotoPath) {
		chatMapper.update(usrNum, usrPhotoPath);
	}
}
