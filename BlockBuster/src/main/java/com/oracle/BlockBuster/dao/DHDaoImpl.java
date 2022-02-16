package com.oracle.BlockBuster.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;

import com.oracle.BlockBuster.model.Member;

@Repository
public class DHDaoImpl implements DHDao {

	@Autowired
	private SqlSession session;

	@Override
	public Member memberDetail(String id) {
		System.out.println("DHDaoImpl memberDetail Start...");
		Member member = new Member();
		try {
			member = session.selectOne("memberSelOne", id);
			System.out.println("DHDaoImpl memberDetail getId->"+member.getId());
		} catch (Exception e) {
			System.out.println("DHDaoImpl memberDetail Exception->"+e.getMessage());
		}
		return member;
	}
	

	@Override
	public int memberUpdate(Member member) {
		System.out.println("DHDaoImpl memberUpdate Start...");
		int kkk = 0;
		try {
			kkk = session.update("memberUpdate",member);
			System.out.println("DHDaoImpl memberUpdate kkk->"+kkk);
		} catch (Exception e) {
			System.out.println("DHDaoImpl memberUpdate Exception->"+e.getMessage());
		}
		return kkk;
	}
	

	@Override
	public int memberDelete(String id) {
		System.out.println("DHDaoImpl memberDelete Start...");
		int result = 0;
		try {
			result = session.update("memberDelete", id);
			System.out.println("DHDaoImpl memberDelete result->"+result);
		} catch (Exception e) {
			System.out.println("DHDaoImpl memberDelete Exception"+e.getMessage());
		}
		return result;
	}
	

	@Override
	public int nickNameChk(String nickname) {
		System.out.println("DHDaoImpl nickNameChk Start...");
		int result = 0;
		try {
			System.out.println("DHDaoImpl nickNameChk nickname->"+nickname);
			result = session.selectOne("nickNameChk", nickname);
			System.out.println("DHDaoImpl nickNameChk result->"+result);
		} catch (Exception e) {
			System.out.println("DHDaoImpl nickNameChk Exception"+e.getMessage());
		}
		return result;
	}
	

	@Override
	public int emailChk(String email) {
		System.out.println("DHDaoImpl emailChk Start...");
		int result = 0;
		try {
			result = session.selectOne("emailChk", email);
			System.out.println("DHDaoImpl emailChk result->"+result);
		} catch (Exception e) {
			System.out.println("DHDaoImpl emailChk Exception"+e.getMessage());
		}
		return result;
	}

	
}
