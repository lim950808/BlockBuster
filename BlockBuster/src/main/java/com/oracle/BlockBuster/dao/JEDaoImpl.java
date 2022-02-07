package com.oracle.BlockBuster.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.BlockBuster.model.Cart;
import com.oracle.BlockBuster.model.CartList;
import com.oracle.BlockBuster.model.Payment;
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
			uptCnt = session.update("JEProductUpdate", product);
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
	
	//1차 분류
	@Override
	public List<Product> list(int genre, int category) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("genre", genre);
		map.put("category", category);
		return session.selectList("products_1", map);
	}
	
	//2차 분류
	@Override
	public List<Product> list(int genre) {
		return session.selectList("products_2", genre);
	}
	
	
	@Override
	public Product productDetail(int pno) {
		Product product = new Product();
		try {
			//						  mapper ID	, Parameter
			product = session.selectOne("JEProductDetail", pno);
		}catch (Exception e) {
			
		}
		return product;
	}

	/*
	 * //카트담기
	 * 
	 * @Override public void addCart(CartList cart) throws Exception {
	 * session.insert("addCart", cart); }
	 * 
	 * //카트 리스트
	 * 
	 * @Override public List<CartList> cartList(String id) throws Exception { return
	 * session.selectList("cartList", id); }
	 * 
	 * //카트 삭제
	 * 
	 * @Override public void deleteCart(Cart cart) throws Exception {
	 * session.delete("deleteCart", cart); }
	 */

	@Override
	public int save(Cart cart) {
		return session.insert("cartAdd", cart);
	}

	@Override
	public List<Cart> findAll(String id) {
		List<Cart> list = null;
		session.selectList("list", id);
		return list;
	}


	@Override
	public int cartUpdate(Cart cart) {
		return session.update("cartUpdate", cart);
	}

	@Override
	public int cartDelete(int id) {
		return session.delete("cartDelete", id);
	}

	@Override
	public List<Payment> orderCartList(int id) {
		return session.selectList("orderCartList", id);
	}

	@Override
	public List<Payment> orderResultView(String orderNo) {
		return session.selectList("orderResultView", orderNo);
	}

	@Override
	public List<Payment> orderListAll(int id) {
		return session.selectList("orderListAll", id);
	}

	


	 
}