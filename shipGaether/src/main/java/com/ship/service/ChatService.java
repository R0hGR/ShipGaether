package com.ship.service;

import java.util.List;

import com.ship.domain.Chat;

public interface ChatService {
	public List<Chat> listS(int roomId);
	public void insertS(Chat chat);
	public void deleteS(int chatId);
	public int lastS(int roomId);
	public void updateS(int usrNum, String usrPhotoPath);
	public Chat lastChattingS(int chatId);
}
