package com.ship.mapper;

import java.util.List;

import com.ship.domain.Notice;

public interface NoticeMapper {
	
	List<Notice> noticeAll();
	void insertNotice(Notice notice);
	void updateNotice(Notice notice);
	void deleteNotice(int noticeNum);
	Notice noticecontent(int noticeNum);
}
