package com.oracle.BlockBuster.controller;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.BlockBuster.model.Product;
import com.oracle.BlockBuster.service.JEService;
import com.oracle.BlockBuster.service.Paging;

@Controller
public class JEController {

	private static final Logger logger = LoggerFactory.getLogger(JEController.class);
	
	@Autowired
	private JEService js;
	
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
	
}
