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
		System.out.println("JKDaoImpl memberDetail start...");
		Member member = new Member();
		try {
			member = session.selectOne("memberSelOne", id);
			System.out.println("JKDaoImpl memberDetail getId->"+member.getId());
		} catch (Exception e) {
			System.out.println("JKDaoImpl memberDetail Exception->"+e.getMessage());
		}
		return member;
	}

	@Override
	public int memberUpdate(Member member) {
		System.out.println("JKDaoImpl memberUpdate start...");
		int kkk = 0;
		try {
			kkk = session.update("memberUpdate",member);
		} catch (Exception e) {
			System.out.println("JKDaoImpl memberUpdate Exception->"+e.getMessage());
		}
		return kkk;
	}

	@Override
	public int memberDelete(String id) {
		System.out.println("JKDaoImpl memberDelete start...");
		int result = 0;
		try {
			result = session.update("memberDelete", id);
			System.out.println("JKDaoImpl memberDelete result->"+result);
		} catch (Exception e) {
			System.out.println("JKDaoImpl memberDelete Exception"+e.getMessage());
		}
		return result;
	}
	
}
