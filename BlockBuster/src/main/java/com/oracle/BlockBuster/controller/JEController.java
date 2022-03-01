package com.oracle.BlockBuster.controller;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.BlockBuster.model.Cart;
import com.oracle.BlockBuster.model.CartList;
import com.oracle.BlockBuster.model.Member;
import com.oracle.BlockBuster.model.OrderList;
import com.oracle.BlockBuster.model.Payment;
import com.oracle.BlockBuster.model.PaymentDetails;
import com.oracle.BlockBuster.model.Product;
import com.oracle.BlockBuster.service.JEService;
import com.oracle.BlockBuster.service.Paging;
import com.oracle.BlockBuster.service.loginCheck;

@Controller
public class JEController {

	private static final Logger logger = LoggerFactory.getLogger(JEController.class);
	
	@Autowired
	private JEService js;
	
	@Autowired
	private loginCheck loginCheck; //sessionId 받아오는 모듈
	
	
/////////////////////////////////////
// 관리자 상품 관리
/////////////////////////////////////
	
	// 영상목록
	@RequestMapping(value = "/Admin/productList")
	public String productlist(Product product, String currentPage, Model model) {
		System.out.println("JEController /Admin/productList Start...");
		int total = js.total();
		System.out.println("JEController total-->"+total);
		Paging pg = new Paging(total, currentPage);
		product.setStart(pg.getStart());
		product.setEnd(pg.getEnd());
		System.out.println("JEController product.getStart()-->"+product.getStart());
		System.out.println("JEController product.getEnd()-->"+product.getEnd());
		
		List<Product> listProduct = js.listProduct(product);
		System.out.println("JEController listProduct.size()-->"+listProduct.size());
		model.addAttribute("listProduct", listProduct);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);
		
		return "/Admin/productList";
	}
	
	// 영상 상세 페이지
	@GetMapping(value = "/Admin/detail")
	public String detail(int pno, Model model) {
		Product product = js.detail(pno);
		model.addAttribute("product", product);
		
		return "/Admin/detail";
	}
	
	// 영상 수정 폼으로 이동시키는 역할
	@GetMapping(value = "/Admin/updateForm")
	public String updateForm(int pno, Model model) {
		Product product = js.detail(pno);
		System.out.println("JEController updateForm start...");
		model.addAttribute("product", product);
		
		return "/Admin/updateForm";
	}
	
	// 영상 수정
	@PostMapping(value = "/Admin/update")
	public String update(HttpServletRequest request, MultipartFile imgFile, Product product, Model model) throws Exception {
		logger.info("Product Edit Start...");
		
		//파일 첨부
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
		
		System.out.println("uploadForm POST Start");
		logger.info("originalName: "+ imgFile.getOriginalFilename());
		logger.info("size: "+ imgFile.getSize());
		logger.info("contentType: "+ imgFile.getContentType());	
		logger.info("uploadPath: "+ uploadPath);	
		
		String p_img = uploadFile(imgFile.getOriginalFilename(), imgFile.getBytes(), uploadPath);
		
		logger.info("p_img: " + p_img);
		product.setP_img(p_img);
		
		System.out.println("pno 존재 여부"+product.getPno());
		
		logger.info("ProductEdit() Start");
		int editresult = js.update(product);
		System.out.println("product edit 반영 결과 : " + editresult);
		model.addAttribute("editresult", editresult);
		
		return "forward:productList";
	}
	
	//영상 등록버튼 누르면 등록 Form 으로 이동하게 해주는 역할
	@RequestMapping(value = "/Admin/writeForm", method=RequestMethod.GET )
	public String writeForm() {
		System.out.println("JEController insertProduct start...");	
		return "/Admin/writeForm";
	}
	
	// 영상등록 Form에 입력한 값을 DB에 입력시키는 역할
	@RequestMapping(value="/Admin/write",  method=RequestMethod.POST)
	public String write(HttpServletRequest request, String genreTemp, MultipartFile imgFile, Product product, Model model) throws Exception {
		System.out.println("JEController Start write..." );
		
		
		int genNum = Integer.parseInt(js.genNum(genreTemp));
		product.setGenre(genNum);
	
		if(imgFile!=null) {
			String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
			
			System.out.println("uploadForm POST Start");
			logger.info("originalName: "+ imgFile.getOriginalFilename());
			logger.info("size: "+ imgFile.getSize());
			logger.info("contentType: "+ imgFile.getContentType());	
			logger.info("uploadPath: "+ uploadPath);
			
			String p_img = uploadFile(imgFile.getOriginalFilename(), imgFile.getBytes(), uploadPath);
			
			logger.info("p_img: " + p_img);
			product.setP_img(p_img);
		}
		
		// 상품 등록
		logger.info("Product ---> Product Wrtite() 시작");
		int result = js.insert(product);
		
		if (result > 0) 
			return "redirect:/Admin/productList";
		else {
			model.addAttribute("msg", "입력 실패 확인해 보세요");
			return "forward:/Admin/writeForm";
		}
	    	
	}
	
	//파일 업로드
	private String uploadFile(String originalName, byte[] fileData, String uploadPath) throws Exception {
		UUID uid = UUID.randomUUID();
		// requestPath = requestPath + "/resources/image";
		System.out.println("uploadPath->"+uploadPath);
		
		// Directory 생성
		File fileDirectory = new File(uploadPath);
		if (!fileDirectory.exists()) {
			fileDirectory.mkdirs();
			System.out.println("업로드용 폴더 생성: " + uploadPath);
		}
		
		String savedName = uid.toString() + "_" + originalName;
		logger.info("savedName: " + savedName);
		
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target); // org.springframework.util.FileCopyUtils
		
		return savedName;
	}
	
	//상품 삭제
	@RequestMapping(value = "/Admin/delete")
	public String delete(int pno, Model model) {
		System.out.println("JEController Start delete...");
		int result = js.delete(pno);
		return "redirect:productList";
	}
	
	
