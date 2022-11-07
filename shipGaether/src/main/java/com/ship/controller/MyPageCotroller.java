package com.ship.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ship.domain.Application;
import com.ship.domain.Board;
import com.ship.domain.City;
import com.ship.domain.Crew;
import com.ship.domain.Note;
import com.ship.domain.Notice;
import com.ship.domain.Ship;
import com.ship.domain.Usr;
import com.ship.service.ApplicationService;
import com.ship.service.BoardService;
import com.ship.service.ChatService;
import com.ship.service.CityService;
import com.ship.service.CrewService;
import com.ship.service.DragdropService;
import com.ship.service.NoteService;
import com.ship.service.NoticeService;
import com.ship.service.ShipService;
import com.ship.service.UsrService;
import com.ship.util.NoteSearchVO;
import com.ship.util.PagingVO;
import com.ship.util.Path;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MyPageCotroller {
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private UsrService usrService;
	
	@Autowired
	private ApplicationService applicationService;
	
	@Autowired
	private	ShipService shipService;
	
	@Autowired
	private	CrewService crewService;
	
	@Autowired
	private NoteService noteService;
	
	@Autowired
	private ChatService chatService;
	
	@Autowired
	private DragdropService service;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private CityService cityService;
	
	
	@PostMapping("/rest/sendNote/getSendNoteBySearch")
	   public @ResponseBody Map<String, Object> getSendNoteBySearch( HttpSession session , String category, String keyword ){
	      int usrNum = (Integer) session.getAttribute("sessionId");      
	      
	      NoteSearchVO nsvo = new NoteSearchVO(usrNum,category,keyword);
	      int count = noteService.selectCountSendNoteBySearchS(nsvo);
	      
	      int sendNoteSearchCp = 1;
	      
	      PagingVO pVO = new PagingVO(count,sendNoteSearchCp,10,usrNum,category,keyword);
	      if (pVO.getNowPage() > sendNoteSearchCp ) {
	         pVO.setNowPage(1);
	      }
	      
	      List<Note> notes = noteService.selectSendNoteBySearchS(pVO);      
	      
	      Map<String, Object> map = new HashMap<>();
	      map.put("sendNotePVO", pVO);
	      map.put("sendNotesP", notes);

	      return map;
	   }
	   
	   @PostMapping("/rest/sendNote/crewNickname/autoData")
	   public @ResponseBody List<Note> getReceiveNoteCrewList( HttpSession session , String category, String crewNickname ){
	      int usrNum = (Integer) session.getAttribute("sessionId");
	      List<Note> notes = noteService.selectAutoNicknameS(new NoteSearchVO(usrNum,category,crewNickname));
	      return notes;
	   }
	   
	   @PostMapping("/rest/insertNotice")
		public @ResponseBody String insertNotice(Notice notice) {		  
		  log.info("# Notice:"+notice);
		  noticeService.insertNoticeS(notice);
		  return "";
		}
		
		@PostMapping("/rest/updateNotice")
		public @ResponseBody String updateNotice(Notice notice) {		  
		  log.info("# Notice:"+notice);
		  noticeService.updateNoticeS(notice);
		  return "";
		}
		
		@PostMapping("/rest/deleteNotice")
		public @ResponseBody String deleteNotice(int noticeNum) {
			log.info("#noticeNum"+noticeNum);
			noticeService.deleteNoticeS(noticeNum);
			return "";
		}
		
	   
	   @GetMapping("/note")
	   public String note(HttpSession session, Model m) {
	      int usrNum = (int) session.getAttribute("sessionId");
	      
	      
	      NoteSearchVO nsvoAll = new NoteSearchVO(usrNum,"all","","all");
	      NoteSearchVO nsvoUnRead = new NoteSearchVO(usrNum,"all","","unRead");
	      NoteSearchVO nsvoRead = new NoteSearchVO(usrNum,"all","","read");
	      
	      int totalAll = noteService.getReceiveNoteCountS(nsvoAll);
	      int totalUnRead = noteService.getReceiveNoteCountS(nsvoUnRead);
	      int totalRead = noteService.getReceiveNoteCountS(nsvoRead);
	      
	      PagingVO receiveAllNotePVO = new PagingVO(totalAll, 1, 10, usrNum,"all","","all");
	      PagingVO receiveUnReadNotePVO = new PagingVO(totalUnRead, 1, 10, usrNum,"all","","unRead");
	      PagingVO receiveReadNotePVO = new PagingVO(totalRead, 1, 10, usrNum,"all","","read");
	      
	      m.addAttribute("receiveAllNotePVO", receiveAllNotePVO);
	      m.addAttribute("receiveUnReadNotePVO", receiveUnReadNotePVO);
	      m.addAttribute("receiveReadNotePVO", receiveReadNotePVO);
	      
	      List<Note> allNotes = noteService.selectReceiveNoteBySearchS(receiveAllNotePVO);
	      List<Note> unReadNotes = noteService.selectReceiveNoteBySearchS(receiveUnReadNotePVO);
	      List<Note> readNotes = noteService.selectReceiveNoteBySearchS(receiveReadNotePVO);

	      m.addAttribute("allNotes", allNotes);
	      m.addAttribute("unReadNotes", unReadNotes);
	      m.addAttribute("readNotes", readNotes);
	      
	      return "/myPage/note";
	   }
	   
	   @PostMapping("/rest/doReceiveNotePaging")
	   public @ResponseBody Map<String, Object> doReceiveNotePagingAllNote(int nowPage, int cntPerPage,
	      HttpSession session, String category, String keyword, String theme, NoteSearchVO nsvo ) {      
	      int usrNum = (int) session.getAttribute("sessionId");
	      
	      nsvo.setUsrNum(usrNum);
	      nsvo.setTheme(theme);
	      
	      int total = noteService.getReceiveNoteCountS(nsvo);
	      
	      PagingVO notePVO = new PagingVO(total, nowPage, 10, usrNum,category,keyword,theme);
	      
	      List<Note> receiveNotes = noteService.selectReceiveNoteBySearchS(notePVO);
	      
	      Map<String, Object> map = new HashMap<>();      
	      map.put("notePVO", notePVO);
	      map.put("receiveNotes", receiveNotes);   

	      return map;
	   }
	   
	
	   @GetMapping("/notice")
		public String myNotice(HttpSession session,Model m) {
			List<Notice> notice= noticeService.noticeAllS();
			   log.info("#notice : " +notice);
			   for (Notice note:  notice) {
				   note.setNoticeDate(note.getNoticeDate().substring(0,note.getNoticeDate().indexOf(" ")));
			   }
			   m.addAttribute("notice",notice);
			return "/myPage/notice";
		}
		@GetMapping("/noticeWrite")
			public String noticeWrite() {
			return "/myPage/noticeWrite";
	   }
		@GetMapping("/noticeUpdate")
		public ModelAndView noticeUpdate(int noticeNum) {
			Notice noticecontent =noticeService.noticecontentS(noticeNum);
			log.info("������ �׽�Ʈ: "+ noticecontent);
			ModelAndView mv = new ModelAndView("/myPage/noticeUpdate", "noticecontent", noticecontent); 
		return mv;
	}
	   

	   @PostMapping("/rest/deleteNote")
	   public @ResponseBody String deleteNote(int noteNum) {
	      noteService.deleteNoteS(noteNum);
	      return "";
	   }

	   @PostMapping("/rest/updateNote")
	   public @ResponseBody String updateNote(int noteNum) {
	      noteService.updateNoteS(noteNum);
	      return "";
	   }
	
	@PostMapping("/rest/updateBookmarkOn")
	public @ResponseBody String updateBookmarkOn(int usrNum, int shipNum) {
		crewService.updateBookmarkOnS( new Crew(usrNum, shipNum));
		return "";
	}		
	@PostMapping("/rest/updateBookmarkOff")
	public @ResponseBody String updateBookmarkOff(int usrNum, int shipNum) {
		crewService.updateBookmarkOffS( new Crew(usrNum, shipNum));
		return "";
	}			
	
	@PostMapping("/rest/deleteMyApp")
	public @ResponseBody String deleteMyApp(int usrNum, int shipNum) {
		applicationService.deleteMyAppS( new Application(usrNum, shipNum));
		return "";
	}	

	@PostMapping("/rest/updateMyUsrName")
	public @ResponseBody String updateMyUsrName(int usrNum, String usrName) {
		usrService.updateUsrNameS(new Usr(usrNum, usrName));
		return "";
	}
	@PostMapping("/rest/updateMyCity")
	public @ResponseBody String updateMyCity(int usrNum, Integer usrCity, Integer usrTown) {
		usrService.updateMyCityS(new Usr(usrNum, usrCity, usrTown));
		return "";
	}
	
	@PostMapping("/rest/updateMyUsrNickname")
	public @ResponseBody String updateMyUsrNickname(int usrNum, String usrNickname) {
		usrService.updateUsrNicknameS(new Usr(usrNum, usrNickname));
		return "";
	}	
	@PostMapping("/rest/updateMyUsrBirth")
	public @ResponseBody String updateMyUsrBirth(int usrNum, String usrBirth) {
		usrService.updateMyUsrBirthS(new Usr(usrNum, usrBirth));
		return "";
	}		
	
	@PostMapping("/rest/updateMyUsrGender")
	public @ResponseBody String updateMyUsrGender(int usrNum, String usrGender) {
		usrService.updateMyUsrGenderS(new Usr(usrNum, usrGender));
		return "";
	}
	
	@PostMapping("/rest/updateMyUsrEmail")
	public @ResponseBody String updateMyUsrEmail(int usrNum, String usrEmail) {
		usrService.updateMyUsrEmailS(new Usr(usrNum, usrEmail));
		return "";
	}	
	@PostMapping("/rest/updateMyUsrPhone")
	public @ResponseBody String updateMyUsrPhone(int usrNum, String usrPhone) {
		usrService.updateMyUsrPhoneS(new Usr(usrNum, usrPhone));
		return "";
	}		
	@PostMapping("/rest/updateMyUsrPwd")
	public @ResponseBody String updateMyUsrPwd(int usrNum, String usrPwd) {
		usrService.updateMyUsrPwdS(new Usr(usrNum, usrPwd));
		return "";
	}	

	@GetMapping("/info")
	public String myPageIndex(HttpSession session, Model m) {
		int usrNum = (int) session.getAttribute("sessionId");
		Usr usrInfo = usrService.usrInfoS(usrNum);
		List<City> cities = cityService.selectAllS();
		m.addAttribute("usrInfo", usrInfo);
		m.addAttribute("cities", cities);
		return "/myPage/info";
	}
	
	@PostMapping(value="/rest/getUsrPhotoInfo/{usrNum}")
	public @ResponseBody Map<String,List<Object>> getUsrPhotoInfo(MultipartHttpServletRequest mhsr,@PathVariable String usrNum) {
		String shipPath = Path.SHIP_STORE+"usr/"+usrNum+"/";
		service.setShipPath(shipPath);
		service.setMultipartRequest(mhsr);	
		File dir = new File(shipPath);
		if (!dir.exists())dir.mkdirs();
		Map<String,List<Object>> map = service.getUpdateFileName();	
		log.info("#################: "+map);	
		return map;
	}
	
	@PostMapping("/rest/updateUsrPhotoPath")
	public @ResponseBody String updateUsrPhoto(Usr usr) {
		log.info("#usr : "+usr);
		usrService.updateUsrPhotoPathS(usr);
		chatService.updateS(usr.getUsrNum(),usr.getUsrPhotoPath());
		
		return "";
	}

	@GetMapping("/board")
	public String myWrite(HttpSession session, Model m) {
		List<Board> boards = boardService.selectAllS();
		List<Board> boardMy = new ArrayList<Board>();
		for(Board board: boards) {
			if ((Integer)(session.getAttribute("sessionId")) == crewService.selectCrewS(board.getCrewNum()).getUsrNum()) {
				board.setCrewPhoto(crewService.selectCrewS(board.getCrewNum()).getCrewPhoto());
				board.setCrewNum(crewService.selectCrewS(board.getCrewNum()).getShipNum());
				board.setBoardText(shipService.selectShipS(crewService.selectCrewS(board.getCrewNum()).getShipNum()).getShipName());
				boardMy.add(board);
			}
		}
		m.addAttribute("boardMy", boardMy);
		return "/myPage/board";
	}

	@GetMapping("/bookmark")
	public String myBookMark(HttpSession session, Model m) {
		int usrNum = (int) session.getAttribute("sessionId");
		List<Ship> myShips = shipService.selectMyShipS(usrNum);
		m.addAttribute("myShips", myShips);
		List<Ship> myBookmarkShips = shipService.selectMyBookmarkShipS(usrNum);
		m.addAttribute("myBookmarkShips", myBookmarkShips);
		
		
		return "/myPage/bookmark";
	}

	@GetMapping("/application")
	public String myShip( HttpSession session, Model m ) {
		int usrNum = (int) session.getAttribute("sessionId");
		log.info(" # myShip usrNum : "+usrNum);
		List<Application> apps = applicationService.selectMyIncompleteAppS(usrNum);
		m.addAttribute("apps", apps);
		return "/myPage/application";
	}
	
	@GetMapping("/note/send")
	   public String noteSend(HttpSession session, Model m, String category, String keyword) {
	      int usrNum = (int) session.getAttribute("sessionId");

	      log.info("# category : " + category);

	      int sendNoteCp = 1;
	      if (session.getAttribute("sendNoteCp") != null) {
	         sendNoteCp = (Integer) session.getAttribute("sendNoteCp");
	      }
	      
	      int countMySendNotes = noteService.selectCountMySendNoteS(usrNum);
	      PagingVO sendNotePVO = new PagingVO(countMySendNotes, sendNoteCp, 10, usrNum);

	      List<Note> sendNotesP = noteService.selectSendNotePagingS(sendNotePVO);      

	      m.addAttribute("sendNotes", sendNotesP);
	      m.addAttribute("sendNotePVO", sendNotePVO);
	      m.addAttribute("countMySendNotes", countMySendNotes);

	      return "/myPage/noteSend";

	   }
	
	@PostMapping("/rest/doSendNotePaging")
	   public @ResponseBody Map<String, Object> doSendNotePaging(int total, int nowPage, int cntPerPage,
	         HttpSession session, String category, String keyword) {
	      
	      
	      int usrNum = (int) session.getAttribute("sessionId");
	      PagingVO sendNotePVO = new PagingVO();
	      Map<String, Object> map = new HashMap<>();
	      if(keyword==null) {
	         session.setAttribute("sendNoteCp", nowPage);
	         sendNotePVO = new PagingVO(total, nowPage, 10, usrNum);
	         List<Note> sendNotesP = noteService.selectSendNotePagingS(sendNotePVO);         
	         map.put("sendNotePVO", sendNotePVO);
	         map.put("sendNotesP", sendNotesP);
	      }else{
	         
	         sendNotePVO = new PagingVO(total,nowPage,10,usrNum,category,keyword);
	         List<Note> sendNotesP = noteService.selectSendNoteBySearchS(sendNotePVO);         
	         map.put("sendNotePVO", sendNotePVO);
	         map.put("sendNotesP", sendNotesP);         
	      }
	       
	      return map;
	   }

	@GetMapping("/mySettingIndex")
	public String mySettingIndex() {
		return "/myPage/mySettingIndex";
	}

	@GetMapping("/mySettingCookie")
	public String mySettingCookie() {
		return "/myPage/mySettingCookie";
	}

	@GetMapping("/mySettingEmail")
	public String mySettingEmail() {
		return "/myPage/mySettingEmail";
	}

	@GetMapping("/mySettingHelp/1")
	public String mySettingHelp1() {
		return "/myPage/mySettingHelp_1";
	}

	@GetMapping("/mySettingHelp/2")
	public String mySettingHelp2() {
		return "/myPage/mySettingHelp_2";
	}

	@GetMapping("/mySettingHelp/3")
	public String mySettingHelp3() {
		return "/myPage/mySettingHelp_3";
	}

	@GetMapping("/mySettingHelp/4")
	public String mySettingHelp4() {
		return "/myPage/mySettingHelp_4";
	}

	@GetMapping("/mySettingHelp/5")
	public String mySettingHelp5() {
		return "/myPage/mySettingHelp_5";
	}

	@GetMapping("/mySettingHelp/6")
	public String mySettingHelp6() {
		return "/myPage/mySettingHelp_6";
	}

}
