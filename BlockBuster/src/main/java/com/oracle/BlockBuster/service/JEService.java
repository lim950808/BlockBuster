package com.oracle.BlockBuster.service;

import java.util.List;

import com.oracle.BlockBuster.model.Cart;
import com.oracle.BlockBuster.model.CartList;
import com.oracle.BlockBuster.model.Payment;
import com.oracle.BlockBuster.model.Product;

public interface JEService {

	int total();

	List<Product> listProduct(Product product);

	Product detail(int pno);

	int update(Product product);

	//List<Product> listManager();

	int insert(Product product);

	int delete(int pno);

	public List<Product> list(int genre, int level) throws Exception;
	
	Product productDetail(int pno);

	/*
	 * //카트 담기 void addCart(CartList cart) throws Exception;
	 * 
	 * //카트 리스트 List<CartList> cartList(String id) throws Exception;
	 * 
	 * //카트 삭제 void deleteCart(Cart cart) throws Exception;
	 */

	//카트 담기
	void addCart(Cart cart);

	//카트 리스트
	List<Cart> cartList(String member);

//	//카트 수정
//	int cartUpdate(Cart cart);

	//카트 삭제
	void deleteCart(Cart cart);
	//int cartDelete(int id);

	List<Payment> orderCartList(int id);

	List<Payment> orderResultView(String orderNo);

	List<Payment> orderListAll(int id);

	void orderInfo(Payment payment);



}
