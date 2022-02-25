package com.oracle.BlockBuster.service;

import org.springframework.ui.Model;

import com.oracle.BlockBuster.model.JJMember;

public interface JJMemberService {

	String idpwCheck(JJMember member);
	String idCheck(JJMember member);
	void registration(JJMember member);
	String nicknameCheck(JJMember member);
	void regSubmit(JJMember member);
	void findPw(JJMember member);
	
}
