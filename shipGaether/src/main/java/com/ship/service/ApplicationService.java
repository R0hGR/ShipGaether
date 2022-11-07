package com.ship.service;

import java.util.List;

import com.ship.domain.Application;

public interface ApplicationService {
	List<Application> selectAllS();
	List<Application> selectMyIncompleteAppS(int usrNum);
	
	Application selectMyAppOfShipS(Application application);
	int insertS(Application application);
	List<Application> selectWithUsrByShipNumS(Integer shipNum);
	int deleteS(Application application);
	int updateAppStatusS(Integer appNum);
	
	void deleteMyAppS(Application application);
}
