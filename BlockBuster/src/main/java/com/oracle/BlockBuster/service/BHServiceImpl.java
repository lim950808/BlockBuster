package com.oracle.BlockBuster.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.BlockBuster.dao.BHDao;
import com.oracle.BlockBuster.model.BHDto;

@Service
public class BHServiceImpl implements BHService {
	
	@Autowired BHDao bh;

	@Override
	public List<BHDto> listMem(BHDto bhdto) {
		System.out.println("BHServiceImpl listMem Start...");
		return bh.listMem(bhdto);
	
	}

	@Override
	public int delete(String id) {
		int result = 0;
		System.out.println("BHServiceImpl delete Start...");
		result = bh.delete(id);
		return result;
	}

	@Override
	public String chatName(String id) {
		System.out.println("BHServiceImpl의 chatName Start...");
		String returnValue = bh.chatName(id);
		return returnValue;
	}
	
	

}