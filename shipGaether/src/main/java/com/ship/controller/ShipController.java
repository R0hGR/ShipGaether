package com.ship.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ship.domain.Application;
import com.ship.domain.Board;
import com.ship.domain.BoardFile;
import com.ship.domain.City;
import com.ship.domain.Crew;
import com.ship.domain.Dong;
import com.ship.domain.Note;
import com.ship.domain.OnlineUsr;
import com.ship.domain.Reply;
import com.ship.domain.ReplyGood;
import com.ship.domain.Ship;
import com.ship.domain.ShipPhoto;
import com.ship.domain.Town;
import com.ship.domain.Usr;
import com.ship.service.ApplicationService;
import com.ship.service.BoardFileService;
import com.ship.service.BoardService;
import com.ship.service.CityService;
import com.ship.service.CrewService;
import com.ship.service.DongService;
import com.ship.service.DragdropService;
import com.ship.service.NoteService;
import com.ship.service.OnlineUsrService;
import com.ship.service.ReplyGoodService;
import com.ship.service.ReplyService;
import com.ship.service.ShipPhotoService;
import com.ship.service.ShipService;
import com.ship.service.TownService;
import com.ship.service.UsrService;
import com.ship.util.BoardPhotoVO;
import com.ship.util.BoardSearchVO;
import com.ship.util.FileUploadManager;
import com.ship.util.Path;
import com.ship.util.ShipPhotoVO;

import lombok.extern.log4j.Log4j;


@Log4j
@Controller
public class ShipController {
	
	@Autowired
	private CityService cityService;
	@Autowired
	private TownService townService;
	@Autowired
	private DongService dongService;
	@Autowired
	private ShipService shipService;
	@Autowired
	private CrewService crewService;
	@Autowired
	private UsrService usrService;
	@Autowired
	private ShipPhotoService shipPhotoService;
	@Autowired 
	private BoardService boardService;
	@Autowired 
	private BoardFileService boardFileService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private ReplyGoodService replyGoodService;
	@Autowired
	private OnlineUsrService onlineUsrService;
	@Autowired
	private ApplicationService applicationService;
	@Autowired
	private NoteService noteService;
	
	
	@Autowired
	private DragdropService service;
	
	@Autowired
	private FileUploadManager fileUploadManager;
	
	
   @GetMapping("/rest/getShipInfo")
   public @ResponseBody Map<String,List> getShipInfo(int shipNum) {
      log.info(" # getShipInfo() shipNum : "+shipNum);
      
      Map<String,List> map = new HashMap<String,List>();
      
      List<Crew> crews = crewService.selectThreeMonthsCountNewCrewS(shipNum);
      List<Board> boards = boardService.selectThreeMonthsCountBoardS(shipNum);
      List<Reply> replys = replyService.selectThreeMonthsCountReplyS(shipNum);
      map.put("crews", crews);
      map.put("boards", boards);
      map.put("replys", replys);
      
      return map; 
   }
	   
	@PostMapping("/rest/sendNote")
	public @ResponseBody String sendNote(Note note) {
		noteService.insertNoteS(note);
		
		return "";
	}
	
	
	@PostMapping("/rest/board/all/{shipNum}")
	public @ResponseBody List<Board> getBoardListByboardALL(@PathVariable Integer shipNum,String keyword){
		BoardSearchVO bsvo = new BoardSearchVO(shipNum,keyword);
		List<Board> boards = boardService.selectBoardByBoardALLS(bsvo);
		log.info(" # boards"+boards);
		return boards;
	}
	
	@PostMapping("/rest/board/content/{shipNum}")
	public @ResponseBody List<Board> getBoardListByboardContent(@PathVariable Integer shipNum,String boardContent){
		BoardSearchVO bsvo = new BoardSearchVO(shipNum,boardContent);
		List<Board> boards = boardService.selectBoardByBoardContentS(bsvo);
		log.info(" # boards"+boards);
		return boards;
	}
	
	@PostMapping("/rest/board/subject/{shipNum}")
	public @ResponseBody List<Board> getBoardListByboardSubject(@PathVariable Integer shipNum,String boardSubject){
		BoardSearchVO bsvo = new BoardSearchVO(shipNum,boardSubject);
		List<Board> boards = boardService.selectBoardByBoardSubjectS(bsvo);
		log.info(" # boards"+boards);
		return boards;
	}
	
