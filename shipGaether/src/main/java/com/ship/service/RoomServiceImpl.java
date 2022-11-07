package com.ship.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.ship.domain.Room;
import com.ship.mapper.RoomMapper;

@Service
public class RoomServiceImpl implements RoomService{

	@Autowired
	private RoomMapper roomMapper;
	
	@Override
	public List<Room> listS(int roomMember) {
		return roomMapper.list(roomMember);
	}
	
	@Override
	public List<Room> roomInfoS(int roomId) {
		return roomMapper.roomInfo(roomId);
	}
	
	@Override
	public Integer maxRoomIdS() {
		return roomMapper.maxRoomId();
	}
	
	@Override
	public void insertS(Room room) {
		roomMapper.insert(room);
	}

	@Override
	public void deleteS(Map<String, Object> map) {
		roomMapper.delete(map);
	}

	@Override
	public void updateS(Room room) {
		roomMapper.update(room);
	}

}
