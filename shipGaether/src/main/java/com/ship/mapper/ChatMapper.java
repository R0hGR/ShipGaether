package com.ship.mapper;

import java.util.List;

import com.ship.domain.Chat;

public interface ChatMapper {
	public List<Chat> list(int roomId);
	public void insert(Chat chat);
	public void delete(int chatId);
	public void update(int usrNum, String usrPhotoPath);
	public int last(int roomId);
	public Chat lastChatting(int chatId);
}
