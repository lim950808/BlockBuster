package com.oracle.BlockBuster.dao;

import java.util.List;

import com.oracle.BlockBuster.model.Cart;
import com.oracle.BlockBuster.model.CartList;
import com.oracle.BlockBuster.model.Payment;
import com.oracle.BlockBuster.model.Product;

public interface JEDao {

	int total();

////////////////////////////////////
//관리자 상품 관리
////////////////////////////////////
	
	List<Product> listProduct(Product product);

	Product detail(int pno);

	//관리자 - 상품 수정
	int update(Product product);

	//관리자 - 상품 등록
	int insert(Product product);

	//관리자 - 상품 삭제
	int delete(int pno);
	
	
/////////////////////////////////////////
//상품 페이지
/////////////////////////////////////////

	public List<Product> list(int genre, int category) throws Exception;
	
	public List<Product> list(int genre) throws Exception;
	
	Product productDetail(int pno);

	//카트에 담기
	void addCart(Cart cart);
	//카트 리스트
	List<Cart> cartList(String id);

//	int cartUpdate(Cart cart);

//	int cartDelete(int id);
	
	//카트 삭제
	void deleteCart(Cart cart);
	
	// 카트 비우기
	public void cartAllDelete(String id);

	//구매내역
	List<Payment> orderCartList(String member);

	Payment orderResultView(String orderNo);

	List<Payment> orderListAll(String member);

	void orderInfo(Payment payment);

	List<Product> categoryList(int c);

	List<Product> genreList(int g);

}
