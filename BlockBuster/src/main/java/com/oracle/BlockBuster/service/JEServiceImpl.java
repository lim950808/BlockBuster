package com.oracle.BlockBuster.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.BlockBuster.dao.JEDao;
import com.oracle.BlockBuster.model.Cart;
import com.oracle.BlockBuster.model.CartList;
import com.oracle.BlockBuster.model.Payment;
import com.oracle.BlockBuster.model.Product;

@Service
public class JEServiceImpl implements JEService {
	
	@Autowired
	private JEDao jd;

	@Override
	public int total() {
		int totCnt = jd.total();
		return totCnt;
	}

	@Override
	public List<Product> listProduct(Product product) {
		List<Product> productList = null;
		productList = jd.listProduct(product);
		return productList;
	}
	
	@Override
	public Product detail(int pno) {
		Product product = null;
		product = jd.detail(pno);
		return product;
	}

	@Override
	public int update(Product product) {
		int uptCnt = 0;
		uptCnt = jd.update(product);
		return uptCnt;
	}

//	@Override
//	public List<Product> listManager() {
//		List<Product> productList = null;
//		productList = jd.listManager();
//		return productList;
//	}

	@Override
	public int insert(Product product) {
		int result = 0;
		result = jd.insert(product);
		return result;
	}

	@Override
	public int delete(int pno) {
		int result = 0;
		result = jd.delete(pno);
		return result;
	}

	@Override
	public List<Product> list(int genre, int level) throws Exception {
		int category = 0;
		if(level == 1) { //1차 분류
			category = genre;
			return jd.list(genre, category);
		}else { //2차 분류
			return jd.list(genre);
		}
	}
	
	@Override
	public Product productDetail(int pno) {
		Product product = null;
		product = jd.productDetail(pno);
		return product;
	}

	/*
	 * //카트 담기
	 * 
	 * @Override public void addCart(CartList cart) throws Exception {
	 * jd.addCart(cart); }
	 * 
	 * //카트 리스트
	 * 
	 * @Override public List<CartList> cartList(String id) throws Exception { return
	 * jd.cartList(id); }
	 * 
	 * //카트 삭제
	 * 
	 * @Override public void deleteCart(Cart cart) throws Exception {
	 * jd.deleteCart(cart); }
	 */

	@Override
	public void addCart(Cart cart) {
		jd.addCart(cart);
	}

	@Override
	public List<Cart> cartList(String member) {
		return jd.cartList(member);
	}

//	@Override
//	public int cartUpdate(Cart cart) {
//		return jd.cartUpdate(cart);
//	}

//	@Override
//	public int cartDelete(int id) {
//		return jd.cartDelete(id);
//	}
	
	@Override
	public void deleteCart(Cart cart) {
		jd.deleteCart(cart);
	}

	@Override
	public List<Payment> orderCartList(int id) {
		List<Payment> orderList = jd.orderCartList(id);
		return orderList;
	}

	@Override
	public List<Payment> orderResultView(String orderNo) {
		List<Payment> orderList = jd.orderResultView(orderNo);
		return orderList;
	}

	@Override
	public List<Payment> orderListAll(int id) {
		List<Payment> orderList = jd.orderListAll(id);
		return orderList;
	}

	@Override
	public void orderInfo(Payment payment) {
		jd.orderInfo(payment);
		
	}


}