	@PostMapping("/rest/board/crewNickname/{shipNum}")
	public @ResponseBody List<Board> getBoardListByCrewNickname(@PathVariable Integer shipNum,String crewNickname){
		
		BoardSearchVO bsvo = new BoardSearchVO(shipNum,crewNickname);
		log.info(" # getBoardListByCrewNickname : "+ bsvo);
		List<Board> boards = boardService.selectBoardByCrewNicknameS(bsvo);
		return boards;
	}
	
	@PostMapping("/rest/crewNickname/autoData/{shipNum}")
	public @ResponseBody List<Crew> getCrewList(@PathVariable Integer shipNum, String crewNickname){
		Crew crew = new Crew(shipNum,crewNickname);
		log.info(" # crew : "+ crew);
		List<Crew> crews = crewService.selectAutoNicknameS(crew);
		log.info(" crews : "+crews);
		return crews;
	}
	
	@PostMapping("/rest/subject/autoData/{shipNum}")
	public @ResponseBody List<Board> getBoardSubjectList(@PathVariable Integer shipNum, String boardSubject){
		BoardSearchVO bsvo = new BoardSearchVO(shipNum,boardSubject); 
		List<Board> boards = boardService.selectAutoBoardSubjectS(bsvo);
//		log.info(" # crew : "+ crew);
//		List<Crew> crews = crewService.selectAutoNicknameS(crew);
//		log.info(" crews : "+crews);
		return boards;
	}
	
	

	@GetMapping("/ship/{shipNum}")
	public String shipMember(@PathVariable int shipNum, Model m , HttpSession session , String keyword) {
		
		log.info(" # shipMember keyword : "+keyword);// good / view / reply / date
		
		Ship ship = shipService.selectShipS(shipNum);
		m.addAttribute("ship", ship);
		
		List<Crew> crews = crewService.selectShipCrewS(shipNum);
		m.addAttribute("crews", crews);
		
		List<Board> boards = new ArrayList<Board>();
		if(keyword!=null) {
			BoardSearchVO bsvo = new BoardSearchVO(shipNum,keyword);
			log.info(" # bsvo : "+bsvo);
			
			boards = boardService.selectBoardOfShipOrderByS(bsvo);			
		}else {
			boards = boardService.selectBoardOfShipS(shipNum);
		}
		m.addAttribute("boards", boards);		
		log.info(" # : boards"+boards); 
						
		List<BoardFile> boardFiles = boardFileService.selectAllFileS();
		m.addAttribute("boardFiles", boardFiles);
		Integer loginStatus = (Integer)session.getAttribute("sessionId");
		
		if(loginStatus != null) {
			log.info(" # loginStatus : "+loginStatus);
			
			Crew crew = new Crew((int)session.getAttribute("sessionId"),shipNum);
			Crew myCrewInfo = crewService.selectCrewInfoS(crew);
			m.addAttribute("myCrewInfo", myCrewInfo);
			
			List<Reply> replys = replyService.selectAllS();
			m.addAttribute("replys", replys);
			
			List<ReplyGood> replyGoods = replyGoodService.selectAllS();
			m.addAttribute("replyGoods", replyGoods);
			
			List<BoardFile> recentlyBoardFileS = boardFileService.selectRecentlyBoardFileS(shipNum);
			m.addAttribute("recentlyBoardFileS", recentlyBoardFileS);
			
			List<OnlineUsr> onlineUsrs = onlineUsrService.selectAllS();
			log.info(" # onlineUsrs : "+ onlineUsrs);
			List<Crew> oCrews = new ArrayList<Crew>();
			for(OnlineUsr oUsr : onlineUsrs) {
				Crew oCrewDto = new Crew(oUsr.getUsrNum(),shipNum);
				Crew oCrew = crewService.selectOnlineCrewS(oCrewDto);
				oCrews.add(oCrew);
			}		
			m.addAttribute("oCrews", oCrews);
					
//			application 추가 시작
			Integer usrNum = (Integer)session.getAttribute("sessionId");
			Application applicationDto = new Application(usrNum, shipNum);
			Application myAppOfShip = applicationService.selectMyAppOfShipS(applicationDto);
			m.addAttribute("myAppOfShip", myAppOfShip);
//			application 추가 끝	
			
			return "/ship/ship";
			
		}else {
			m.addAttribute("loginStatus", 0);
			return "/ship/ship";
		}

	}

