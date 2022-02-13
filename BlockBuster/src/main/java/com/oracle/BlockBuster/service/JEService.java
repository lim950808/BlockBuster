package com.oracle.BlockBuster.service;

import java.util.List;

import com.oracle.BlockBuster.model.Cart;
import com.oracle.BlockBuster.model.CartList;
import com.oracle.BlockBuster.model.Payment;
import com.oracle.BlockBuster.model.Product;

public interface JEService {

	int total();

////////////////////////////////////
// 관리자 상품 관리
////////////////////////////////////
	
	//관리자 - 영상 전체
	List<Product> listProduct(Product product);

	//관리자 - 상품 상세 페이지
	Product detail(int pno);

	//관리자 - 상품 수정
	int update(Product product);

	//관리자 - 상품 등록
	int insert(Product product);

	//관리자 - 상품 삭제
	int delete(int pno);
	
	
/////////////////////////////////////////
// 상품 페이지
/////////////////////////////////////////

	//영상 레벨별 나누기
	public List<Product> list(int genre, int level) throws Exception;
	
	//카테고리 별 영상
	List<Product> categoryList(int c);

	//장르 별 영상
	List<Product> genreList(int g);
	
	//상품 상세 페이지
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
	List<Cart> cartList(String id);

//	//카트 수정
//	int cartUpdate(Cart cart);

	//카트 삭제
	void deleteCart(Cart cart);
	//int cartDelete(int id);
	
	void orderInfo(Payment payment);
	
	// 카트 비우기
	public void cartAllDelete(String id);

	//구매내역
	List<Payment> orderCartList(String member);

	Payment orderResultView(String orderNo);

	List<Payment> orderListAll(String member);





}
