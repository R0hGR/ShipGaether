package com.ship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ship.domain.Survey;
import com.ship.mapper.SurveyMapper;

@Service
public class SurveyServiceImpl implements SurveyService {
	@Autowired
	private SurveyMapper surveyMapper;

	@Override
	public List<Survey> selectAllS() {
		return surveyMapper.selectAll();
	}

}
