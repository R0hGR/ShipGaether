package com.ship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ship.domain.ShipPhoto;

import com.ship.mapper.ShipPhotoMapper;


@Service
public class ShipPhotoServiceImpl implements ShipPhotoService {
	@Autowired
	private ShipPhotoMapper shipPhotoMapper;

	@Override
	public void insertShipPhotoS(ShipPhoto sp) {
		shipPhotoMapper.insertShipPhoto(sp);
	}

}
