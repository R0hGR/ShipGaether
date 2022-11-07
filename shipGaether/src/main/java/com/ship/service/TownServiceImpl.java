package com.ship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ship.domain.Town;
import com.ship.mapper.TownMapper;

@Service
public class TownServiceImpl implements TownService {
	@Autowired
	private TownMapper townMapper;

	@Override
	public List<Town> selectAllS() {
		return townMapper.selectAll();
	}
	
	@Override
	public List<Town> getTownS(int cityNum){
		return townMapper.getTown(cityNum);		
	}

}
