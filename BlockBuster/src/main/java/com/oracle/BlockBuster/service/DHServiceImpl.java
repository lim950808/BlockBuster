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
		System.out.println("JKServiceImpl memberDetail Start...");
		Member member = null;
		member = dd.memberDetail(id);
		return member;
	}

	@Override
	public int memberUpdate(Member member) {
		System.out.println("JKServiceImpl memberUpdate Start...");
		int kkk = 0;
		kkk = dd.memberUpdate(member);
		return kkk;
	}

	@Override
	public int memberDelete(String id) {
		int result = 0;
		System.out.println("JKServiceImpl memberDelete Start...");
		result = dd.memberDelete(id);
		return result;
	}
}