	@GetMapping("/ship/{shipNum}/album")
	public String album(@PathVariable Integer shipNum, Model m , HttpSession session) {
		Ship ship = shipService.selectShipS(shipNum);
		m.addAttribute("ship", ship);
		
		List<BoardFile> recentlyBoardFileS = boardFileService.selectRecentlyBoardFileS(shipNum);
		m.addAttribute("recentlyBoardFileS", recentlyBoardFileS);
		
		Crew crew = new Crew((int)session.getAttribute("sessionId"),shipNum);
		Crew myCrewInfo = crewService.selectCrewInfoS(crew);
		m.addAttribute("myCrewInfo", myCrewInfo);
		
		List<OnlineUsr> onlineUsrs = onlineUsrService.selectAllS();
		log.info(" # onlineUsrs : "+ onlineUsrs);
		List<Crew> oCrews = new ArrayList<Crew>();
		for(OnlineUsr oUsr : onlineUsrs) {
			Crew oCrewDto = new Crew(oUsr.getUsrNum(),shipNum);
			Crew oCrew = crewService.selectOnlineCrewS(oCrewDto);
			oCrews.add(oCrew);
		}		
		m.addAttribute("oCrews", oCrews);
		
//		application 추가 시작
		Integer usrNum = (Integer)session.getAttribute("sessionId");
		Application applicationDto = new Application(usrNum, shipNum);
		Application myAppOfShip = applicationService.selectMyAppOfShipS(applicationDto);
		m.addAttribute("myAppOfShip", myAppOfShip);
//		application 추가 끝	
		
		return "/ship/album";
	}

	@GetMapping("/ship/{shipNum}/calendar")
	public String calendar(@PathVariable Integer shipNum, Model m,HttpSession session) throws IOException {
		Ship ship = shipService.selectShipS(shipNum);
		m.addAttribute("ship", ship);
		List<BoardFile> recentlyBoardFileS = boardFileService.selectRecentlyBoardFileS(shipNum);
		m.addAttribute("recentlyBoardFileS", recentlyBoardFileS);
		
		Crew crew = new Crew((int)session.getAttribute("sessionId"),shipNum);
		Crew myCrewInfo = crewService.selectCrewInfoS(crew);
		m.addAttribute("myCrewInfo", myCrewInfo);
		
		List<OnlineUsr> onlineUsrs = onlineUsrService.selectAllS();
		log.info(" # onlineUsrs : "+ onlineUsrs);
		List<Crew> oCrews = new ArrayList<Crew>();
		for(OnlineUsr oUsr : onlineUsrs) {
			Crew oCrewDto = new Crew(oUsr.getUsrNum(),shipNum);
			Crew oCrew = crewService.selectOnlineCrewS(oCrewDto);
			oCrews.add(oCrew);
		}		
		m.addAttribute("oCrews", oCrews);
		
//		application 추가 시작
		Integer usrNum = (Integer)session.getAttribute("sessionId");
		Application applicationDto = new Application(usrNum, shipNum);
		Application myAppOfShip = applicationService.selectMyAppOfShipS(applicationDto);
		m.addAttribute("myAppOfShip", myAppOfShip);
//		application 추가 끝	
		
		return "/ship/calendar";
	}

	@GetMapping("/ship/{shipNum}/attachmentList")
	public String attachmentList(@PathVariable Integer shipNum, Model m,HttpSession session) {
		Ship ship = shipService.selectShipS(shipNum);
		m.addAttribute("ship", ship);
		
		List<BoardFile> recentlyBoardFileS = boardFileService.selectRecentlyBoardFileS(shipNum);
		m.addAttribute("recentlyBoardFileS", recentlyBoardFileS);
		
		Crew crew = new Crew((int)session.getAttribute("sessionId"),shipNum);
		Crew myCrewInfo = crewService.selectCrewInfoS(crew);
		m.addAttribute("myCrewInfo", myCrewInfo);
		
		List<OnlineUsr> onlineUsrs = onlineUsrService.selectAllS();
		log.info(" # onlineUsrs : "+ onlineUsrs);
		List<Crew> oCrews = new ArrayList<Crew>();
		for(OnlineUsr oUsr : onlineUsrs) {
			Crew oCrewDto = new Crew(oUsr.getUsrNum(),shipNum);
			Crew oCrew = crewService.selectOnlineCrewS(oCrewDto);
			oCrews.add(oCrew);
		}		
		m.addAttribute("oCrews", oCrews);
		
//		application 추가 시작
		Integer usrNum = (Integer)session.getAttribute("sessionId");
		Application applicationDto = new Application(usrNum, shipNum);
		Application myAppOfShip = applicationService.selectMyAppOfShipS(applicationDto);
		m.addAttribute("myAppOfShip", myAppOfShip);
//		application 추가 끝
		
		List<BoardFile> bfs = boardFileService.selectDocumentFileS(shipNum);
		m.addAttribute("bfs", bfs);
		
		List<BoardFile> bfsDates = boardFileService.selectFileDateS(shipNum);	
		m.addAttribute("bfsDates", bfsDates);
		
		return "/ship/attachmentList";
	}
	

