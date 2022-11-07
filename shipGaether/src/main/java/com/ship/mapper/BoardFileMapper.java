package com.ship.mapper;

import java.util.List;

import com.ship.domain.BoardFile;
import com.ship.util.BoardPhotoVO;

public interface BoardFileMapper {

	List<BoardFile> selectAllFile();
	   List<BoardFile> selectCountFile();
	   List<BoardFile> selectCountAllDocumentFile();
	   List<BoardFile> selectBoardFileSaveName(int boardNum);
	   List<BoardFile> selectRecentlyBoardFile(int shipNum);
	   List<BoardFile> selectDocumentFile(int shipNum);
	   List<BoardFile> selectFileDate(int shipNum);
	   List<BoardPhotoVO> selectAlbum(int shipNum);
	
	BoardFile selectFileInfo(String boardFileSaveName);
	void insertPhotoFile(BoardFile boardFile);
	void deleteFile(String boardFileSaveName);
	void insertFile();
	

}
