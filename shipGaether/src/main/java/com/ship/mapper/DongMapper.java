package com.ship.mapper;

import java.util.List;

import com.ship.domain.Dong;

public interface DongMapper {
	List<Dong> selectAll();
	List<Dong> getDong(int townNum);

}
