package com.ship.service;

import java.util.List;

import com.ship.domain.Town;

public interface TownService {
	List<Town> selectAllS();
	List<Town> getTownS(int cityNum);
}