	@GetMapping("/ship/{shipNum}/crewList")
	public String crewList(@PathVariable Integer shipNum, Model m,HttpSession session) {
		Ship ship = shipService.selectShipS(shipNum);
		m.addAttribute("ship", ship);
		List<Crew> crews = crewService.selectShipCrewS(shipNum);
		m.addAttribute("crews", crews);

		List<BoardFile> recentlyBoardFileS = boardFileService.selectRecentlyBoardFileS(shipNum);
		m.addAttribute("recentlyBoardFileS", recentlyBoardFileS);
		
		Crew crew = new Crew((int)session.getAttribute("sessionId"),shipNum);
		Crew myCrewInfo = crewService.selectCrewInfoS(crew);
		m.addAttribute("myCrewInfo", myCrewInfo);

		List<OnlineUsr> onlineUsrs = onlineUsrService.selectAllS();
		log.info(" # onlineUsrs : " + onlineUsrs);
		List<Crew> oCrews = new ArrayList<Crew>();
		for (OnlineUsr oUsr : onlineUsrs) {
			Crew oCrewDto = new Crew(oUsr.getUsrNum(), shipNum);
			Crew oCrew = crewService.selectOnlineCrewS(oCrewDto);
			oCrews.add(oCrew);
		}
		m.addAttribute("oCrews", oCrews);
		
//		application 추가 시작
		Integer usrNum = (Integer)session.getAttribute("sessionId");
		Application applicationDto = new Application(usrNum, shipNum);
		Application myAppOfShip = applicationService.selectMyAppOfShipS(applicationDto);
		m.addAttribute("myAppOfShip", myAppOfShip);
//		application 추가 끝	
		 
		 
		return "/ship/crewList";
	}

	@GetMapping("/ship/{shipNum}/total")
	public String total(@PathVariable Integer shipNum, Model m) {
		Ship ship = shipService.selectShipS(shipNum);
		m.addAttribute("ship", ship);
		return "/ship/total";
	}

