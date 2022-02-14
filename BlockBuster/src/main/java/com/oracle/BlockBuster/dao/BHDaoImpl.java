package com.oracle.BlockBuster.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.BlockBuster.model.BHDto;
@Repository
public class BHDaoImpl implements BHDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<BHDto> listMem(BHDto bhdto) {
		System.out.println("BHDaoImpl listMem Start...");
		return session.selectList("viewallMember", bhdto);
	}

	@Override
	public int delete(String id) {
		System.out.println("BHDaoImpl delete id->" + id);
		int result = 0;
		try {
			result = session.update("memberrowDelete", id);		
			System.out.println("BHDaoImpl delete result.."+result);			
		} catch (Exception e) {
			System.out.println("BHDaoImpl delete Exception->"+e.getMessage());
		}		
		return result;
	}

	@Override
	public String chatName(String id) {
		String rtnChatName = "";
		System.out.println("BHDaoImpl chatName Start..");
		System.out.println("BHDaoImpl chatName id->" + id);
		try {
			rtnChatName = session.selectOne("chatName", id);
			System.out.println("BHDaoImpl chatName rtnChatName->" + rtnChatName);
		} catch (Exception e) {
			System.out.println("BHDaoImpl chatName Exception->" + e.getMessage());
		}
		return rtnChatName ;
	}


	
}