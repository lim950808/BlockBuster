package com.oracle.BlockBuster.service;

import com.oracle.BlockBuster.model.Member;

public interface DHService {

	Member memberDetail(String id);

	int memberUpdate(Member member);

	int memberDelete(String id);

	int nickNameChk(String nickname);

	int emailChk(String email);



}