	@GetMapping("/ship/{shipNum}/crew/crewInvite")
	public String invite(@PathVariable Integer shipNum, Model m) {
		Ship ship = shipService.selectShipS(shipNum);
		List<Usr> usrs = usrService.select_Invite_UsrS(shipNum);
		m.addAttribute("usrs", usrs);
		m.addAttribute("ship", ship);
		return "/ship/crewInvite";
	}
	
	
	@RequestMapping(value = "/ship/{shipNum}/crew/crewInvite", method = RequestMethod.POST)
	public String createRoom(@RequestParam(value = "usrNumber[]") List<String> data,HttpSession session,Ship ship) {
		int shipNum = ship.getShipNum();
		log.info("# 확인확인확인확인 : "+ data );
		Crew crew = new Crew();
		
		for (String usrNum : data) {
			log.info("# for문 확인 usrNum : "+ usrNum );
			Usr usr = usrService.usrInfoS(Integer.parseInt(usrNum));
			crew.setUsrNum(Integer.parseInt(usrNum));
			crew.setShipNum(shipNum);
			crew.setCrewNickname(usr.getUsrNickname());
			crewService.insert_Add_CrewS(crew);
			log.info("# for문 확인 usrNum : "+ usrNum +"번 완료 " );
			}
		return "redirect:/ship/"+shipNum+"/crewList";
	}
	

	
	@GetMapping("/ship/makeShip")
	public ModelAndView makeShip(HttpSession session) {
		List<City> cities = cityService.selectAllS();
		List<Town> towns = townService.selectAllS();
		List<Dong> dongs = dongService.selectAllS();
		ModelAndView mv = new ModelAndView("/ship/makeShip","cities",cities);
		mv.addObject("towns", towns);
		mv.addObject("dongs", dongs);
		return mv;
	}

	
	@PostMapping("/ship/makeShip.do")
	public String afterMakeShip(HttpSession session , Ship newShip , int shipSample , @RequestParam MultipartFile shipPhotoFile ) { //sample 0=기본제공사진 1=등록하고사용)
		log.info(" # newShip : "+ newShip);
		log.info(" # int shipSample : "+ shipSample);
		shipService.insertNewShipS(newShip);
		//// newShip.getShipNum() 핵중요 
		log.info(" # newShip.getShipNum  : "+ newShip.getShipNum());
		
		
		
		int newShipNum = newShip.getShipNum(); // 만들어진 shipNum
		int usrNum = newShip.getUsrNum();		// 만든사람의 usrNum
		
		File dir = new File(Path.SHIP_STORE+newShipNum+"/");
		if (!dir.exists())dir.mkdirs();
		
		
		String usrNickname = usrService.selectUsrNicknameS(usrNum);
		
		Crew crew = new Crew(usrNum,newShipNum,"captain",0,usrNickname);  // 0 은 즐겨찾기 안함
		log.info(" # 만들자마자 크루로 들어가야하는 만든사람  crew : "+ crew);		
		crewService.insertCrewS(crew);
		if( shipSample == 1 ) {
			String ofName = shipPhotoFile.getOriginalFilename();
			log.info(" # true 라서 파일 업로드까지 해야함   ofname : "+ ofName);
			log.info(" # ofName : "+ ofName);
			String fileName = fileUploadManager.makeFileName(shipPhotoFile, "SHIP_PHOTO",newShip.getShipNum());			
			log.info(" # fileName : "+ fileName);
			ShipPhotoVO shipPhotoVO = new ShipPhotoVO(newShip.getShipNum(),fileName);
			log.info(" # shipPhotoVO : "+ shipPhotoVO);
			shipService.updateShipPhotoS(shipPhotoVO);
			shipService.updateShipSampleUseS(newShip.getShipNum());
			ShipPhoto sp = new ShipPhoto(fileName,ofName,newShip.getShipNum());
			shipPhotoService.insertShipPhotoS(sp);
		}
		
		return "redirect:/";
	}
	
//	ship setting app 추가
	@GetMapping("/ship/{shipNum}/setting/app")
	public String setApp(@PathVariable Integer shipNum, HttpSession session, Model m) {
		Ship ship = shipService.selectShipS(shipNum);
		m.addAttribute("ship", ship);
		
		Crew crew = new Crew((int)session.getAttribute("sessionId"),shipNum);
		Crew myCrewInfo = crewService.selectCrewInfoS(crew);
		m.addAttribute("myCrewInfo", myCrewInfo);	
		
		List<Crew> crews = crewService.selectShipCrewS(shipNum);
		m.addAttribute("crews", crews);

		List<BoardFile> recentlyBoardFileS = boardFileService.selectRecentlyBoardFileS(shipNum);
		m.addAttribute("recentlyBoardFileS", recentlyBoardFileS);

		
		List<OnlineUsr> onlineUsrs = onlineUsrService.selectAllS();
		log.info(" # onlineUsrs : " + onlineUsrs);
		List<Crew> oCrews = new ArrayList<Crew>();
		for (OnlineUsr oUsr : onlineUsrs) {
			Crew oCrewDto = new Crew(oUsr.getUsrNum(), shipNum);
			Crew oCrew = crewService.selectOnlineCrewS(oCrewDto);
			oCrews.add(oCrew);
		}
		m.addAttribute("oCrews", oCrews);
		
//		application 추가 시작
		Integer usrNum = (Integer)session.getAttribute("sessionId");
		Application applicationDto = new Application(usrNum, shipNum);
		Application myAppOfShip = applicationService.selectMyAppOfShipS(applicationDto);
		m.addAttribute("myAppOfShip", myAppOfShip);
//		application 추가 끝	
		
		List<Application> appsWithUsr = applicationService.selectWithUsrByShipNumS(shipNum);
		log.info("appsWithUsr: "+appsWithUsr);
		m.addAttribute("appsWithUsr", appsWithUsr);
		
		return "/ship/setting-app";
	}
//	ship setting info 추가
	@GetMapping("/ship/{shipNum}/setting/info")
	public String setInfo(@PathVariable Integer shipNum, Model m, HttpSession session) {
		Ship ship = shipService.selectShipS(shipNum);
		m.addAttribute("ship", ship);
		Crew crew = new Crew((int)session.getAttribute("sessionId"),shipNum);
		Crew myCrewInfo = crewService.selectCrewInfoS(crew);
		m.addAttribute("myCrewInfo", myCrewInfo);	
		
		List<Crew> crews = crewService.selectShipCrewS(shipNum);
		m.addAttribute("crews", crews);

		List<BoardFile> recentlyBoardFileS = boardFileService.selectRecentlyBoardFileS(shipNum);
		m.addAttribute("recentlyBoardFileS", recentlyBoardFileS);

		
		List<OnlineUsr> onlineUsrs = onlineUsrService.selectAllS();
		log.info(" # onlineUsrs : " + onlineUsrs);
		List<Crew> oCrews = new ArrayList<Crew>();
		for (OnlineUsr oUsr : onlineUsrs) {
			Crew oCrewDto = new Crew(oUsr.getUsrNum(), shipNum);
			Crew oCrew = crewService.selectOnlineCrewS(oCrewDto);
			oCrews.add(oCrew);
		}
		m.addAttribute("oCrews", oCrews);
		
//		application 추가 시작
		Integer usrNum = (Integer)session.getAttribute("sessionId");
		Application applicationDto = new Application(usrNum, shipNum);
		Application myAppOfShip = applicationService.selectMyAppOfShipS(applicationDto);
		m.addAttribute("myAppOfShip", myAppOfShip);
//		application 추가 끝	
		m.addAttribute("myCrewInfo", myCrewInfo);
		List<City> cities = cityService.selectAllS();
		m.addAttribute("cities", cities);
		return "/ship/setting-info";
	}
//	ship setting photo 추가
	@GetMapping("/ship/{shipNum}/setting/photo")
	public String setPhoto(@PathVariable Integer shipNum, Model m, HttpSession session) {
		Ship ship = shipService.selectShipS(shipNum);
		m.addAttribute("ship", ship);
		Crew crew = new Crew((int)session.getAttribute("sessionId"),shipNum);
		Crew myCrewInfo = crewService.selectCrewInfoS(crew);
		m.addAttribute("myCrewInfo", myCrewInfo);	
		
		List<Crew> crews = crewService.selectShipCrewS(shipNum);
		m.addAttribute("crews", crews);

		List<BoardFile> recentlyBoardFileS = boardFileService.selectRecentlyBoardFileS(shipNum);
		m.addAttribute("recentlyBoardFileS", recentlyBoardFileS);

		
		List<OnlineUsr> onlineUsrs = onlineUsrService.selectAllS();
		log.info(" # onlineUsrs : " + onlineUsrs);
		List<Crew> oCrews = new ArrayList<Crew>();
		for (OnlineUsr oUsr : onlineUsrs) {
			Crew oCrewDto = new Crew(oUsr.getUsrNum(), shipNum);
			Crew oCrew = crewService.selectOnlineCrewS(oCrewDto);
			oCrews.add(oCrew);
		}
		m.addAttribute("oCrews", oCrews);
		
//		application 추가 시작
		Integer usrNum = (Integer)session.getAttribute("sessionId");
		Application applicationDto = new Application(usrNum, shipNum);
		Application myAppOfShip = applicationService.selectMyAppOfShipS(applicationDto);
		m.addAttribute("myAppOfShip", myAppOfShip);
//		application 추가 끝	
		m.addAttribute("myCrewInfo", myCrewInfo);
		return "/ship/setting-photo";
	}
//	ship setting photo 추가
	@GetMapping("/ship/{shipNum}/setting/remove")
	public String removeShip(@PathVariable Integer shipNum, Model m, HttpSession session) {
		Ship ship = shipService.selectShipS(shipNum);
		m.addAttribute("ship", ship);
		Crew crew = new Crew((int)session.getAttribute("sessionId"),shipNum);
		Crew myCrewInfo = crewService.selectCrewInfoS(crew);
		m.addAttribute("myCrewInfo", myCrewInfo);	
		
		List<Crew> crews = crewService.selectShipCrewS(shipNum);
		m.addAttribute("crews", crews);

		List<BoardFile> recentlyBoardFileS = boardFileService.selectRecentlyBoardFileS(shipNum);
		m.addAttribute("recentlyBoardFileS", recentlyBoardFileS);

		
		List<OnlineUsr> onlineUsrs = onlineUsrService.selectAllS();
		log.info(" # onlineUsrs : " + onlineUsrs);
		List<Crew> oCrews = new ArrayList<Crew>();
		for (OnlineUsr oUsr : onlineUsrs) {
			Crew oCrewDto = new Crew(oUsr.getUsrNum(), shipNum);
			Crew oCrew = crewService.selectOnlineCrewS(oCrewDto);
			oCrews.add(oCrew);
		}
		m.addAttribute("oCrews", oCrews);
		
//		application 추가 시작
		Integer usrNum = (Integer)session.getAttribute("sessionId");
		Application applicationDto = new Application(usrNum, shipNum);
		Application myAppOfShip = applicationService.selectMyAppOfShipS(applicationDto);
		m.addAttribute("myAppOfShip", myAppOfShip);
//		application 추가 끝	
		return "/ship/setting-remove";
	}
	
//	ship 가입 신청서 접수하기
	@PostMapping("/ship/{shipNum}/join")
	public String joinShip(@PathVariable Integer shipNum,Application application) {
		log.info(" # joinShip application: "+application);
		int rowNum = applicationService.insertS(application);
		
		if(rowNum == 0) log.info("가입 신청 실패");
		else log.info("가입 신청 성공");

		return "redirect:/ship/"+shipNum;
	}
	
//	ship 탈퇴하기 시 1. 캡틴인 경우, ship 삭제 
	@ResponseBody
	@PostMapping(value="/rest/ship/delete",produces = "application/text; charset=UTF-8")
	public String deleteShip(Integer shipNum, Integer usrNum, HttpSession session) {
		log.info("# shipShipNum: "+shipNum);
		log.info("# shipUsrNum: "+usrNum);
		int sessionUsrNum = (int)session.getAttribute("sessionId");
		
		log.info("# sessionUsrNum: "+sessionUsrNum);
		if(sessionUsrNum == usrNum) {
			Ship ship = new Ship(shipNum, usrNum);
			int rowNum = shipService.deleteShipS(ship);

			if(rowNum == 0) {
				log.info("ship 삭제 실패");
				return "ship 삭제에 실패했습니다.";
				
			}else {
				log.info("ship 삭제 완료");
				return "ship 삭제 완료되었습니다.";
			}
		}
		return "";
	}
	
//	ship 탈퇴하기 시 2. 크루인 경우, 해당 크루 삭제
	@ResponseBody
	@PostMapping(value="/rest/ship/leave",produces = "application/text; charset=UTF-8")
	public String leaveShip(Integer crewNum) {
		log.info("# crewNum: "+crewNum);
		
		int rowNum = crewService.deleteCrewS(crewNum);
		log.info("# rowNum: "+rowNum);
		if(rowNum == 0) {
			log.info("ship 탈퇴 실패");
			return "ship 탈퇴에 실패했습니다.";
		}else {
			log.info("ship 탈퇴 성공");
			return "ship 탈퇴 완료되었습니다.";
		}
	}
//	신청서 수락 시, 크루에 가입되고 신청서가 삭제된다
	@ResponseBody
	@PostMapping(value="/rest/app/acception",produces = "application/text; charset=UTF-8")
	public String acceptCrew(@RequestBody Crew crew) {
		crew.setCrewRole("sailor");
		crew.setCrewBookmark(0);
		log.info("# crew : "+crew);
		crewService.insertCrewS(crew);
		
		Application application = new Application(crew.getUsrNum(), crew.getShipNum());
		applicationService.deleteS(application); 
		
		int shipNum = crew.getShipNum();
		int rowCount = shipService.updateShipCountS(shipNum);
		
		log.info("rowCount: "+rowCount);
		return "크루로 수락되었습니다";
	}
//	신청서 거절 시, 신청서 상태가 1로 변경
	@ResponseBody
	@PostMapping(value="/rest/app/rejection",produces = "application/text; charset=UTF-8")
	public String acceptCrew(Integer appNum) {
		log.info("# appNum: "+appNum);
		
		int rowNum = applicationService.updateAppStatusS(appNum);
		if(rowNum==0) return "거절에 실패했습니다.";
		else return "거절 처리되었습니다.";

	}
	
