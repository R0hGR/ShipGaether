package com.ship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ship.domain.Meet;
import com.ship.mapper.MeetMapper;

@Service
public class MeetServiceImpl implements MeetService {
	@Autowired
	private MeetMapper meetMapper;

	@Override
	public List<Meet> selectAllS() {
		return meetMapper.selectAll();
	}

}
