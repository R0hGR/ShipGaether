package com.ship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ship.domain.City;
import com.ship.domain.Ship;
import com.ship.mapper.SearchMapper;

@Service
public class SearchServiceImpl implements SearchService {
	@Autowired
	private SearchMapper searchMapper;
	
	@Override
	public List<Ship> searchShipS(String keyword) {	
		return searchMapper.searchShip(keyword);
	}
	
	
	
}