	@PostMapping("/rest/updateShipCity/{shipNum}")
	public @ResponseBody String updateShipName(@PathVariable Integer shipNum, Integer cityNum, Integer townNum, Integer dongNum){		
		log.info(shipNum+"#"+cityNum+"#"+townNum+"#"+dongNum);	
		shipService.updateShipCityS(new Ship(shipNum,cityNum,townNum,dongNum));
		return "";
	}
	@PostMapping("/rest/updateShipName/{shipNum}")
	public @ResponseBody String updateShipName(@PathVariable Integer shipNum,String shipName){		
			shipService.updateShipNameS(new Ship(shipNum,shipName));
		return "";
	}
	@PostMapping("/rest/updateShipLimit/{shipNum}")
	public @ResponseBody String updateShipLimit(@PathVariable Integer shipNum,Date limitEnd , Date limitStart){		
			shipService.updateShipLimitS(new Ship(shipNum,limitStart,limitEnd));
		return "";
	}	
	@PostMapping("/rest/updateNoShipLimit/{shipNum}")
	public @ResponseBody String updateNoShipLimit(@PathVariable Integer shipNum){		
			shipService.updateNoShipLimitS(shipNum);
		return "";
	}	
	
	@PostMapping("/rest/updateShipTitle/{shipNum}")
	public @ResponseBody String updateShipTitle(@PathVariable Integer shipNum,String shipTitle){		
			shipService.updateShipTitleS(new Ship(shipNum,shipTitle));
		return "";
	}
	@PostMapping("/rest/updateShipSurvey/{shipNum}")
	public @ResponseBody String updateShipSurvey(@PathVariable Integer shipNum,String shipSurvey){		
			shipService.updateShipSurveyS(new Ship(shipNum,shipSurvey));
		return "";
	}	
	
