package com.oracle.BlockBuster.service;

import com.oracle.BlockBuster.model.JJMember;
import com.oracle.BlockBuster.model.Member;

public interface JJMemberService {

	String  idpwCheck(JJMember member);
	String  idCheck(JJMember member);
	void    registration(JJMember member);
	String  nicknameCheck(JJMember member);
	void    regSubmit(JJMember member);

	
}
