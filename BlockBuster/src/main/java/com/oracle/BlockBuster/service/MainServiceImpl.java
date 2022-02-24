package com.oracle.BlockBuster.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.BlockBuster.dao.MainDao;


@Service
public class MainServiceImpl implements MainService {

	@Autowired
	MainDao mainDao;
	
	@Override
	public String nameGet(String checkSessionId) {
		String name = mainDao.nameGet(checkSessionId);
		return name;
	}

}
