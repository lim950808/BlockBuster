package com.oracle.BlockBuster.dao;

import com.oracle.BlockBuster.model.JJMember;

public interface JJMemberDao {

	String login(JJMember member);

	String idCheck(JJMember member);
	void registration(JJMember member);
	String nicknameCheck(JJMember member);


}
