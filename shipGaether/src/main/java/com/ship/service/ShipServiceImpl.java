package com.ship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ship.domain.Crew;
import com.ship.domain.Ship;
import com.ship.mapper.ShipMapper;
import com.ship.util.PagingVO;
import com.ship.util.ShipPhotoVO;

@Service
public class ShipServiceImpl implements ShipService {
	@Autowired
	private ShipMapper shipMapper;

	@Override
	public List<Ship> selectAllS() {
		return shipMapper.selectAll();
	}
	@Override
	public List<Ship> selectShipOfUsrS(int usrNum){
		return shipMapper.selectShipOfUsr(usrNum);
	}
	@Override
	public List<Ship> selectShipPeopleS(int usrNum){
		return shipMapper.selectShipPeople(usrNum);
	}	
	@Override
	public List<Ship> selectMyShipS(int usrNum){
		return shipMapper.selectMyShip(usrNum);
	}
	@Override
	public List<Ship> selectMyBookmarkShipS(int usrNum){
		return shipMapper.selectMyBookmarkShip(usrNum);
	}
	
	@Override
	public void insertNewShipS(Ship newShip) {
		shipMapper.insertNewShip(newShip);
	}
	@Override
	public void updateShipPhotoS(ShipPhotoVO shipPhotoVO) {
		shipMapper.updateShipPhoto(shipPhotoVO);
	}
   @Override
   public void updateShipSampleUseS(int shipNum) {
	   shipMapper.updateShipSampleUse(shipNum);	   
   }	
	
   @Override
   public Ship selectShipS(Integer shipNum) {
      return shipMapper.selectShip(shipNum);
   }
   
   @Override
   public int selectCountShipS() {
	   return shipMapper.selectCountShip();
   }
   
   @Override
   public List<Ship> selectRecShipS(PagingVO PVO){
	   return shipMapper.selectRecShip(PVO);	   
   }
   
   @Override
   public int deleteShipS(Ship ship) {
	 return shipMapper.deleteShip(ship);
   }
   
   @Override
   public void updateShipNameS(Ship ship) {
	   shipMapper.updateShipName(ship);
   }
   @Override   
   public void updateShipTitleS(Ship ship) {
	   shipMapper.updateShipTitle(ship);
   }
   @Override
   public void updateShipSurveyS(Ship ship) {
	   shipMapper.updateShipSurvey(ship);
   }
   
   @Override
   public void updateShipLimitGenderS(Ship ship) {
	   shipMapper.updateShipLimitGender(ship);
   }
   @Override
   public void updateShipCityS(Ship ship) {
	   shipMapper.updateShipCity(ship);
   }

   @Override
   public void updateShipOpenS(Ship ship) {
	   shipMapper.updateShipOpen(ship);
   }
   @Override
   public void updateShipPhotoNameS(Ship ship) {
	   shipMapper.updateShipPhotoName(ship);
   }
   @Override
   public void updateShipPhotoNameSampleS(Ship ship) {
	   shipMapper.updateShipPhotoNameSample(ship);
   }
   @Override
   public void updateShipBannerNameS(Ship ship) {
	   shipMapper.updateShipBannerName(ship);
   }
   @Override
   public void updateShipLimitS(Ship ship) {
	   shipMapper.updateShipLimit(ship);
   }
   @Override
   public void updateNoShipLimitS(int shipNum) {
	   shipMapper.updateNoShipLimit(shipNum);
   }

   @Override
   public int updateShipCountS(int shipNum) {
	   return shipMapper.updateShipCount(shipNum);
   }
   @Override
   public void updateShipLocationS(Ship ship) {
	   shipMapper.updateShipLocation(ship);
   }
   
   @Override
   public void updateShipCaptainS(Crew crew) {
	   shipMapper.updateShipCaptain(crew);
   }
   
}
