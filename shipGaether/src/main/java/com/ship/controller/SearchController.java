package com.ship.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ship.domain.City;
import com.ship.domain.Dong;
import com.ship.domain.Ship;
import com.ship.domain.Town;
import com.ship.service.CityService;
import com.ship.service.DongService;
import com.ship.service.SearchService;
import com.ship.service.TownService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Controller
@AllArgsConstructor
public class SearchController {
	@Autowired
	private SearchService searchService;
	private CityService cityService;
	private TownService townService;
	private DongService dongService;
	
	   @RequestMapping("/search")
	   public ModelAndView search(@RequestParam("search") String keyword, HttpSession session) {
		   if(keyword == null) keyword = "";
		   List<Ship> ship = searchService.searchShipS(keyword); 
		   List<City> city = cityService.selectAllS();
		   List<Town> town = townService.selectAllS();
		   List<Dong> dong = dongService.selectAllS();
		   ModelAndView mv = new ModelAndView("/search/search", "ship", ship);
		   mv.addObject("city", city);
		   mv.addObject("town", town);
		   mv.addObject("dong", dong);
		   
	      return mv;
	   }
}
