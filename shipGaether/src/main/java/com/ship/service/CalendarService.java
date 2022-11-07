package com.ship.service;

import java.util.ArrayList;

import com.ship.domain.Calendar;

public interface CalendarService {
	public ArrayList<Calendar> listS(Integer shipNum);
	public ArrayList<Calendar> listUsrS(Integer usrNum);
	public void insertS(Calendar calendar);
	public void deleteS(Integer calendarId);
	public void updateS(Calendar calendar);
}
