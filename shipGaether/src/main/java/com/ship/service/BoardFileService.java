package com.ship.service;

import java.util.List;

import com.ship.domain.BoardFile;
import com.ship.util.BoardPhotoVO;

public interface BoardFileService {

   List<BoardFile> selectAllFileS();

   List<BoardFile> selectCountFileS();

   List<BoardFile> selectCountAllDocumentFileS();

   List<BoardFile> selectBoardFileSaveNameS(int boardNum);

   List<BoardFile> selectRecentlyBoardFileS(int shipNum);

   List<BoardFile> selectDocumentFileS(int shipNum);

   List<BoardFile> selectFileDateS(int shipNum);

   List<BoardPhotoVO> selectAlbumS(int shipNum);

   BoardFile selectFileInfoS(String boardFileSaveName);

   void insertPhotoFileS(BoardFile boardFile);

   void insertFileS(BoardFile boardFile);

   void deleteFileS(String boardFileSaveName);

}