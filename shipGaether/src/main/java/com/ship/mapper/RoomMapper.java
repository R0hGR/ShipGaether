package com.ship.mapper;

import java.util.List;
import java.util.Map;

import com.ship.domain.Room;

public interface RoomMapper {
	public List<Room> list(int roomMember);
	public List<Room> roomInfo(int roomId);
	public Integer maxRoomId();
	public void insert(Room room);
	public void delete(Map<String, Object> map);
	public void update(Room room);
}
