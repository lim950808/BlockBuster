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

//	@Override
//	public int cartUpdate(Cart cart) {
//		return jd.cartUpdate(cart);
//	}

//	@Override
//	public int cartDelete(int id) {
//		return jd.cartDelete(id);
//	}
	
	//카트 삭제
	@Override
	public void deleteCart(Cart cart) {
		jd.deleteCart(cart);
	}

//	@Override
//	public List<Payment> orderCartList(String member) {
//		List<Payment> orderList = jd.orderCartList(member);
//		return orderList;
//	}
//
//	@Override
//	public Payment orderResultView(String orderNo) {
//		Payment orderList = jd.orderResultView(orderNo);
//		System.out.println("Service orderInfo orderNo -> " + orderNo);
//		return orderList;
//	}
//
//	@Override
//	public List<Payment> orderListAll(String member) {
//		
//		List<Payment> orderList = jd.orderListAll(member);
//		return orderList;
//	}
	
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

	//카트 중복담기 금지
	@Override
	public int orderCheck(Product orderProduct) {
		int orderCheck = jd.orderCheck(orderProduct);
		return orderCheck;
	}

	@Override
	public int checkRepetition(Cart cart) {
		int checkNum = jd.checkRepetition(cart);
		return checkNum;
	}


	

	

}
