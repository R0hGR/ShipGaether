package com.ship.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ship.domain.Board;
import com.ship.domain.BoardFile;
import com.ship.domain.BoardGood;
import com.ship.domain.ReplyGood;
import com.ship.service.BoardFileService;
import com.ship.service.BoardGoodService;
import com.ship.service.BoardService;
import com.ship.service.DragdropService;
import com.ship.util.BoardNumVO;
import com.ship.util.Path;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class BoardController {
      
   
   @Autowired
   private BoardService boardService;
   @Autowired
   private BoardGoodService boardGoodService;
   @Autowired
   private BoardFileService boardFileService;
   @Autowired
   private DragdropService service;
   
   @GetMapping("/download.do/{shipNum}")
   public ModelAndView fileViewResolver(@PathVariable String shipNum ,String fname) {
      log.info(" # fileViewResolver fname : "+ fname );       
      
      File file = new File(Path.SHIP_STORE+shipNum+"/",fname);
      
      if (file.exists()) {
         return new ModelAndView("fileDownloadView", "downloadFile", file);                                                            
      } else {
         return new ModelAndView("redirect:list.do");
      }
   }
   
   @PostMapping("/rest/updateBoardView")
   public @ResponseBody String updateBoardView(int boardNum) {
      log.info(" # updateBoardView boardNum : "+ boardNum);
      boardService.updateBoardViewS(boardNum);
      
      return "";
   }
   
   @PostMapping("/rest/getBoardDocumentFileCounts")
   public @ResponseBody List<BoardFile> getBoardDocumentFileCounts() {
      List<BoardFile> boardDocumentFileCounts = boardFileService.selectCountAllDocumentFileS();
      return boardDocumentFileCounts;
   }
   
   @PostMapping("/rest/addBoardGood")
   public @ResponseBody BoardGood addBoardGood(BoardGood boardGood){
      log.info(" # addBoardGood boardGood : "+ boardGood);
      boardGoodService.insertBoardGoodS(boardGood);
      List<BoardGood> boardGoods= boardGoodService.selectAllCountS();
      for ( BoardGood bg : boardGoods) {               
         boardService.syncBoardGoodS(bg);
      }
      
      log.info(" # boardGoods : "+ boardGoods);
      BoardGood bg = boardGoodService.selectCountS(boardGood.getBoardNum());
      return bg;
   }
   
   @PostMapping("/rest/cancelBoardGood")
   public @ResponseBody BoardGood cancelBoardGood(BoardGood boardGood) {
      log.info(" # cancelBoardGood boardGood : "+ boardGood);
      boardGoodService.deleteBoardGoodS(boardGood);
      BoardGood bg = boardGoodService.selectCountS(boardGood.getBoardNum());
      
      List<BoardGood> boardGoods= boardGoodService.selectAllCountS();
      boardService.resetBoardGoodS();
      for ( BoardGood item : boardGoods) {               
         boardService.syncBoardGoodS(item); // item = bg
      }
      log.info(" # cancelBoardGood bg : "+ bg);
      return bg;
   }
   
   @PostMapping("/rest/getBoardGoodCounts")
   public @ResponseBody List<BoardGood> getBoardGoodCounts (){
      List<BoardGood> boardGoods= boardGoodService.selectAllCountS();
      
      return boardGoods;
   }
   
   @PostMapping("/rest/getBoardGood")
   public @ResponseBody List<BoardGood> getBoardGood(String request) {
      log.info(" # getBoardGood getBoardGood : "+request);
      List<BoardGood> boardGoods = boardGoodService.selectAllS();   
      return boardGoods; 
   }   
    
   @PostMapping("/rest/insertBoardFile")
   public @ResponseBody String insertPhotoFile( BoardFile boardFile){
      log.info(" # /rest/insertBoardFile insertPhotoFile boardFile : "+boardFile);
      boardFileService.insertPhotoFileS(boardFile);
      return "";
   }
   

   
   @PostMapping("/rest/deleteFile")
   public @ResponseBody String deleteFile( String boardFileSaveName){
      log.info(" # insertPhotoFile boardFileSaveName : "+boardFileSaveName);
      boardFileService.deleteFileS(boardFileSaveName);
      return "";
   }
   
   
   @PostMapping("/rest/removePhotoFilePath/{shipNum}")
   public @ResponseBody String removePhotoFilePath( String boardFileSaveName , @PathVariable String shipNum){
      log.info(" # removePhotoFilePath boardFileSaveName : "+boardFileSaveName);
      String fullDeleteFilePath = Path.SHIP_STORE+shipNum+"/"+boardFileSaveName;
      
      File file = new File(fullDeleteFilePath);
      if(file.exists())file.delete(); 
      
      return "";
   }
   
   @PostMapping("/rest/insertBoard")
   public @ResponseBody String insertBoard( Board newBoard ){
      log.info(" # newBoard : "+newBoard);
      boardService.insertNewBoardS(newBoard);
      String boardNum = Integer.toString(newBoard.getBoardNum());
      return boardNum ;   
   }
   
   @PostMapping("/rest/updateBoard")
   public @ResponseBody String updateBoard( Board board ){
      log.info(" # updateBoard board : "+board);
      boardService.updateBoardS(board);
      return "";   
   }
   
   @PostMapping("/rest/deleteBoard")
   public @ResponseBody String deleteBoard( int boardNum ){
      log.info(" # deleteBoard boardNum  : "+boardNum);
      boardService.deleteBoardS(boardNum);
      
      return "" ;   
   }
   
   @PostMapping("/rest/selectBeforPhotoFiles")
   public @ResponseBody List<BoardFile> selectBefordFiles( int boardNum ){
      log.info(" # selectBefordFiles boardNum : "+boardNum);
      List<BoardFile> bfs = boardFileService.selectBoardFileSaveNameS(boardNum);//썸네일로 보이는 포토사진만 셀렉
      return bfs;   
   }
   
   
   //application/x-www-form-urlencoded << 이렇게 해야 ajax와 타입 맞아서 UTF-8 사용가능,produces = "application/x-www-form-urlencoded; charset=utf8"
   @PostMapping(value="/rest/attachBoardPhoto/{shipNum}")
   public @ResponseBody Map<String,List<Object>> attachBoardPhoto(MultipartHttpServletRequest mhsr,@PathVariable int shipNum) {      
      String shipPath = Path.SHIP_STORE+shipNum+"/";
      
      service.setShipPath(shipPath);
      service.setMultipartRequest(mhsr);
      
      Map<String,List<Object>> map = service.getUpdateFileName();   
      log.info(" # attachBoardPhoto map : "+map);   
      return map;
   }   
   
   
   @PostMapping("/rest/fileUpload/{shipNum}")
   public @ResponseBody Map<String,List<Object>> fileUpload(MultipartHttpServletRequest mhsr,@PathVariable int shipNum) {
      log.info(" # shipNum : "+shipNum);
      String shipPath = Path.SHIP_STORE+shipNum+"/";
      
      service.setShipPath(shipPath);
      service.setMultipartRequest(mhsr);      
      Map<String,List<Object>> map = service.getUpdateFileName();      
      log.info(" # fileUpload map : "+map);      
      return map;
   }

   
   @PostMapping("/rest/openReadBoard")
   public @ResponseBody Map<String, Object> openReadBoard(int boardNum, int shipNum){
      log.info(" # openReadBoard  boardNum : "+boardNum);
      Board board = boardService.selectOneBoardS(boardNum);
      
      BoardNumVO bnvo = new BoardNumVO(board.getBoardNum(),shipNum);
      log.info(" # bnvo : "+ bnvo);
      BoardNumVO surroundingBoardNum = boardService.selectSurroundingBoardNumS(bnvo);
      
      Map<String, Object> map = new HashMap<String, Object>();
      
      map.put("board", board);
      map.put("surroundingBoardNum", surroundingBoardNum);
      
      return map;
   }
   
   
   
   

}