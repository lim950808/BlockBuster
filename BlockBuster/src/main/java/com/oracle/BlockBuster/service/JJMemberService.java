package com.oracle.BlockBuster.service;

import com.oracle.BlockBuster.model.JJMember;

public interface JJMemberService {

	String idpwCheck(JJMember member);
	String idCheck(JJMember member);
	void registration(JJMember member);
	String nicknameCheck(JJMember member);

	
}