/////////////////////////////////////////
//	상품 페이지
/////////////////////////////////////////
	
	//상품 상세 -> productDetail페이지
	@GetMapping(value = "/Product/productDetail") //요청경로(path)
	public String product(Model model, int pno) {
		Product product = js.productDetail(pno);
		product.setPno(pno);
		model.addAttribute("product", product);
		//model.addAttribute("변수이름", 변수에 넣을 데이터값);
		//모델 캑체를 파라미터로 받음.
		return "/Product/productDetail";
		//파라미터로 받은 그 값을 "뷰 페이지"로 넘긴다.
	}
	
	//카테고리별 영상리스트
	@GetMapping(value = "CategoryList")
    public String CategoryList(Model model, HttpServletRequest request) {
		int c = Integer.parseInt(request.getParameter("c")); //HttpServletRequest 객체 안의 "c"값을 형변환하여 int타입으로 가져온다.
		System.out.println("JEController의 CategoryList메서드 실행");
		System.out.println("JEController의 CategoryList메서드 입력된 카테고리 값 => " + c);
		List<Product> list = js.categoryList(c); //"c"값을 list에 List형식으로 담는다.
		System.out.println("JEController의 CategoryList메서드의 list.size() => " + list.size());	
		model.addAttribute("list", list); //model객체를 이용해 list를 뷰로 값을 넘김.
		model.addAttribute("s", "segment"); // "장르 페이지"인지 "카테고리 페이지"인지 구분하는 처리	(segment: 분할)
		return "/Product/list";
    }
	
	//장르별 영상리스트
	@GetMapping(value = "GenreList")
	public String GenreList(Model model, HttpServletRequest request) {
		int g = Integer.parseInt(request.getParameter("g"));
		System.out.println("JEController의 GenreList메서드 실행");
		System.out.println("JEController의 GenreList메서드 입력된 카테고리 값 => " + g);
		List<Product> list = js.genreList(g);
		System.out.println("JEController의 GenreList메서드의 list.size() => " + list.size());
		model.addAttribute("list", list);
		return "/Product/list";
   }

	
