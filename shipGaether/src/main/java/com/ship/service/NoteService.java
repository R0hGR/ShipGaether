package com.ship.service;

import java.util.List;

import com.ship.domain.Note;
import com.ship.util.NoteSearchVO;
import com.ship.util.PagingVO;

public interface NoteService {
   List<Note> selectAllS();
   List<Note> selectMyNoteS(int usrNum);
   List<Note> selectMyReadNoteS(int usrNum);
   List<Note> selectMyUnReadNoteS(int usrNum);
   List<Note> selectSendNoteS(int usrNum);
   //paging
   List<Note> selectSendNotePagingS(PagingVO PVO);
   //autoComplete
   List<Note> selectAutoNicknameS(NoteSearchVO nsvo);
   //pagingCount sendNote
   int selectCountSendNoteBySearchS(NoteSearchVO nsvo);
   List<Note> selectSendNoteBySearchS(PagingVO pVO);
   
   //paging count receiveNote
   int selectCountMyNoteS(NoteSearchVO nsvo);
   int selectCountMyUnReadNoteS(NoteSearchVO nsvo);
   int selectCountMyReadNoteS(NoteSearchVO nsvo);
   
   int getReceiveNoteCountS(NoteSearchVO nsvo);
   
   //paging receive Note
   List<Note> selectPagingMyNoteS(PagingVO pVO);
   List<Note> selectPagingMyUnReadNoteS(PagingVO pVO);
   List<Note> selectPagingMyReadNoteS(PagingVO pVO);
   
   
   int selectCountReceiveNoteBySearchS(NoteSearchVO nsvo);
   
   List<Note> selectReceiveNoteBySearchS(PagingVO pVO);
   
   
   void insertNoteS(Note note);
   void updateNoteS(int noteNum);
   void deleteNoteS(int noteNum);
   
   //paging
   int selectCountMySendNoteS(int usrNum);

}