	@PostMapping("/rest/updateShipLimitGender/{shipNum}")
	public @ResponseBody String updateShipLimitGender(@PathVariable Integer shipNum,String limitGender){		
			shipService.updateShipLimitGenderS(new Ship(shipNum,limitGender));
		return "";
	}
	
	@PostMapping("/rest/updateShipOpen/{shipNum}")
	public @ResponseBody String updateShipOpen(@PathVariable Integer shipNum,String shipOpen){		
			shipService.updateShipOpenS(new Ship(shipNum,shipOpen));
		return "";
	}
	
	@PostMapping("/rest/updateShipLocation/{shipNum}")
	public @ResponseBody String updateShipLocation(@PathVariable Integer shipNum, Integer cityNum, Integer townNum, Integer dongNum){		
		Ship ship = new Ship();	
		ship.setShipNum(shipNum);
		ship.setCityNum(cityNum);
		ship.setTownNum(townNum);
		ship.setDongNum(dongNum);
		shipService.updateShipLocationS(ship);
		return "";
	}
	
	@PostMapping("/rest/updateCrewNickname")
	public @ResponseBody String updateCrewNickname(Crew crew){		
		log.info("#crew : "+crew);
		crewService.updateCrewNicknameS(crew);
		return "";
	}
	@PostMapping("/rest/updateCrewPhoto")
	public @ResponseBody String updateCrewPhoto(Crew crew){
		log.info("#crew : "+crew);
		crewService.updateCrewPhotoS(crew);
		return "";
	}	
	