/////////////////////////////////////////
// 장바구니
/////////////////////////////////////////	
	
	//카트에 담기
	@ResponseBody //ajax를 위해 @ResponseBody 사용
	@RequestMapping(value = "/Product/productDetail/addCart", method = RequestMethod.POST)
	public int addCart(Cart cart, HttpSession session, int pno, Model model) throws Exception {
		int result = 0; //0으로 초기화
		System.out.println("cart.pno => " + cart.getPno());

		int checkRepetition = js.checkRepetition(cart); //카트에 중복된 영상 예외처리
		System.out.println("checkNum => " + checkRepetition);
		if(checkRepetition == 0) { //카트 테이블에 중복된 영상 없을때
			System.out.println("addCart start...");
			String id = (String)session.getAttribute("sessionId");
			System.out.println("addCart id->" + id);	
			
		    if(id != null) { //로그인 여부 구분
				cart.setId(id);
				js.addCart(cart); //로그인시 카트에 담기
				result = 1; //정상적으로 카트에 담김.
			}
		}else if(checkRepetition >= 1){ //카트 테이블에 중복된 영상 있을때 
			result = 2; //카트에 담지 못하는 예외 처리
		}	    
	    return result;	    
	}
	
	//카트 리스트
	@RequestMapping(value = "/Cart/cartList", method = RequestMethod.GET)
	public String getCartList(HttpSession session, Model model) throws Exception {
		System.out.println("get cartList started...");
		String id = (String)session.getAttribute("sessionId");
		System.out.println("get cartList id->" + id);
		
		List<Cart> cartList = js.cartList(id); //"id"값을 cartList에 List형식으로 담는다.
		System.out.println("get cartList cartList.size()->" + cartList.size());
		model.addAttribute("cartList", cartList); //cartList를 뷰단으로 넘김.
		return "/Cart/cartList";
	}
	
	//카트 삭제
	@ResponseBody
	@RequestMapping(value = "/Cart/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, Cart cart) {
		System.out.println("Delete cart");
		String id = (String)session.getAttribute("sessionId");
		int result = 0; //초기화
		int no = 0; //카트 번호(cartNum)
		
		if(id != null) { //로그인 여부 구분
			cart.setId(id);
			for(String i : chArr) { //ajax에서 받은 chArr(checked Array)의 갯수만큼 반복되는 for문
				no = Integer.parseInt(i); //i번째 데이터를 no에 저장
				cart.setNo(no);
				js.deleteCart(cart);
			}
			result = 1; //정상적을 삭제됨.
		}
		return result;
	}

	
/////////////////////////////////////////
// 결제
/////////////////////////////////////////
	
	//주문
	@RequestMapping(value = "/Cart/cartList/order")
	public String order(HttpSession session, Payment payment, PaymentDetails paymentDetails) {
		System.out.println("order start...");
		String id = (String)session.getAttribute("sessionId");
		System.out.println("controoller Cart/cartList id-->" + id);
		
		// orderId(주문번호)생성 로직 - 캘린더 메서드로 랜덤숫자(subNum) 만들기
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);  // 연도(year) 추출
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);  // 월(month) 추출
		String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));  // 일(date) 추출
		String subNum = "";  // 랜덤 숫자를 저장할 문자열 변수
		
		for(int i=1; i<=6; i++) {  // 6회 반복
			subNum += (int)(Math.random() * 10);  // 0~9까지의 숫자를 생성하여 subNum에 저장
		}
		
		String orderId = ymd + "_" + subNum;  // [연월일]_[랜덤숫자] 로 구성된 문자 -> ex) 20220216_123456
		System.out.println("Controller cartList orderId -> " + orderId);
		
		payment.setOrderId(orderId);
		payment.setId(id);
		js.orderInfo(payment); //주문 정보
		
		paymentDetails.setOrderId(orderId);
		paymentDetails.setId(id);
		js.orderInfo_Details(paymentDetails); //주문 상세 정보
		
		//결제 후 카트 비우기
		js.cartAllDelete(id);
		
		return "redirect:/Order/orderList";
	}
	
	//결제 후 주문 목록
	@RequestMapping(value = "/Order/orderList", method = RequestMethod.GET)
	public String getOrderList(HttpSession session, Payment payment, Model model) {
		logger.info("get orderList");		
		String id = (String)session.getAttribute("sessionId");
		payment.setId(id);	
		List<Payment> orderList = js.orderList(payment); //"payment"값을 cartList에 List형식으로 담음.
		model.addAttribute("orderList", orderList); //orderList를 뷰단으로 넘김.
		return "Order/orderList";
	}
	
	//결제 후 주문 상세 목록
	@RequestMapping(value = "/Order/orderView", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, @RequestParam("n") String orderId, Payment payment, Model model) {
		logger.info("get orderView");
		String id = (String)session.getAttribute("sessionId");
		payment.setId(id);
		payment.setOrderId(orderId);
		List<OrderList> orderView = js.orderView(payment); //"payment"값을 orderView에 List형식으로 담음.
		model.addAttribute("orderView", orderView); //orderView를 뷰단으로 넘김.
	}
	
}