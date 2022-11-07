package com.ship.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ship.domain.Calendar;
import com.ship.mapper.CalendarMapper;

@Service
public class CalendarServiceImpl implements CalendarService{

	@Autowired
	private CalendarMapper calendarMapper;
	
	@Override
	public ArrayList<Calendar> listS(Integer shipNum) {
		return calendarMapper.list(shipNum);
	}
	
	@Override
	public ArrayList<Calendar> listUsrS(Integer usrNum) {
		return calendarMapper.listUsr(usrNum);
	}
	
	@Override
	public void insertS(Calendar calendar) {
		calendarMapper.insert(calendar);
	}
	
	@Override
	public void deleteS(Integer calendarId) {
		calendarMapper.delete(calendarId);
	}
	
	@Override
	public void updateS(Calendar calendar) {
		calendarMapper.update(calendar);
	}
}
