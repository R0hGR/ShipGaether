package com.ship.mapper;

import java.util.ArrayList;

import com.ship.domain.Calendar;

public interface CalendarMapper {
	public ArrayList<Calendar> list(Integer shipNum);
	public ArrayList<Calendar> listUsr(Integer usrNum);
	public void insert(Calendar calendar);
	public void delete(Integer calendarId);
	public void update(Calendar calendar);
}
