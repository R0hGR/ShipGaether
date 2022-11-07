package com.ship.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ntruss.apigw.ncloud.ApiClient;
import com.ntruss.apigw.ncloud.ApiResponse;
import com.ntruss.apigw.ncloud.api.V2Api;
import com.ntruss.apigw.ncloud.auth.PropertiesFileCredentialsProvider;
import com.ntruss.apigw.ncloud.exception.ApiException;
import com.ntruss.apigw.ncloud.exception.SdkException;
import com.ntruss.apigw.ncloud.marshaller.FormMarshaller;
import com.ntruss.apigw.ncloud.marshaller.JsonMarshaller;
import com.ntruss.apigw.ncloud.marshaller.XmlMarshaller;
import com.ntruss.apigw.ncloud.model.GetLocationRequest;
import com.ntruss.apigw.ncloud.model.GetLocationResponse;
import com.ship.domain.Board;
import com.ship.domain.Chat;
import com.ship.domain.City;
import com.ship.domain.Dong;
import com.ship.domain.Room;
import com.ship.domain.Ship;
import com.ship.domain.Town;
import com.ship.domain.Usr;
import com.ship.service.BoardService;
import com.ship.service.ChatService;
import com.ship.service.CityService;
import com.ship.service.CrewService;
import com.ship.service.DongService;
import com.ship.service.OnlineUsrService;
import com.ship.service.RoomService;
import com.ship.service.ShipService;
import com.ship.service.TownService;
import com.ship.service.UsrService;
import com.ship.util.KakaoManager;
import com.ship.util.MailManager;
import com.ship.util.MessageManager;
import com.ship.util.NaverManager;
import com.ship.util.PagingVO;
import com.ship.util.ShipSessionListener;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@RequestMapping("")
@Log4j
@AllArgsConstructor
public class IndexController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private CityService cityService;
	@Autowired
	private TownService townService;
	@Autowired
	private DongService dongService;
	@Autowired
	private UsrService usrService;
	@Autowired
	private ShipService shipService;
	@Autowired
	private CrewService crewService;
	@Autowired
	private ChatService chatService;
	@Autowired
	private RoomService roomService;
	@Autowired
	private OnlineUsrService onlineUsrService;

	// @Component
	@Autowired
	private MailManager mailManager;
	@Autowired
	private MessageManager messageManager;
	@Autowired
	private KakaoManager kakaoManger;
	@Autowired
	private NaverManager naverManager;
	@Autowired
	private ShipSessionListener sessionListener;

	@RequestMapping("/")
	public ModelAndView index(HttpSession session) {
		Map<Integer, HttpSession> sessions = ShipSessionListener.getOnlineSessions();
		Set<Integer> sessionNums = ShipSessionListener.getOnlineSessionNums();
		onlineUsrService.deleteOnlineUsrS();
		Iterator<Integer> it = sessionNums.iterator();
		List <Board> boards = boardService.selectByBoardViewS();
		for(Board board: boards) {
			board.setCrewNum(crewService.selectCrewS(board.getCrewNum()).getShipNum());
		}
		while (it.hasNext()) {
			int usrNum = it.next();
			if(onlineUsrService.selectOnlineUsrS(usrNum)<1) {
				onlineUsrService.insertOnlineUsrS(usrNum);
			}
		}
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("boards", boards);
		if (session.getAttribute("sessionId") != null) {				
			List<Usr> usrAll = usrService.selectAllS();
			int usrNum = (Integer) session.getAttribute("sessionId");
			Usr usrInfo = usrService.usrInfoS(usrNum);
			log.info(" # usrNum : " + usrNum);
			List<Ship> usrShips = shipService.selectShipOfUsrS(usrNum);
			List<Room> roomList = roomService.listS(usrNum);
			for (Room room : roomList) {
				room.setRoomNum(chatService.lastChattingS(chatService.lastS(room.getRoomId())).getChatContent());
			}
			session.setAttribute("roomList", roomList);
			session.setAttribute("usrAll", usrAll);
			session.setAttribute("sessionUsr", usrInfo);
			mv.addObject("usrInfo", usrInfo);
			mv.addObject("usrShips", usrShips);
			mv.addObject("roomList", roomList);
			mv.addObject("usrAll", usrAll);
			log.info(" # usrShips : " + usrShips);
			mv.addObject("countCrewOfUsrShip", usrShips);
		} else {
			List<City> cities = cityService.selectAllS();
			mv.addObject("cities", cities);
		}

		String ip="";
		try (java.util.Scanner s = new java.util.Scanner(new java.net.URL("https://api.ipify.org").openStream(),
				"UTF-8")) {
			ip = s.next();
		} catch (java.io.IOException e) {
			e.printStackTrace();
		}
		ApiClient apiClient = new ApiClient.ApiClientBuilder()
		.addMarshaller(JsonMarshaller.getInstance())
		.addMarshaller(XmlMarshaller.getInstance())
		.addMarshaller(FormMarshaller.getInstance())
		.setCredentials(new PropertiesFileCredentialsProvider("C:/Users/Kosmo/Desktop/RKR/Spring/sts-bundle/workspace/shipGaether/src/main/resources/credentials.properties").getCredentials())
		.setLogging(true)
		.build();
	
	V2Api apiInstance = new V2Api(apiClient);
	GetLocationRequest getLocationRequest = new GetLocationRequest(); // GetLocationRequest | getLocationRequest
	getLocationRequest.setExt("t");
	getLocationRequest.setResponseFormatType("json");
	getLocationRequest.setIp(ip);
	ApiResponse<GetLocationResponse> result = null;
	try {
		// Handler Successful response
		result = apiInstance.geoLocationGet(getLocationRequest);
	} catch (ApiException e) {
		// Handler Failed response
		int statusCode = e.getHttpStatusCode();
		Map<String, List<String>> responseHeaders = e.getHttpHeaders();
		InputStream byteStream = e.getByteStream();
		e.printStackTrace();
	} catch (SdkException e) {
		// Handle exceptions that occurred before communication with the server
		e.printStackTrace();
	}
		
		String address = result.getBody().getGeoLocation().getR3();
		String locationX = result.getBody().getGeoLocation().getLat();
		String locationY = result.getBody().getGeoLocation().getLong();
		log.info("##########"+locationX+locationY);
		int countRecShips = shipService.selectCountShipS();
		mv.addObject("countRecShips", countRecShips);
		
		int recCp=1;
		if(session.getAttribute("recCp") != null) {
			recCp = (Integer)session.getAttribute("recCp");		
		}
		PagingVO recPVO = new PagingVO(countRecShips,recCp,6);
		List<Ship> recShips = shipService.selectRecShipS(recPVO);
		mv.addObject("recPVO",recPVO);
		mv.addObject("recShips",recShips);
		mv.addObject("address", address);
		mv.addObject("locationX", locationX);
		mv.addObject("locationY", locationY);
		return mv;
	}
	
	@GetMapping("/recommendByLocation")
	public @ResponseBody ModelAndView recommend(Double locationX, Double locationY) {
		List<Ship> ships = shipService.selectAllS();
		List<Ship> shipRecommend = new ArrayList<Ship>();
		int count = 0;
		for(Ship ship: ships) {
			List<Dong> dongs = dongService.selectAllS();
			for(Dong dong: dongs) {
				if(dong.getDongNum() == ship.getDongNum()) {
					Double dongX = dong.getDongX();
					Double dongY = dong.getDongY();
					Double X = Math.sqrt(((locationX-dongX)*111)*((locationX-dongX)*111)+((locationY-dongY)*88.8)*((locationY-dongY)*88.8));			
					if(X < 2) {
						String toX = X.toString();
						ship.setUpdateThing(toX.substring(0,toX.indexOf(".")+2));
						shipRecommend.add(ship);
						count++;
					}
				}
			}

		}
		ModelAndView mv = new ModelAndView("recommend");
		mv.addObject("ship",shipRecommend);
		mv.addObject("countShips",count);
		return mv;
	}

	@GetMapping("/rest/login")
	public @ResponseBody String loginId(HttpServletRequest request, Usr loginUsr) {
		Boolean flag = usrService.checkExistIdS(loginUsr.getUsrId());
		if (flag) {
			Usr usr = usrService.loginS(loginUsr);
			if (usr != null) {
				HttpSession session = request.getSession(true);
				session.setAttribute("login", true);
				session.setAttribute("sessionId", usr.getUsrNum());
				session.setAttribute("sessionNickname", usr.getUsrNickname());
				session.setAttribute("sessionBirth", usr.getUsrBirth());
				session.setAttribute("recCp", 1);
				return "3"; // 3 = ����α���
			} else
				return "2"; // 2 = ���Ʋ��
		} else
			return "1"; // 1 = ���̵� ��ü�� ����
	}
	
	@PostMapping("/rest/doRecPaging")
	public @ResponseBody Map<String,Object> doRecPaging(int total, int nowPage , int cntPerPage , HttpSession session ) {
		session.setAttribute("recCp", nowPage);
		PagingVO recPVO = new PagingVO(total, nowPage, cntPerPage);
		log.info(" # /rest/recPaging  PVO : "+recPVO);
		List<Ship> recShips = shipService.selectRecShipS(recPVO);
		log.info(" # /rest/recPaging  recShips : "+recShips);
		
		Map<String,Object> map = new HashMap<>();
		map.put("recPVO", recPVO);
		map.put("recShips", recShips);		
		
		return map;
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@GetMapping("/rest/town")
	public @ResponseBody List<Town> townList(int cityNum) {
		List<Town> towns = townService.getTownS(cityNum);
		return towns;
	}
	
	@GetMapping("/rest/dong")
	public @ResponseBody List<Dong> dongList(int townNum) {
		List<Dong> dongs = dongService.getDongS(townNum);
		return dongs;
	}

	@PostMapping("/rest/updatePwd")
	public @ResponseBody String updatePwd(Usr updateUsr, String usrId, String usrPwd) {
		log.info("# IndexController updatePwd() updateUsr : " + updateUsr);
		log.info("# IndexController updatePwd() usrId : " + usrId);
		log.info("# IndexController updatePwd() usrPwd : " + usrPwd);
		usrService.updateUsrPwdS(updateUsr);
		return "";
	}

	@RequestMapping(value = "/roomExit", method = RequestMethod.POST)
	public void exit(@RequestParam(value = "roomIdx") int roomIdx, @RequestParam(value = "usrNumx") int usrNumx) {
		Map<String, Object> map = new HashMap<>();
		map.put("roomId", roomIdx);
		map.put("roomMember", usrNumx);
		roomService.deleteS(map);
		Chat chat = new Chat();
		List<Room> rooms = roomService.roomInfoS(roomIdx);
		StringBuilder sb = new StringBuilder();
		for(Room room: rooms) {
			Usr usr = usrService.usrInfoS(room.getRoomMember());
			String name = usr.getUsrNickname();
			if (sb.length() != 0) {
				sb.append(", ");
			}
			sb.append(name);
		}
		String roomName = sb.toString();
		for(Room room: rooms) {
			room.setRoomName(roomName);
			roomService.updateS(room);
		}	
		chat.setChatSender(Integer.toString(usrNumx));
		chat.setChatContent("퇴장!");
		chat.setRoomId(roomIdx);
		chatService.insertS(chat);
	}

	@RequestMapping(value = "/roomCreate", method = RequestMethod.POST)
	public String createRoom(@RequestParam(value = "roomMember[]") List<String> roomMember, HttpSession session) {
		log.info("# roomMember : " + roomMember);
		Integer maxRoomId = roomService.maxRoomIdS();
		if (maxRoomId == null) {
			maxRoomId = 0;
		}
		Room room = new Room();
		StringBuilder sb = new StringBuilder();
		for (String num : roomMember) {
			Usr usr = usrService.usrInfoS(Integer.parseInt(num));
			String name = usr.getUsrNickname();
			if (sb.length() != 0) {
				sb.append(", ");
			}
			sb.append(name);

		}

		String roomName = sb.toString();
		for (String num : roomMember) {
			room.setRoomId(maxRoomId + 1);
			room.setRoomName(roomName);
			room.setRoomMember(Integer.parseInt(num));
			roomService.insertS(room);
		}
		Chat chat = new Chat();
		chat.setChatSender((session.getAttribute("sessionId") + ""));
		chat.setChatContent(roomName+"초대!");
		chat.setRoomId(maxRoomId + 1);
		chat.setUsrPhotoPath(usrService.usrInfoS(Integer.parseInt(session.getAttribute("sessionId") + "")).getUsrPhotoPath());
		chatService.insertS(chat);
		return "redirect:/";
	}

	@RequestMapping(value = "/roomInvite", method = RequestMethod.POST)
	public ModelAndView inviteRoom(@RequestParam(value = "roomMember[]") List<String> roomMember, HttpSession session,
			String roomName, int roomId, int memberCount,
			@RequestParam(value = "memberListS[]") List<String> memberListS) {
		log.info("# roomMember : " + roomMember);
		Room room = new Room();
		StringBuilder sb = new StringBuilder();
		sb.append(roomName);
		for (String num : roomMember) {
			Usr usr = usrService.usrInfoS(Integer.parseInt(num));
			String name = usr.getUsrNickname();
			if (sb.length() != 0) {
				sb.append(", ");
			}
			sb.append(name);
		}
		roomName = sb.toString();
		for (String num : roomMember) {
			memberCount++;
			room.setRoomId(roomId);
			room.setRoomName(roomName);
			room.setRoomMember(Integer.parseInt(num));
			roomService.insertS(room);
		}
		for (String usrNumS : memberListS) {
			int usrNum = Integer.parseInt(usrNumS);
			room.setRoomId(roomId);
			room.setRoomName(roomName);
			room.setRoomMember(usrNum);
			roomService.updateS(room);
		}
		List<Usr> memberList = new ArrayList<Usr>();
		List<Usr> nonMemberList = new ArrayList<Usr>();
		List<Usr> usrAll = usrService.selectAllS();
		List<Room> rooms = roomService.roomInfoS(roomId);
		for (Room roomS : rooms) {
			int memberNum = roomS.getRoomMember();
			Usr usrInfo = usrService.usrInfoS(memberNum);
			memberList.add(usrInfo);
		}
		for (Usr usr : usrAll) {
			if (memberList.contains(usr)) {
			} else {
				Usr usrInfo = usrService.usrInfoS(usr.getUsrNum());
				nonMemberList.add(usrInfo);
			}
		}
		Usr sendUsr = usrService.usrInfoS((Integer)session.getAttribute("sessionId"));
		Chat chat = new Chat();
		chat.setChatSender(sendUsr.getUsrNum()+"");
		chat.setChatContent("invite 성공!");
		if(sendUsr.getUsrPhotoPath().equals("default")){
			chat.setUsrPhotoPath("images/defaultPhoto.jpg");
		}else {
			chat.setUsrPhotoPath(sendUsr.getUsrPhotoPath());
		}
		chat.setRoomId(roomId);
		chatService.insertS(chat);
		ModelAndView mv = new ModelAndView("/chat");
		mv.addObject("memberCount", memberCount);
		mv.addObject("memberList", memberList);
		mv.addObject("nonMemberList", nonMemberList);
		mv.addObject("roomName", roomName);
		mv.addObject("roomId", roomId);
		return mv;
	}

	@RequestMapping(value = "/room")
	public ModelAndView enterRoom(int roomId) {
		List<Room> rooms = roomService.roomInfoS(roomId);
		String roomName = rooms.get(0).getRoomName();
		int memberCount = 0;
		List<Usr> memberList = new ArrayList<Usr>();
		List<Usr> nonMemberList = new ArrayList<Usr>();
		List<Usr> usrAll = usrService.selectAllS();
		for (Room roomS : rooms) {
			memberCount++;
			int memberNum = roomS.getRoomMember();
			Usr usrInfo = usrService.usrInfoS(memberNum);
			memberList.add(usrInfo);
		}
		for (Usr usr : usrAll) {
			if (memberList.contains(usr)) {
			} else {
				Usr usrInfo = usrService.usrInfoS(usr.getUsrNum());
				nonMemberList.add(usrInfo);
			}
		}
		ModelAndView mv = new ModelAndView("/chat");
		mv.addObject("memberCount", memberCount);
		mv.addObject("memberList", memberList);
		mv.addObject("nonMemberList", nonMemberList);
		mv.addObject("roomName", roomName);
		mv.addObject("roomId", roomId);
		return mv;
	}

	@PostMapping("/rest/sendUsrPhoneCode")
	public @ResponseBody String sendUsrPhoneCode(String usrPhone) throws CoolsmsException {
//		log.info(" # IndexController sendUsrPhoneCode() usrPhone : " + usrPhone);
//		return "1111"; // 테스트용
		String phoneCode = messageManager.sendUsrPhoneCode(usrPhone);
		return phoneCode;
	}

	@GetMapping("/rest/checkDupId")
	public @ResponseBody Boolean checkDupId(String usrId) {
		log.info("# IndexController checkDupId() usrId : " + usrId);
		Boolean flag = usrService.checkExistIdS(usrId);
		return flag;
	}

	@GetMapping("/rest/checkDupPhone")
	public @ResponseBody Boolean checkDupPhone(String usrPhone) {
		log.info("# IndexController checkDupPhone() usrPhone : " + usrPhone);
		Boolean flag = usrService.checkExistPhoneS(usrPhone);
		return flag;
	}

	@GetMapping("/rest/checkIdWithPhone")
	public @ResponseBody Boolean checkIdWithPhone(Usr findUsr) {
		log.info("# IndexController checkIdWithPhone() findUsr : " + findUsr);
		Boolean flag = usrService.checkIdWithPhoneS(findUsr);
		return flag;
	}

	@GetMapping("/rest/checkDupEmail")
	public @ResponseBody Boolean checkDupEmail(String usrEmail) {
		log.info("# IndexController checkDupEmail() usrEmail : " + usrEmail);
		Boolean flag = usrService.checkExistEmailS(usrEmail);
		return flag;
	}

	@PostMapping("/signUp")
	public String signUp(Usr newUsr) {
		log.info(" # IndexController signUp() newUsr : " + newUsr);
		usrService.insertNewUsrS(newUsr);
		return "redirect:/";
	}

	@PostMapping("/rest/sendUsrEmailcode") // redirect
	public @ResponseBody String sendUsrEmailcode(String usrEmail, String usrName) throws Exception {
		String code = mailManager.sendUsrEmailCode(usrEmail, usrName);
		return code;
	}

	@GetMapping("/rest/findId")
	public @ResponseBody String findId(Usr findUsr) {
		log.info(" # IndexController findId() findUsr : " + findUsr);
		return usrService.findForgetIdS(findUsr);
	}

	@GetMapping("/user/kakao/callback")
	public String kakaoLogin(HttpServletRequest request, String code) throws Exception {
		log.info("\n # HtmlController.kakaoLogin() 처음받은 code : " + code + "\n");
		Usr loginUsr = kakaoManger.insertKakaoUsr(code);
		HttpSession session = request.getSession(true);
		session.setAttribute("login",true);
		session.setAttribute("sessionId", loginUsr.getUsrNum());
		session.setAttribute("sessionNickname", loginUsr.getUsrName());
		
		return "redirect:/";
	}
	
	@GetMapping("/user/naver/callback")
	public String naverLogin(HttpServletRequest request, String code) throws Exception {
		log.info("\n # HtmlController.kakaoLogin() 처음받은 code : " + code + "\n");
		Usr loginUsr = naverManager.insertNaverUsr(code);
		HttpSession session = request.getSession(true);
		session.setAttribute("login",true);
		session.setAttribute("sessionId", loginUsr.getUsrNum());
		session.setAttribute("sessionNickname", loginUsr.getUsrName());
		
		return "redirect:/";
	}
}
