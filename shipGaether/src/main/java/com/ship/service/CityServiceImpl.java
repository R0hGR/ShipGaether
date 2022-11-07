package com.ship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ship.domain.City;
import com.ship.domain.Crew;
import com.ship.mapper.CityMapper;

@Service
public class CityServiceImpl implements CityService {
	@Autowired
	private CityMapper cityMapper;

	@Override
	public List<City> selectAllS() { 
		return cityMapper.selectAll();
	}

	
}
