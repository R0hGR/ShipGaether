package com.ship.mapper;

import java.util.List;

import com.ship.domain.Application;

public interface ApplicationMapper {
	List<Application> selectAll();
	List<Application> selectMyIncompleteApp(int usrNum);
	
	
	Application selectMyAppOfShip(Application application);
	int insert(Application application);
	List<Application> selectWithUsrByShipNum(Integer shipNum);
	int delete(Application application);
	int updateAppStatus(Integer appNum);
	
	void deleteMyApp(Application application);
}
