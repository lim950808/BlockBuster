package com.oracle.BlockBuster.service;

import java.util.List;

import com.oracle.BlockBuster.model.BHDto;

public interface BHService {
	List<BHDto>		listMem(BHDto bhdto);
	int				delete(String id);
	String          chatName(String id);
	
}
