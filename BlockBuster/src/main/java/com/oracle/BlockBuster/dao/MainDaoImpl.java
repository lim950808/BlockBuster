package com.oracle.BlockBuster.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDaoImpl implements MainDao{
	
	@Autowired
	private  SqlSession  session;
	

	@Override
	public String nameGet(String checkSessionId) {
		
		String name = null;
		
		try {
			name = session.selectOne("Main_nameGet", checkSessionId);
		}catch(Exception e) {
			System.out.println("[*-*-4|예외] MainDaoImpl nameGet Exception 발생 : "+e.getMessage());
		}
		System.out.println("이름 뭐야? "+name);
		return name;
	}

}
