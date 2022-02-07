package com.oracle.BlockBuster.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.BlockBuster.model.Cart;
import com.oracle.BlockBuster.model.CartList;
import com.oracle.BlockBuster.model.Member;
import com.oracle.BlockBuster.model.Payment;
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
	//영상 상세 페이지
	@GetMapping(value = "/Admin/detail")
	public String detail(int pno, Model model) {
		Product product = js.detail(pno);
		model.addAttribute("product", product);
		
		return "/Admin/detail";
	}
	// 영상 수정 폼
	@GetMapping(value = "/Admin/updateForm")
	public String updateForm(int pno, Model model) {
		Product product = js.detail(pno);
		model.addAttribute("product", product);
		
		return "/Admin/updateForm";
	}
	// 영상 수정
	@PostMapping(value = "update")
	public String update(Product product, Model model) {
		int uptCnt = js.update(product);
		//model.addAttribute("uptCnt", uptCnt);				// Test Controller간 Date 전달
		//model.addAttribute("kk3", "Message Test");	// Test Controller간 Date 전달
		
		return "forward:/Admin/productList";
	}
	//영상 등록
	@RequestMapping(value = "/Admin/writeForm")
	public String writeForm(Model model) {
		//Emp emp = null;
		//관리자 사번만 Get
		List<Product> productList = js.listManager();
		model.addAttribute("productMngList", productList); //product Manager List
		
		return "/Admin/writeForm";
	}
	
	@RequestMapping(value = "/Admin/write", method = RequestMethod.POST)
	public String write(Product product, Model model) {
		//System.out.println("emp.getHiredate->"+emp.getHiredate());
		// Service, Dao , Mapper명[insertEmp] 까지 -> insert
		int result = js.insert(product);
		if(result > 0) return "redirect:/Admin/productList";
		else {
			model.addAttribute("msg", "입력 실패!! 확인해보세요");
			return "forward:/Admin/writeForm";
		}
	}
	//중복 체크
	@GetMapping(value = "/Admin/confirm")
	public String confirm(int pno, Model model) {
		Product product = js.detail(pno);
		model.addAttribute("pno", pno);
		if(product != null) {
			model.addAttribute("msg", "중복된 영상입니다.");
			return "forward:/Admin/writeForm";
		}else {
			model.addAttribute("msg", "등록 가능합니다.");
			return "forward:/Admin/writeForm";
		}
	}
	//상품 삭제
	@RequestMapping(value = "delete")
	public String delete(int pno, Model model) {
		int result = js.delete(pno);
		return "redirect:/Admin/productList";
	}
	//카테고리별 영상 리스트
	@RequestMapping(value = "/Product/list", method = RequestMethod.GET)
	public void getList(@RequestParam("g") int genre, @RequestParam("l") int level, Model model) throws Exception {
		List<Product> list = null;
		list = js.list(genre, level);
		model.addAttribute("list", list);
		
	}
	//상품 상세 -> productDetail페이지
	@GetMapping(value = "/Product/productDetail")
	public String product(Model model, int pno) {
	//@GetMapping("/Product/productDetail/{pno}")
	//public String product(Model model, @PathVariable("pno") int pno) {
		Product product = js.productDetail(pno);
		model.addAttribute("product", product);
		return "/Product/productDetail";
	}
	
	/*
	 * //카트담기
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/Product/productDetail/addCart", method =
	 * RequestMethod.POST) public int addCart(CartList cart, HttpSession session)
	 * throws Exception {
	 * 
	 * int result = 0; Member member = (Member)session.getAttribute("member");
	 * if(member != null) { cart.setId(member.getId()); js.addCart(cart); result =
	 * 1; } return result; }
	 * 
	 * //카트 목록
	 * 
	 * @RequestMapping(value = "/Cart/cartList", method = RequestMethod.GET) public
	 * void getCartList(HttpSession session, Model model) throws Exception {
	 * logger.info("get cart list"); Member member =
	 * (Member)session.getAttribute("member"); String id = member.getId();
	 * List<CartList> cartList = js.cartList(id); model.addAttribute("cartList",
	 * cartList); }
	 * 
	 * //카트 삭제
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/Cart/deleteCart", method = RequestMethod.POST)
	 * public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]")
	 * List<String> chArr, Cart cart) throws Exception { logger.info("delete cart");
	 * Member member = (Member)session.getAttribute("member"); String id =
	 * member.getId(); int result = 0; int no = 0; if(member != null) {
	 * cart.setId(id); for(String i : chArr) { no = Integer.parseInt(i);
	 * cart.setNo(no); js.deleteCart(cart); } result = 1; } return result; }
	 */
	
	///////////////////////////////////
	
	//카트 controller
	/*
	 * @RequestMapping("/Cart/count") public @ResponseBody String cartCount(Cart
	 * cart, HttpSession session) { int count =
	 * js.cartCount(member.getMember().getId());
	 * 
	 * Gson gson = new Gson(); String countToJson=gson.toJson(count);
	 * 
	 * return countToJson; }
	 */
	
	//카트 담기
	@PostMapping("/Cart/add")
	public String cartAdd(Cart cart, HttpSession session) {
		Member member = (Member)session.getAttribute("member");
		cart.setId(member.getId());		
		js.cartAdd(cart);		
		return "redirect:/Cart/list";
	}
	
	//카트 목록
	@GetMapping("/Cart/list")
	public void cartList(HttpSession session, Model model) {
		Member member = (Member)session.getAttribute("member");
		String id = member.getId();
		List<Cart> list = js.list(id);
		model.addAttribute("list", list);
	}
	
	/*
	 * @RequestMapping(value={"/cartList","/amountTotal"}) public @ResponseBody
	 * String addedCartList(@AuthenticationPrincipal UserDetail user) {
	 * SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd"); String today =
	 * format.format(System.currentTimeMillis());
	 * 
	 * int userId = user.getUser().getId();
	 * 
	 * List<Cart> list =cartSvc.cartList(userId, today);
	 * 
	 * Gson gson = new Gson(); String listToJson=gson.toJson(list);
	 * 
	 * return listToJson; }
	 */
	
	@RequestMapping("/Cart/update")
	public @ResponseBody int cartUpdate(Cart cart) {
		int result = js.cartUpdate(cart);
		return result;
	}
	
	@RequestMapping("/Cart/delete")
	public @ResponseBody int cartDelete(@RequestParam("id") int id) {
		int result = js.cartDelete(id);
		return result;
	}
	
	/////////////////////////////////
	
	// 결제 payment
	
	@GetMapping("")
	public String orderPathRedirect() {
		return "redirect:/Order/";
	}
	
	@GetMapping("/")
	public String order() {
		return "/Order/order";
	}

	@GetMapping("/Order/list")
	public @ResponseBody Map<String, Object> orderCartList(HttpSession session, int id, Model model) {
		List<Payment> orderCartList = js.orderCartList(id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", orderCartList);
		
		return map;
	}
	
	@GetMapping("/Order/result/{orderNo}")
	public String orderResult(Model model, @PathVariable String orderNo) {
		model.addAttribute("orderNo", orderNo);
		return "/Order/result";
	}
	
	@GetMapping("/Order/result/view")
	public @ResponseBody Map<String, Object> orderResultView(@RequestParam String orderNo) {
		List<Payment> orderList = js.orderResultView(orderNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", orderList);
		
		return map;
	}
	
	@GetMapping("/Order/view/{orderNo}")
	public String orderView(Model model, @PathVariable String orderNo) {
		model.addAttribute("orderNo", orderNo);
		return "/Order/view";
	}
	
//	@GetMapping("/Order/list")
//	public String orderList() {
//		return "/Order/list";
//	}
	
	@GetMapping("/Order/list/all")
	public @ResponseBody Map<String, Object> orderResultView(HttpSession session, Model model, int id) {
		List<Payment> orderList = js.orderListAll(id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", orderList);
		
		return map;
	}
	
}
