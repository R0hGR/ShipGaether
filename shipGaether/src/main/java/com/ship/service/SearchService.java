package com.ship.service;

import java.util.List;

import com.ship.domain.City;
import com.ship.domain.Ship;

public interface SearchService {
	List<Ship> searchShipS(String keyword);

}
	
