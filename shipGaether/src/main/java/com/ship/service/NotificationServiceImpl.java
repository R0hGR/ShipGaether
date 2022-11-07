package com.ship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ship.domain.Notification;
import com.ship.mapper.NotificationMapper;

@Service
public class NotificationServiceImpl implements NotificationService {
	@Autowired
	private NotificationMapper notificationMapper;

	@Override
	public List<Notification> selectAllS() {
		return notificationMapper.selectAll();
	}

}
