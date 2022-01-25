package com.oracle.BlockBuster.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JEProductDaoImpl implements JEProductDao {

	@Autowired
	private SqlSession session;
}
