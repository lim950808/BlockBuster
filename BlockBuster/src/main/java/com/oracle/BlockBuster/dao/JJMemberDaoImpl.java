package com.oracle.BlockBuster.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.oracle.BlockBuster.model.JJMember;
import com.oracle.BlockBuster.model.Member;

@Repository
public class JJMemberDaoImpl implements JJMemberDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public String login(JJMember member) {
		System.out.println("MemberDaoImpl의 login 메서드 시작...");
		String result = "";
		try {
			System.out.println("MemberDaoImpl의 idpwCheck Method실행");
			result = session.selectOne("idpwChk",member);
			if(result.equals("1")){
				result = session.selectOne("delChk",member);
				if(result.equals("1")) {
					result="2";
					return result;
				}
				result="1";
				return result;
			}
		}catch(Exception e) {
			System.out.println("MemberDaoImpl의 login메서드의 SQL 오류....");
		}
		return result;
	}

	//회원가입 method 시작
	//IdCheck 메소드
	@Override
	public String idCheck(JJMember member) {
		String result = "";
		System.out.println("memberDaoImpl -> idCheck 시작....");
		try {
			result = session.selectOne("memberidCheck", member); 
			// 1일 땐 아이디 사용 불가  0일떈 사용 가능
		}catch(Exception e) {
			System.out.println("memberDaoImpl의 idCheck SQL 오류");
		}
		return result;
	}
	@Override
	public void registration(JJMember member) {
		System.out.println("memberDaoImpl -> 회원가입 시작....");
		session.insert("registration", member);
	}

	@Override
	public String nicknameCheck(JJMember member) {
		System.out.println("memberDaoImpl -> nicknameCheck시작");
		// 1일 땐 닉네임 사용 불가  0일떈 사용 가능
		String result = session.selectOne("membernicknameCheck", member);
		return result;
	}

	@Override
	public void regSubmit(JJMember member) {
		System.out.println("memberDaoImpl -> regSubmit 시작....");
		session.insert("regSubmit", member);
		
	}


}
