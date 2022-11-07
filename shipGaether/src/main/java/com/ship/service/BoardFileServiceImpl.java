package com.ship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ship.domain.Board;
import com.ship.domain.BoardFile;
import com.ship.mapper.BoardFileMapper;
import com.ship.mapper.BoardMapper;
import com.ship.util.BoardPhotoVO;

@Service
public class BoardFileServiceImpl implements BoardFileService {
   
   @Autowired
   private BoardFileMapper boardFileMapper;

   @Override
   public List<BoardFile> selectAllFileS(){
      return boardFileMapper.selectAllFile();      
   }
   @Override
   public List<BoardFile> selectCountFileS(){
      return boardFileMapper.selectCountFile();      
   }
   @Override
   public List<BoardFile> selectCountAllDocumentFileS(){
      return boardFileMapper.selectCountAllDocumentFile();
   }
   @Override
   public List<BoardFile> selectBoardFileSaveNameS(int boardNum){
      return boardFileMapper.selectBoardFileSaveName(boardNum);
   }
   @Override
   public List<BoardFile> selectRecentlyBoardFileS(int shipNum){
      return boardFileMapper.selectRecentlyBoardFile(shipNum);
   }
   @Override
   public List<BoardFile> selectDocumentFileS(int shipNum){
      return boardFileMapper.selectDocumentFile(shipNum);
   }
   @Override
   public List<BoardFile> selectFileDateS(int shipNum){
      return boardFileMapper.selectFileDate(shipNum);
   }
   
   
   
   @Override
   public List<BoardPhotoVO> selectAlbumS(int shipNum){
      return boardFileMapper.selectAlbum(shipNum);      
   }
   
   
   
   @Override
   public BoardFile selectFileInfoS(String boardFileSaveName) {
      return boardFileMapper.selectFileInfo(boardFileSaveName);
   }
   
   
   
   
   
   @Override
   public void insertPhotoFileS(BoardFile boardFile) {
      boardFileMapper.insertPhotoFile(boardFile);
   }
   
   @Override
   public void insertFileS(BoardFile boardFile) {
      boardFileMapper.insertFile();      
   }
   
   @Override
   public void deleteFileS(String boardFileSaveName) {
      boardFileMapper.deleteFile(boardFileSaveName);
   }
   
}