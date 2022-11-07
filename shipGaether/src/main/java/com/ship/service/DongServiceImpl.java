package com.ship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ship.domain.Dong;
import com.ship.mapper.DongMapper;

@Service
public class DongServiceImpl implements DongService {
	@Autowired
	private DongMapper dongMapper;

	@Override
	public List<Dong> selectAllS() {
		return dongMapper.selectAll();
	}
	
	@Override
	public List<Dong> getDongS(int townNum){
		return dongMapper.getDong(townNum);		
	}

}
