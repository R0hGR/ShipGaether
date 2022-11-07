package com.ship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ship.domain.Notice;
import com.ship.domain.Usr;
import com.ship.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeMapper noticeMapper;
	
	
	
	@Override
	public List<Notice>noticeAllS(){
		return noticeMapper.noticeAll(); 
	}
	@Override
	public void insertNoticeS(Notice notice) {
		noticeMapper.insertNotice(notice);
	}
	
	@Override
	public void updateNoticeS(Notice notice) {
		noticeMapper.updateNotice(notice);
	}
	@Override
	public Notice noticecontentS(int noticeNum){
		return noticeMapper.noticecontent(noticeNum);
	}
	
	@Override
	public void deleteNoticeS(int noticeNum){
		noticeMapper.deleteNotice(noticeNum);
	}
	
}
