package com.oracle.BlockBuster.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.BlockBuster.dao.JEDao;
import com.oracle.BlockBuster.model.Cart;
import com.oracle.BlockBuster.model.CartList;
import com.oracle.BlockBuster.model.OrderList;
import com.oracle.BlockBuster.model.Payment;
import com.oracle.BlockBuster.model.PaymentDetails;
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

////////////////////////////////////
//관리자 상품 관리
////////////////////////////////////
	
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

	//관리자 - 상품 수정
	@Override
	public int update(Product product) {
		int uptCnt = 0;
		uptCnt = jd.update(product);
		return uptCnt;
	}
	
	@Override
	public String genNum(String genreTemp) {
		return  jd.genNum(genreTemp);
	}

	//관리자 - 상품 등록
	@Override
	public int insert(Product product) {
		int result = 0;
		System.out.println("JEServiceImpl insert Start...");
		result = jd.insert(product);
		return result;
	}

	//관리자 - 상품 삭제
	@Override
	public int delete(int pno) {
		int result = 0;
		result = jd.delete(pno);
		return result;
	}
	

/////////////////////////////////////////
//상품 페이지
/////////////////////////////////////////
	
	//카테고리별 영상리스트
	@Override
	public List<Product> categoryList(int c) {
		List<Product> list = jd.categoryList(c);
		return list;
	}
	
	//장르별 영상리스트
	@Override
	public List<Product> genreList(int g) {
		List<Product> list = jd.genreList(g);
		return list;
	}
	
	//상품 상세 페이지
	@Override
	public Product productDetail(int pno) {
		Product product = null;
		product = jd.productDetail(pno);
		return product;
	}


/////////////////////////////////////////
//	장바구니
/////////////////////////////////////////	
	
	//카트담기 중복체크
	@Override
	public int checkRepetition(Cart cart) {
		int checkNum = jd.checkRepetition(cart);
		return checkNum;
	}
	
	//카트에 담기
	@Override
	public void addCart(Cart cart) {
		jd.addCart(cart);
	}

	//카트 리스트
	@Override
	public List<Cart> cartList(String id) {
		return jd.cartList(id);
	}
	
	//카트 삭제
	@Override
	public void deleteCart(Cart cart) {
		jd.deleteCart(cart);
	}
	
	
/////////////////////////////////////////
//	결제
/////////////////////////////////////////	
	
	//주문 정보
	@Override
	public void orderInfo(Payment payment) {
		jd.orderInfo(payment);
	}
	
	//주문 상세 정보
	@Override
	public void orderInfo_Details(PaymentDetails paymentDetails) {
		jd.orderInfo_Details(paymentDetails);
	}

	//결제 후 카트 비우기
	@Override
	public void cartAllDelete(String id) {
		jd.cartAllDelete(id);
	}
	
	//주문 목록
	@Override
	public List<Payment> orderList(Payment payment) {
		return jd.orderList(payment);
	}

	//주문 상세 목록
	@Override
	public List<OrderList> orderView(Payment payment) {
		return jd.orderView(payment);
	}	

}