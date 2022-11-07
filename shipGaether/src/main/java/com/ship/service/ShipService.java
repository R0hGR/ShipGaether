package com.ship.service;

import java.util.List;

import com.ship.domain.Crew;
import com.ship.domain.Ship;
import com.ship.util.PagingVO;
import com.ship.util.ShipPhotoVO;

public interface ShipService {
	List<Ship> selectAllS();
	List<Ship> selectShipOfUsrS(int usrNum);
	List<Ship> selectShipPeopleS(int usrNum);
	
	List<Ship> selectMyShipS(int usrNum);
	List<Ship> selectMyBookmarkShipS(int usrNum);
	
	void insertNewShipS(Ship newShip);
	void updateShipPhotoS(ShipPhotoVO shipPhotoVO);
	void updateShipSampleUseS(int shipNum);
	
	Ship selectShipS(Integer shipNum); 
	int selectCountShipS();
	List<Ship> selectRecShipS(PagingVO PVO);
	
	int deleteShipS(Ship ship);
	void updateShipCityS(Ship ship);
	void updateShipNameS(Ship ship);
	void updateShipTitleS(Ship ship);
	void updateShipSurveyS(Ship ship);
	void updateShipLimitGenderS(Ship ship);
	void updateShipOpenS(Ship ship);
	void updateShipPhotoNameS(Ship ship);
	void updateShipPhotoNameSampleS(Ship ship);
	void updateShipBannerNameS(Ship ship);
	void updateShipLimitS(Ship ship);
	void updateNoShipLimitS(int shipNum);
	void updateShipLocationS(Ship ship);
	int updateShipCountS(int shipNum);
	void updateShipCaptainS(Crew crew);
}
