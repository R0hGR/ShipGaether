package com.ship.service;

import java.util.List;
import java.util.Map;

import com.ship.domain.Chat;
import com.ship.domain.Room;

public interface RoomService {
	public List<Room> listS(int roomMember);
	public List<Room> roomInfoS(int roomId);
	public Integer maxRoomIdS();
	public void insertS(Room room);
	public void deleteS(Map<String, Object> map);
	public void updateS(Room room);
}

