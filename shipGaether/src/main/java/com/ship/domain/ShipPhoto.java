package com.ship.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ShipPhoto {
	private int shipPhotoNum; 			// �Խñ� ��ȣ
	private String shipPhotoName;
	private String shipOriginPhotoName;
	private int shipPhotoStatus;
	private Date shipPhotoLDate;
	private int shipNum;
	
	public ShipPhoto( String shipPhotoName, String shipOriginPhotoName , int shipNum) {
		this.shipPhotoName=shipPhotoName;
		this.shipOriginPhotoName=shipOriginPhotoName;
		this.shipNum=shipNum;
	}
}
