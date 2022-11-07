package com.ship.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ship.domain.Calendar;
import com.ship.domain.Ship;
import com.ship.service.CalendarService;
import com.ship.service.ShipService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/fullcalendar")
@AllArgsConstructor
public class CalendarController {
	@Autowired
	private CalendarService calendarService;
	@Autowired
	private ShipService shipService;
	
	@GetMapping("")
	public String list() {
		return "fullcalendar";
	}
	
	@GetMapping("/list")
	public ModelAndView listU() {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	@GetMapping("/data")
	public@ResponseBody List<Calendar> data(String shipNum) {
		Integer shipNumtoInt = Integer.parseInt(shipNum);
		List<Calendar> calendarList = calendarService.listS(shipNumtoInt);
		return calendarList;
	}
	
	@PostMapping("/insert")
	public@ResponseBody void insert(Calendar calendar) {
		calendarService.insertS(calendar);	
	}
	
	@PostMapping("/delete")
	public@ResponseBody void delete(Integer calendarId) {
		log.info(calendarId);
		calendarService.deleteS(calendarId);	
	}
	
	@PostMapping("/update")
	public@ResponseBody void update(Calendar calendar) {
		calendarService.updateS(calendar);	
	}
	
	@GetMapping("/myCalendar")
	public String listMy() {
		return "calendar";
	}
	
	@GetMapping("/myCalendar/list")
	public ModelAndView listUsr() {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	@GetMapping("/myCalendar/data")
	public@ResponseBody List<Calendar> dataUsr(String usrNum) {
		String[] color = {"red","green","orange","yellow","purple"};
		log.info("############"+usrNum);
		Integer usrNumtoInt = Integer.parseInt(usrNum);
		List<Ship> ships = shipService.selectMyShipS(usrNumtoInt);
		List<Calendar> calendarListAll = new ArrayList<Calendar>();
		int i = 0;
		for(Ship ship: ships) {	
			List<Calendar> calendarList = calendarService.listS(ship.getShipNum());	
			for(Calendar calendar: calendarList) {
				calendar.setCalendarTitle("["+ship.getShipName()+"]"+calendar.getCalendarTitle());
				calendar.setCalendarBackgroundColor(color[i]);
				calendar.setCalendarBorderColor(color[i]);
				calendarListAll.add(calendar);	
			}
			i++;
			if(i>5) {
				i = 0;
			}
		}
		List<Calendar> calendarListUsr = calendarService.listUsrS(usrNumtoInt);
		for(Calendar calendar: calendarListUsr) {
			calendarListAll.add(calendar);
		}
		
		return calendarListAll;
	}
	
	@PostMapping("/myCalendar/insert")
	public@ResponseBody void insertUsr(Calendar calendar) {
		calendarService.insertS(calendar);	
	}
	
	@PostMapping("/myCalendar/delete")
	public@ResponseBody void deleteUsr(Integer calendarId) {
		log.info(calendarId);
		calendarService.deleteS(calendarId);	
	}
	
	@PostMapping("/myCalendar/update")
	public@ResponseBody void updateUsr(Calendar calendar) {
		calendarService.updateS(calendar);	
	}
}