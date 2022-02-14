package com.oracle.BlockBuster.dao;

import java.util.List;
import com.oracle.BlockBuster.model.BHDto;

public interface BHDao {
	List<BHDto>	       listMem(BHDto bhdto);
	int                delete(String id);
	String             chatName(String id);
}
