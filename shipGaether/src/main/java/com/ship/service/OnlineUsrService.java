package com.ship.service;

import java.util.List;

import com.ship.domain.Application;
import com.ship.domain.OnlineUsr;

public interface OnlineUsrService {
	int selectOnlineUsrS(int usrNum);
	void insertOnlineUsrS(int usrNum);
	List<OnlineUsr> selectAllS();
	void deleteOnlineUsrS();
}
