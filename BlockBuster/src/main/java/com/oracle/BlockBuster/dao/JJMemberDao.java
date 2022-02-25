package com.oracle.BlockBuster.dao;

import org.springframework.ui.Model;

import com.oracle.BlockBuster.model.JJMember;

public interface JJMemberDao {

	String login(JJMember member);
	String idCheck(JJMember member);
	void registration(JJMember member);
	String nicknameCheck(JJMember member);
	void regSubmit(JJMember member);
	void findPw(JJMember member);

}
