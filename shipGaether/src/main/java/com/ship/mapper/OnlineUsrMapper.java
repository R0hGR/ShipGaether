package com.ship.mapper;

import java.util.List;

import com.ship.domain.OnlineUsr;

public interface OnlineUsrMapper {
	int selectOnlineUsr(int usrNum);
	void insertOnlineUsr(int usrNum);
	List<OnlineUsr> selectAll();
	void deleteOnlineUsr();
}
