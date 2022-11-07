package com.ship.mapper;

import java.util.List;

import com.ship.domain.Crew;
import com.ship.domain.Ship;


public interface CrewMapper {
	List<Crew> selectThreeMonthsCountNewCrew(int shipNum);
	
	List<Crew> selectAll();
	void insertCrew(Crew crew);
	
	//추가
	Crew selectCrew(Integer crewNum);
	
	List<Crew> selectShipCrew(int shipNum);
	List<Crew> selectAutoNickname(Crew crew);
	
	Crew selectCrewInfo(Crew crew);
	Crew selectOnlineCrew(Crew crew);
	
	int deleteCrew(Integer crewNum);
	void updateCrewNickname(Crew crew);
	void updateCrewPhoto(Crew crew);
	void updateBookmarkOn(Crew crew);
	void updateBookmarkOff(Crew crew);
	
	void insert_Add_Crew(Crew crew);
	
}
