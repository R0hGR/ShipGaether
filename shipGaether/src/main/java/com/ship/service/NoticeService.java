package com.ship.service;


import java.util.List;

import com.ship.domain.Notice;

public interface NoticeService {
	List<Notice> noticeAllS();
	void insertNoticeS(Notice notice);
	void updateNoticeS(Notice notice);
	void deleteNoticeS(int noticeNum);
	Notice noticecontentS(int noticeNum);
}