	@PostMapping(value="/rest/getShipPhotoInfo/{shipNum}")
	public @ResponseBody Map<String,List<Object>> getShipPhotoInfo(MultipartHttpServletRequest mhsr,@PathVariable int shipNum) {		
		String shipPath = Path.SHIP_STORE+shipNum+"/";
		
		service.setShipPath(shipPath);
		service.setMultipartRequest(mhsr);
		
		Map<String,List<Object>> map = service.getUpdateFileName();	
		log.info(" # attachBoardPhoto map : "+map);	
		return map;
	}
	
	@PostMapping("/rest/updateShipPhoto/{shipNum}")
	public @ResponseBody String updateShipPhoto(@PathVariable Integer shipNum,String shipPhotoName){		
		
		shipService.updateShipPhotoNameS(new Ship(shipNum,shipPhotoName));
		return "";
	}	
	
	@PostMapping("/rest/updateShipPhotoSample/{shipNum}")
	public @ResponseBody String updateShipPhotoSample(@PathVariable Integer shipNum,String shipPhotoName){		
		
		shipService.updateShipPhotoNameSampleS(new Ship(shipNum,shipPhotoName));
		return "";
	}	
	
	@PostMapping("/rest/updateShipBanner/{shipNum}")
	public @ResponseBody String updateShipBanner(@PathVariable Integer shipNum,String shipBannerName){		
		
		shipService.updateShipBannerNameS(new Ship(shipNum,shipBannerName));
		return "";
	}	
	
	   @PostMapping("/rest/getAttachFiles/{shipNum}")
	   public @ResponseBody List<BoardFile> getAttachFiles(@PathVariable Integer shipNum,HttpSession session){      
	      List<BoardFile> bfs = boardFileService.selectDocumentFileS(shipNum);
	      return bfs;
	   }
	   
	   @PostMapping("/rest/getAlbum/{shipNum}")
	   public @ResponseBody List<BoardPhotoVO> getAlbum(@PathVariable Integer shipNum,HttpSession session){      
	      List<BoardPhotoVO> bps = boardFileService.selectAlbumS(shipNum);
	      return bps;
	   }
	
	

}
