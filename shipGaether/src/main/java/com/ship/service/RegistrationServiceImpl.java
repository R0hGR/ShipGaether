package com.ship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ship.domain.Registration;
import com.ship.mapper.RegistrationMapper;

@Service
public class RegistrationServiceImpl implements RegistrationService {
	@Autowired
	private RegistrationMapper registrationMapper;

	@Override
	public List<Registration> selectAllS() {
		return registrationMapper.selectAll();
	}
}
