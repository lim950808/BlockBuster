package com.oracle.BlockBuster.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.BlockBuster.model.Product;

@Repository
public class JEDaoImpl implements JEDao {

	@Autowired 
	private SqlSession session;

	@Override
	public int total() {
		int tot = 0;
		
		try {
			tot = session.selectOne("JEProductTotal");
		}catch (Exception e) {
			
		}
		return tot;
	}

	@Override
	public List<Product> listEmp(Product product) {
		List<Product> productList = null;
		try {
			productList = session.selectList("JEProductListAll", product);
		}catch (Exception e) {
			
		}
		return productList;
	}
	 
}