package com.ship.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Room{
	private String roomNum;
	private int roomId;
	private String roomName;
	private int roomMember;	
}
