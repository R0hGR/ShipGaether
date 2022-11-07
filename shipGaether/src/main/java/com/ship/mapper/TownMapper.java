package com.ship.mapper;

import java.util.List;

import com.ship.domain.Town;

public interface TownMapper {
	List<Town> selectAll();
	List<Town> getTown(int cityNum);

}
