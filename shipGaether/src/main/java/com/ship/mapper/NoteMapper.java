package com.ship.mapper;

import java.util.List;

import com.ship.domain.Note;
import com.ship.util.NoteSearchVO;
import com.ship.util.PagingVO;

public interface NoteMapper {
   List<Note> selectAll();

   List<Note> selectMyNote(int usrNum);

   List<Note> selectMyReadNote(int usrNum);

   List<Note> selectMyUnReadNote(int usrNum);

   List<Note> selectSendNote(int usrNum);

   // paging
   List<Note> selectSendNotePaging(PagingVO PVO);

   // autoComplete
   List<Note> selectAutoNickname(NoteSearchVO nsvo);

   // paging count sendNote
   int selectCountSendNoteBySearch(NoteSearchVO nsvo);

   List<Note> selectSendNoteBySearch(PagingVO pVO);

   // paging count receiveNote
   int selectCountMyNote(NoteSearchVO nsvo);

   int selectCountMyUnReadNote(NoteSearchVO nsvo);

   int selectCountMyReadNote(NoteSearchVO nsvo);

   int getReceiveNoteCount(NoteSearchVO nsvo);

   // paging receive Note
   List<Note> selectPagingMyNote(PagingVO pVO);

   List<Note> selectPagingMyUnReadNote(PagingVO pVO);

   List<Note> selectPagingMyReadNote(PagingVO pVO);

   int selectCountReceiveNoteBySearch(NoteSearchVO nsvo);

   List<Note> selectReceiveNoteBySearch(PagingVO pVO);

   void insertNote(Note note);

   void updateNote(int noteNum);

   void deleteNote(int noteNum);

   // paging
   int selectCountMySendNote(int usrNum);

}