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

//	@Override
//	public List<Product> listManager() {
//		List<Product> productList = null;
//		try {
//			productList = session.selectList("JESelectManager");
//		}catch (Exception e) {
//			
//		}
//		return productList;
//	}

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
	public void addCart(Cart cart) {
		System.out.println("JEDaoImpl addCart start..");
		try {
			session.insert("addCart", cart);

		} catch (Exception e) {
			System.out.println("JEDaoImpl addCart e.getMessage())->"+e.getMessage());
		}
	}

//	@Override
//	public List<Cart> cartList(String member) {
//		 List<Cart> listCartRtn = null;
//		System.out.println("JEDaoImpl cartList start..");
//		try {
//			listCartRtn = session.selectList("cartList", member);
//			System.out.println("JEDaoImpl cartList listCartRtn.size()--<"+listCartRtn.size());
//		} catch (Exception e) {
//			System.out.println("JEDaoImpl cartList e.getMessage())->"+e.getMessage());
//		}
//		return listCartRtn;
//	}
	
	@Override
	public List<Cart> cartList(String member) {
			return session.selectList("cartList", member);
	}


//	@Override
//	public int cartUpdate(Cart cart) {
//		return session.update("cartUpdate", cart);
//	}

//	@Override
//	public int cartDelete(int id) {
//		return session.delete("cartDelete", id);
//	}
	
	@Override
	public void deleteCart(Cart cart) {
		session.delete("deleteCart", cart);
	}

	@Override
	public List<Payment> orderCartList(String member) {
		return session.selectList("orderCartList", member);
	}

	@Override
	public Payment orderResultView(String orderNo) {
		System.out.println("Dao orderResultView orderNo.getId() -> " + orderNo);
		
		System.out.println("JEDaoImpl orderResultView start..");
		try {
			int insertCount = session.insert("orderResultView", orderNo);
			System.out.println("JEDaoImpl orderInfo insertCount-->"+insertCount);
			
		} catch (Exception e) {
			System.out.println("JEDaoImpl orderResultView e.getMessage())->"+e.getMessage());
		}
		return session.selectOne("orderResultView", orderNo);
	}

	@Override
	public List<Payment> orderListAll(String member) {
		return session.selectList("orderListAll", member);
	}

	@Override
	public void orderInfo(Payment payment) {
		System.out.println("Dao orderInfo payment.getId() -> " + payment.getId());

		session.insert("orderInfo", payment);
		
		System.out.println("JEDaoImpl cartList start..");
		try {
			int insertCount = session.insert("orderInfo", payment);
			System.out.println("JEDaoImpl orderInfo insertCount-->"+insertCount);
		} catch (Exception e) {
			System.out.println("JEDaoImpl orderInfo e.getMessage())->"+e.getMessage());
		}
	}

	@Override
	public void cartAllDelete(String member) {
		session.delete("cartAllDelete", member);
	}

	@Override
	   public List<Product> categoryList(int c) {
	      List<Product> list = session.selectList("HTcategoryList", c);
	      return list;
	   }

	


	 
}