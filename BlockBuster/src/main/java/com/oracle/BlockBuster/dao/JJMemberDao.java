package com.oracle.BlockBuster.dao;

import com.oracle.BlockBuster.model.JJMember;
import com.oracle.BlockBuster.model.Member;

public interface JJMemberDao {

	String  login(JJMember member);
	String  idCheck(JJMember member);
	void    registration(JJMember member);
	String  nicknameCheck(JJMember member);
	void    regSubmit(JJMember member);

}
