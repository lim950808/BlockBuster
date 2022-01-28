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
	public List<Product> listProduct(Product product) {
		List<Product> productList = null;
		try {
			productList = session.selectList("JEProductListAll", product);
		}catch (Exception e) {
			
		}
		return productList;
	}

	@Override
	public Product detail(int pno) {
		Product product = new Product();
		try {
			//						  mapper ID	, Parameter
			product = session.selectOne("JEProductSelOne", pno);
		}catch (Exception e) {
			
		}
		return product;
	}

	@Override
	public int update(Product product) {
		int uptCnt = 0;
		try {
			uptCnt = session.update("JEproductUpdate", product);
		}catch (Exception e) {
			
		}
		return uptCnt;
	}

	@Override
	public List<Product> listManager() {
		List<Product> productList = null;
		try {
			productList = session.selectList("JESelectManager");
		}catch (Exception e) {
			
		}
		return productList;
	}

	@Override
	public int insert(Product product) {
		int result = 0;
		try {
			result = session.insert("insertProduct", product);
		}catch (Exception e) {
			
		}
		return result;
	}

	@Override
	public int delete(int pno) {
		int result = 0;
		try {
			result = session.delete("deleteProduct", pno);
		}catch (Exception e) {
			
		}
		return result;
	}
	 
}