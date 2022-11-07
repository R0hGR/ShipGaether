package com.ship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ship.domain.Report;
import com.ship.mapper.ReportMapper;

@Service
public class ReportServiceImpl implements ReportService {
	@Autowired
	private ReportMapper reportMapper;

	@Override
	public List<Report> selectAllS() {
		return reportMapper.selectAll();
	}

}
