package com.ship.mapper;

import java.util.List;

import com.ship.domain.City;
import com.ship.domain.Ship;

public interface SearchMapper {
	List<Ship> searchShip(String keyword);	
	
}
