package com.oracle.BlockBuster.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.BlockBuster.dao.JJMemberDao;
import com.oracle.BlockBuster.model.JJMember;
import com.oracle.BlockBuster.model.Member;

@Service
public class JJMemberServiceImpl implements JJMemberService {
	
	@Autowired
	private JJMemberDao memberDao;

	@Override
	public String idpwCheck(JJMember member) {
		System.out.println("MemberServiceImpl의 idpwCheck메서드 시작...");
		String result = memberDao.login(member);
		return result;
	}
	
	@Override
	public void registration(JJMember member) {
		System.out.println("registration의 메소드 실행...");
		memberDao.registration(member);
	
		}
		
	@Override
	public String idCheck(JJMember member) {
		System.out.println("idCheck 의 메소드 실행....");
		String result = memberDao.idCheck(member);
		return result;
		}
		

	@Override
	public String nicknameCheck(JJMember member) {
		System.out.println("nicknameCheck의 메소드 실행...");
		String result = memberDao.nicknameCheck(member);
		return result;
	}

	@Override
	public void regSubmit(JJMember member) {
		System.out.println("regSubmit의 메소드 실행...");
		memberDao.regSubmit(member);
		
	}

}
