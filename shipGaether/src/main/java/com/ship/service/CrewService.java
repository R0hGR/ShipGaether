package com.ship.service;

import java.util.List;

import com.ship.domain.Crew;
import com.ship.domain.Ship;

public interface CrewService {
	List<Crew> selectThreeMonthsCountNewCrewS(int shipNum);
	
	List<Crew> selectAllS();
	void insertCrewS(Crew crew);
	
	//추가
	Crew selectCrewS(Integer crewNum);
	
	List<Crew> selectShipCrewS(int shipNum);
	
	Crew selectCrewInfoS(Crew crew);
	
	List<Crew> selectAutoNicknameS(Crew crew);
	Crew selectOnlineCrewS(Crew crew);
	
	int deleteCrewS(Integer crewNum);
	void updateCrewNicknameS(Crew crew);
	void updateCrewPhotoS(Crew crew);
	void updateBookmarkOnS(Crew crew);
	void updateBookmarkOffS(Crew crew);
	
	void insert_Add_CrewS(Crew crew);
}
