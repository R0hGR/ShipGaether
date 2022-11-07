package com.ship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ship.domain.Note;
import com.ship.mapper.NoteMapper;
import com.ship.util.NoteSearchVO;
import com.ship.util.PagingVO;

@Service
public class NoteServiceImpl implements NoteService {
   @Autowired
   private NoteMapper noteMapper;

   @Override
   public List<Note> selectAllS() {
      return noteMapper.selectAll();
   }
   @Override
   public List<Note> selectMyNoteS(int usrNum){
      return noteMapper.selectMyNote(usrNum);
   }
   @Override
   public List<Note> selectMyReadNoteS(int usrNum){
      return noteMapper.selectMyReadNote(usrNum);
   }
   @Override
   public List<Note> selectMyUnReadNoteS(int usrNum){
      return noteMapper.selectMyUnReadNote(usrNum);
   }
   @Override
   public List<Note> selectSendNoteS(int usrNum){
      return noteMapper.selectSendNote(usrNum);
   }
   @Override
   //paging
   public List<Note> selectSendNotePagingS(PagingVO PVO){
      return noteMapper.selectSendNotePaging(PVO);
   }
   //autoComplete
   @Override
   public List<Note> selectAutoNicknameS(NoteSearchVO nsvo){
      return noteMapper.selectAutoNickname(nsvo);
   }
   //pagingCount
   @Override
   public int selectCountSendNoteBySearchS(NoteSearchVO nsvo){
      return noteMapper.selectCountSendNoteBySearch(nsvo);
   }
   //search + paging
   @Override
   public List<Note> selectSendNoteBySearchS(PagingVO pVO){
      return noteMapper.selectSendNoteBySearch(pVO);
   }
   
   //paging count receiveNote
   @Override
   public int selectCountMyNoteS(NoteSearchVO nsvo) {
      return noteMapper.selectCountMyNote(nsvo);
   }
   @Override
   public int selectCountMyUnReadNoteS(NoteSearchVO nsvo) {
      return noteMapper.selectCountMyUnReadNote(nsvo);
   }
   @Override
   public int selectCountMyReadNoteS(NoteSearchVO nsvo) {
      return noteMapper.selectCountMyReadNote(nsvo);
   }
   
   @Override
   public int getReceiveNoteCountS(NoteSearchVO nsvo) {
      return noteMapper.getReceiveNoteCount(nsvo);
   }
   
   //paging receive Note
   @Override
   public List<Note> selectPagingMyNoteS(PagingVO pVO){
      return noteMapper.selectPagingMyNote(pVO);
   }
   @Override
   public List<Note> selectPagingMyUnReadNoteS(PagingVO pVO){
      return noteMapper.selectPagingMyUnReadNote(pVO);
   }
   @Override
   public List<Note> selectPagingMyReadNoteS(PagingVO pVO){
      return noteMapper.selectPagingMyReadNote(pVO);
   }
   
   @Override
   public int selectCountReceiveNoteBySearchS(NoteSearchVO nsvo) {
      return noteMapper.selectCountReceiveNoteBySearch(nsvo);
   }
   @Override
   public List<Note> selectReceiveNoteBySearchS(PagingVO pVO){
      return noteMapper.selectReceiveNoteBySearch(pVO);
      
   }

   
   @Override
   public void insertNoteS(Note note) {
      noteMapper.insertNote(note);
   }
   @Override
   public void updateNoteS(int noteNum) {
      noteMapper.updateNote(noteNum);      
   }
   @Override
   public void deleteNoteS(int noteNum) {
      noteMapper.deleteNote(noteNum);
   }
   
   //paging
   @Override
   public int selectCountMySendNoteS(int usrNum) {
      return noteMapper.selectCountMySendNote(usrNum);
   }

}