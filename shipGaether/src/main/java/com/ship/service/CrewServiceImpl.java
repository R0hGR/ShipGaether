package com.ship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ship.domain.Crew;
import com.ship.mapper.CrewMapper;
import com.ship.mapper.ShipMapper;

@Service
public class CrewServiceImpl implements CrewService {
	@Autowired
	private CrewMapper crewMapper;

	@Autowired
	private ShipMapper shipMapper;

	@Override
	public List<Crew> selectThreeMonthsCountNewCrewS(int shipNum) {
		return crewMapper.selectThreeMonthsCountNewCrew(shipNum);
	}

	@Override
	public List<Crew> selectAllS() {
		return crewMapper.selectAll();
	}

	@Override
	public void insertCrewS(Crew crew) {
		crewMapper.insertCrew(crew);
	}

	@Override
	public List<Crew> selectShipCrewS(int shipNum) {
		return crewMapper.selectShipCrew(shipNum);
	}

	@Override
	public Crew selectCrewInfoS(Crew crew) {
		return crewMapper.selectCrewInfo(crew);
	}

	@Override
	public List<Crew> selectAutoNicknameS(Crew crew) {
		return crewMapper.selectAutoNickname(crew);
	}

	@Override
	public Crew selectOnlineCrewS(Crew crew) {
		return crewMapper.selectOnlineCrew(crew);
	}

	// 추가
	@Override
	public Crew selectCrewS(Integer crewNum) {
		return crewMapper.selectCrew(crewNum);
	}

	@Override
	public int deleteCrewS(Integer crewNum) {
		return crewMapper.deleteCrew(crewNum);
	}

	@Override
	public void updateCrewNicknameS(Crew crew) {
		crewMapper.updateCrewNickname(crew);
		if (crew.getCrewRole().equals("captain")) {
			shipMapper.updateShipCaptain(crew);
		}
	}

	@Override
	public void updateCrewPhotoS(Crew crew) {
		crewMapper.updateCrewPhoto(crew);
	}

	@Override
	public void updateBookmarkOnS(Crew crew) {
		crewMapper.updateBookmarkOn(crew);
	}

	@Override
	public void updateBookmarkOffS(Crew crew) {
		crewMapper.updateBookmarkOff(crew);
	}

	@Override
	public void insert_Add_CrewS(Crew crew) {
		crewMapper.insert_Add_Crew(crew);
	}

}
