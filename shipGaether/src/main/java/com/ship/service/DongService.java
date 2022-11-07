package com.ship.service;

import java.util.List;

import com.ship.domain.Dong;

public interface DongService {
	List<Dong> selectAllS();
	List<Dong> getDongS(int townNum);
}
