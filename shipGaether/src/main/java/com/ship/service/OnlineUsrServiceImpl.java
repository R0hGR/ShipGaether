package com.ship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ship.domain.OnlineUsr;
import com.ship.mapper.OnlineUsrMapper;

@Service
public class OnlineUsrServiceImpl implements OnlineUsrService {
	
	@Autowired
	private OnlineUsrMapper mapper;
	
	@Override
	public int selectOnlineUsrS(int usrNum) {
		return mapper.selectOnlineUsr(usrNum);
	}

	@Override
	public void insertOnlineUsrS(int usrNum) {
		mapper.insertOnlineUsr(usrNum);
	}

	@Override
	public List<OnlineUsr> selectAllS() {
		// TODO Auto-generated method stub
		return mapper.selectAll();
	}
	@Override
	public void deleteOnlineUsrS() {
		mapper.deleteOnlineUsr();
	}

}
