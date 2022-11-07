package com.ship.mapper;

import java.util.List;

import com.ship.domain.Crew;
import com.ship.domain.Ship;
import com.ship.util.PagingVO;
import com.ship.util.ShipPhotoVO;


public interface ShipMapper {
	List<Ship> selectAll();
	List<Ship> selectShipOfUsr(int usrNum);
	List<Ship> selectShipPeople(int usrNum);
	
	List<Ship> selectMyShip(int usrNum);
	List<Ship> selectMyBookmarkShip(int usrNum);
	
	
	void insertNewShip(Ship newShip);
	void updateShipPhoto(ShipPhotoVO shipPhotoVO);
	void updateShipSampleUse(int shipNum);
		
	//추가
	Ship selectShip(Integer shipNum);
	int selectCountShip();
	List<Ship> selectRecShip(PagingVO PVO);
	int deleteShip(Ship ship);
	
	void updateShipName(Ship ship);
	void updateShipTitle(Ship ship);
	void updateShipSurvey(Ship ship);
	void updateShipCity(Ship ship);
	void updateShipLimitGender(Ship ship);
	void updateShipOpen(Ship ship);
	void updateShipPhotoName(Ship ship);
	void updateShipPhotoNameSample(Ship ship);
	void updateShipBannerName(Ship ship);
	void updateShipLimit(Ship ship);
	void updateNoShipLimit(int shipNum);
	void updateShipLocation(Ship ship);
	int updateShipCount(int shipNum);
	void updateShipCaptain(Crew crew);
	
}
