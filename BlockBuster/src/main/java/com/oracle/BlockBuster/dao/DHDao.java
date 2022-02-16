package com.oracle.BlockBuster.dao;

import com.oracle.BlockBuster.model.Member;

public interface DHDao {

	Member memberDetail(String id);
	
	int memberUpdate(Member member);
	
	int memberDelete(String id);
	
	int nickNameChk(String nickname);
	
	int emailChk(String email);
}
