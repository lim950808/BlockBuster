package com.oracle.BlockBuster.dao;

import java.util.List;

import com.oracle.BlockBuster.model.Cart;
import com.oracle.BlockBuster.model.CartList;
import com.oracle.BlockBuster.model.OrderList;
import com.oracle.BlockBuster.model.Payment;
import com.oracle.BlockBuster.model.PaymentDetails;
import com.oracle.BlockBuster.model.Product;

public interface JEDao {

	int total();

////////////////////////////////////
//	관리자 상품 관리
////////////////////////////////////
	
	List<Product> listProduct(Product product);

	Product detail(int pno);

	//관리자 - 상품 수정
	int update(Product product);

	//주문등록 시 gene..
	String genNum(String genreTemp);
	
	//관리자 - 상품 등록
	int insert(Product product);

	//관리자 - 상품 삭제
	int delete(int pno);
	
	
/////////////////////////////////////////
//	상품 페이지
/////////////////////////////////////////
	
	//카테고리별 영상리스트
	List<Product> categoryList(int c);
	
	//장르별 영상리스트
	List<Product> genreList(int g);
	
	//상품상세 페이지
	Product productDetail(int pno);

	
/////////////////////////////////////////
// 장바구니
/////////////////////////////////////////	
	
	//카트담기 중복체크
	int checkRepetition(Cart cart);
	
	//카트에 담기
	void addCart(Cart cart);
	
	//카트 리스트
	List<Cart> cartList(String id);
	
	//카트 삭제
	void deleteCart(Cart cart);
	
	
/////////////////////////////////////////
//	결제
/////////////////////////////////////////	
	
	//주문 정보
	void orderInfo(Payment payment);
	
	//주문 상세 정보
	void orderInfo_Details(PaymentDetails paymentDetails);
	
	// 카트 비우기
	public void cartAllDelete(String id);
	
	//주문 목록
	List<Payment> orderList(Payment payment);
	
	//주문 상세 목록
	List<OrderList> orderView(Payment payment);

}