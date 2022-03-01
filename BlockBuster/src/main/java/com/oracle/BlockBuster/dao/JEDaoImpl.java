package com.oracle.BlockBuster.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.BlockBuster.model.Cart;
import com.oracle.BlockBuster.model.CartList;
import com.oracle.BlockBuster.model.OrderList;
import com.oracle.BlockBuster.model.Payment;
import com.oracle.BlockBuster.model.PaymentDetails;
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

////////////////////////////////////
//	관리자 상품 관리
////////////////////////////////////
	
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
			//						  	mapper ID	, Parameter
			product = session.selectOne("JEProductSelOne", pno);
		}catch (Exception e) {
			
		}
		return product;
	}

	@Override
	public int update(Product product) {
		int editresult = 0;
		try {
			editresult = session.update("JEProductUpdate", product);
		}catch (Exception e) {
			
		}
		return editresult;
	}
	
	@Override
	public String genNum(String genreTemp) {
		return  session.selectOne("genreTemp", genreTemp);
	}

	// 입력한 영상 정보를 실제 DB에 등록하는 부분 
	@Override
	public int insert(Product product) {
		int result = 0;
		System.out.println("JEDaoImpl insert start...");
		try {
			result = session.insert("insertProduct", product);
		} catch (Exception e) {
			System.out.println("JEDaoImpl insertProduct Exception->"+e.getMessage());
		}
		return result;
	}

	@Override
	public int delete(int pno) {
		int result = 0;
		try {
			result = session.delete("deleteProduct", pno);
		}catch (Exception e) {
			System.out.println("JEDaoImpl deleteProduct Exception->>>" + e.getMessage());
		}
		return result;
	}
	
	
/////////////////////////////////////////
//	상품 페이지
/////////////////////////////////////////
	
	//카테고리별 영상
	@Override
	public List<Product> categoryList(int c) {
		List<Product> list = session.selectList("HTcategoryList", c);
		return list;
	}
	
	//장르별 영상
	@Override
	public List<Product> genreList(int g) {
		List<Product> list = session.selectList("HTgenreList", g);
		return list;
	}
	
	//상품상세 페이지
	@Override
	public Product productDetail(int pno) {
		Product product = new Product();
		try {
			//						  	mapper ID	, Parameter
			product = session.selectOne("JEProductDetail", pno);
		}catch (Exception e) {
			
		}
		return product;
	}

	
/////////////////////////////////////////
// 장바구니
/////////////////////////////////////////
	
	//카트담기 중복체크
	@Override
	public int checkRepetition(Cart cart) {
		int checkRepetition = 0;
		try {
			checkRepetition = session.selectOne("cartCheck", cart);
			//orderCheck 1이상 일 때 중복으로 판단
			//0일때 카드 담기 가능
		}catch(Exception e) {
			System.out.println("checkRepetition Exception: " + e.getMessage());
		}
		return checkRepetition;
	}
	
	//카트에 담기
	@Override
	public void addCart(Cart cart) {
		System.out.println("JEDaoImpl addCart start..");
		try {
			session.insert("addCart", cart);

		} catch (Exception e) {
			System.out.println("JEDaoImpl addCart e.getMessage())->"+e.getMessage());
		}
	}
	
	//카트 리스트
	@Override
	public List<Cart> cartList(String id) {
			return session.selectList("cartList", id);
	}
	
	//카트 삭제
	@Override
	public void deleteCart(Cart cart) {
		session.delete("deleteCart", cart);
	}

	
/////////////////////////////////////////
//	결제
/////////////////////////////////////////	
	
	//주문 정보
	@Override
	public void orderInfo(Payment payment) {
		int tot = 0;
		try { 
			System.out.println("JEDaoImpl total orderInfo tot->" + payment.getP_date()); //insert 결과 
			tot = session.insert("orderInfo", payment); //orderInfo 테이블의 total
			System.out.println("JEDaoImpl total orderInfo tot->" + tot); //insert 결과 
		}catch (Exception e) {
			System.out.println("JEDaoImpl total Exception->" + e.getMessage());
		}
	}
	
	//주문 상세 정보
	@Override
	public void orderInfo_Details(PaymentDetails paymentDetails) {
		int tot = 0;
		try { 
			System.out.println("JEDaoImpl total orderInfo detailNo->" + paymentDetails.getDetailNo()); //insert 결과 
			System.out.println("JEDaoImpl total orderInfo orderId->" + paymentDetails.getOrderId()); //insert 결과 
			System.out.println("JEDaoImpl total orderInfo pno->" + paymentDetails.getPno()); //insert 결과 
			tot = session.insert("orderInfo_Details", paymentDetails); //orderInfo_Details 테이블의 total
			System.out.println("JEDaoImpl total orderInfo tot->" + tot); //insert 결과 
		}catch (Exception e) {
			System.out.println("JEDaoImpl total Exception->" + e.getMessage());
		}		
	}	

	//결제 후 카트 비우기
	@Override
	public void cartAllDelete(String id) {
		session.delete("cartAllDelete", id);
	}
	
	//주문 목록
	@Override
	public List<Payment> orderList(Payment payment) {
		return session.selectList("orderList", payment);
	}

	//주문 상세 목록
	@Override
	public List<OrderList> orderView(Payment payment) {
		return session.selectList("orderView", payment);
	}
		
}