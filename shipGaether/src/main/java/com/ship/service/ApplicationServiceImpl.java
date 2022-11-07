package com.ship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ship.domain.Application;
import com.ship.domain.Notification;
import com.ship.mapper.ApplicationMapper;
import com.ship.mapper.NotificationMapper;

@Service
public class ApplicationServiceImpl implements ApplicationService {
	
	@Autowired
	private ApplicationMapper applicationMapper;
	@Autowired
	private NotificationMapper notificationMapper;
	

	@Override
	public List<Application> selectAllS() {
		return applicationMapper.selectAll();
	}
	@Override
	public List<Application> selectMyIncompleteAppS(int usrNum){
		return applicationMapper.selectMyIncompleteApp(usrNum);
	}
	
	@Override 
	public Application selectMyAppOfShipS(Application application) {
		return applicationMapper.selectMyAppOfShip(application);
	}
	@Override
	public int insertS(Application application) {
		return applicationMapper.insert(application);
	}
	@Override
	public List<Application> selectWithUsrByShipNumS(Integer shipNum) {
		return applicationMapper.selectWithUsrByShipNum(shipNum);
	}
	@Override
	public int deleteS(Application application) {
		return applicationMapper.delete(application);
	}
	@Override
	public int updateAppStatusS(Integer appNum) {
		return applicationMapper.updateAppStatus(appNum);
	}
	
	@Override
	public void deleteMyAppS(Application application) {
		applicationMapper.deleteMyApp(application);
	}
}
