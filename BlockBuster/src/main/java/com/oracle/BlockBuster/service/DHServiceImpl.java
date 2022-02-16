package com.oracle.BlockBuster.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.oracle.BlockBuster.dao.DHDao;
import com.oracle.BlockBuster.model.Member;

@Service
public class DHServiceImpl implements DHService {
	
	@Autowired
	private DHDao dd;

	@Override
	public Member memberDetail(String id) {
		System.out.println("DHServiceImpl memberDetail Start...");
		Member member = null;
		member = dd.memberDetail(id);
		return member;
	}
	

	@Override
	public int memberUpdate(Member member) {
		System.out.println("DHServiceImpl memberUpdate Start...");
		int kkk = 0;
		kkk = dd.memberUpdate(member);
		return kkk;
	}
	

	@Override
	public int memberDelete(String id) {
		int result = 0;
		System.out.println("DHServiceImpl memberDelete Start...");
		result = dd.memberDelete(id);
		return result;
	}
	

	@Override
	public int nickNameChk(String nickname) {
		int result = 0;
		System.out.println("DHServiceImpl nickNameChk Start...");
		result = dd.nickNameChk(nickname);
		return result;
	}

	
	@Override
	public int emailChk(String email) {
		int result = 0;
		System.out.println("DHService emailChk Start...");
		result = dd.emailChk(email);
		return result;
	}

}
