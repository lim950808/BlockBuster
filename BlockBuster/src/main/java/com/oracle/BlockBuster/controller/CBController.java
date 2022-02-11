package com.oracle.BlockBuster.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oracle.BlockBuster.model.CBSearchVO;
import com.oracle.BlockBuster.model.CBfaqDto;
import com.oracle.BlockBuster.service.CBService;
import com.oracle.BlockBuster.service.Paging;
import com.oracle.BlockBuster.service.loginCheck;

@Controller
public class CBController {
	
	  @Autowired 
	  private CBService fs; // Service 연결
	  
		/*-----------------FAQ list 화면, paging 처리-----------------*/
	  @RequestMapping(value="FAQ/listCB") 
	  public String list(CBfaqDto cbFaqdto, String currentPage, Model model ) {
	  System.out.println("CBController Start listCB......"); 
	  int total = fs.total();
	  System.out.println("CBController total->>" + total);
	  System.out.println("CBController currentPage =>>" + currentPage); // 모듈화 42 NULL(0,1.....) 2page 
	  Paging pg = new Paging(total, currentPage);
	  
	  cbFaqdto.setStart(pg.getStart());   //시작시 1 cbFaqdto.setEnd(pg.getEnd()); //시작시10 
	  cbFaqdto.setEnd(pg.getEnd()); 	  //시작시 10
	  
	  List<CBfaqDto> listFaq = fs.listFaq(cbFaqdto);
	  System.out.println("CBController listCB listFaq.size()=>>>" + listFaq.size());
	  model.addAttribute("listFaq", listFaq);
	  model.addAttribute("total", total); 
	  model.addAttribute("pg", pg);
	  
	  
	  return "FAQ/listCB"; 
	  }
	  
	  /*-----------------FAQ 쓰기form-----------------*/
	  @RequestMapping(value ="FAQ/writeFormCB")
		public String writeFormCB(Model model) {
			
		//	List<CBfaqDto> faqList = fs.listManager();  f_no 가 pk값이기때문에 필요없는 문구 / start만 줘서 실행되는지 확인만
			System.out.println("CBController writeFormCB start..." );
		//	model.addAttribute("faqList",faqList);  						
			return "FAQ/writeFormCB";
		}

	  /*-----------------FAQ 쓰기 입력완료 저장-----------------*/
		@RequestMapping(value = "writeCB", method = RequestMethod.POST)
		public String writeCB(CBfaqDto cbFaqdto, Model model) {
			System.out.println("CBController Start write.....");
			int result = fs.insert(cbFaqdto);
			if(result> 0) 
				return "redirect:FAQ/listCB";
			else {
				model.addAttribute("입력 실패 확인해보세요");
				return "forward:FAQ/writeFormCB";
				}	
			
				/* return "redirect:FAQ/listCB"; */ /* 값을 받는 지 확인 할때 위에 65번줄 부터 주석 처리하고 확인 */
		}
		/*-----------------FAQ 수정form-----------------*/
		@GetMapping(value = "FAQ/updateFormCB")
		public String updateFormCB(int f_no, Model model) {
			System.out.println("CBController Start updateFormCB....");
			CBfaqDto cbFaqdto = fs.contentCB(f_no);
			System.out.println("CBController updateFormCB cbFaqdto.getF_content()->"+cbFaqdto.getF_content());
			model.addAttribute("cbFaqdto", cbFaqdto);
			return "FAQ/updateFormCB";
		}
	  
		/*-----------------FAQ 수정완료 저장-----------------*/
		@PostMapping(value = "FAQ/updateCB")
		public String updateCB(CBfaqDto cbFaqdto, Model model ) {
			System.out.println("CBController Start updateCB..");
			int uptCnt = fs.updateCB(cbFaqdto);
			System.out.println("CBController fs.updateCB(cbFaqdto) Count-->"+ uptCnt);
			model.addAttribute("uptCnt",uptCnt);
			return "forward:listCB";
			/* 수정 완료시 updateCB로 되는 것 고쳐야 하는건지.. */
		}
		
		
		 /*-----------------FAQ 삭제-----------------*/	
		@RequestMapping(value = "FAQ/deleteCB")
		public String deleteCB(int f_no, Model model) {
			System.out.println("CBController Start deleteCB....");
			int result = fs.deleteCB(f_no);
			return "redirect:listCB";
		}
		/* 삭제시 번호가 비는 현상은 시퀀스 사용할 때 어쩔 수 없는 현상 */
		
		
		/*-----------------FAQ 검색-----------------*/
		
	
		@RequestMapping(value = "listCB.do")
		public String listCB(CBSearchVO cbSearchVO, Model model) {
			List<CBfaqDto> faqList = fs.insertCB(cbSearchVO);
			
			if(cbSearchVO.getKeyword() == null) {
				System.out.println("cbSearchVO null....");
				model.addAttribute("keyword",cbSearchVO.getKeyword());
			}else {
				System.out.println("cbSearchVO.getSearch_option()->" +cbSearchVO.getSearch_option() );
				System.out.println("cbSearchVO.getKeyword()   ->>>"+ cbSearchVO.getKeyword() );
				System.out.println("faqList.size() => "+faqList.size());
								
				model.addAttribute("listFaq",faqList); // 심플
				model.addAttribute("keyword",cbSearchVO.getKeyword()); //쉬운방법
				
			}
			return "FAQ/listCB"; 
		} 
		 
		 
		/*-----------------FAQ list2 검색완료화면-----------------*/
		  @RequestMapping(value="FAQ/listCB2") 
		  public String list2(CBfaqDto cbFaqdto, String currentPage, Model model ) {
		  System.out.println("CBController Start listCB......"); 
		  int total = fs.total();
		  System.out.println("CBController total->>" + total);
		  System.out.println("CBController currentPage =>>" + currentPage); // 모듈화 42 NULL(0,1.....) 2page 
		  Paging pg = new Paging(total, currentPage);
		  
		  cbFaqdto.setStart(pg.getStart());   //시작시 1 cbFaqdto.setEnd(pg.getEnd()); //시작시10 
		  cbFaqdto.setEnd(pg.getEnd()); 	  //시작시 10
		  System.out.println("model.getAttribute(\"listFaq\") => "+model.getAttribute("listFaq"));
		  model.addAttribute("listFaq",model.getAttribute("listFaq"));		  
		  model.addAttribute("total", total); 
		  model.addAttribute("pg", pg);
		  
		  
		  return "FAQ/listCB"; 
		  }	 
		 
		 
//		  public void commentInsert(CBfaqDto cbFaqdto, HttpServletRequest request) {
//			  
//			  //세션에 저장된 id값 불러오기
//			  cbFaqdto.setId(loginCheck.checkSessionId(request));
//		  }
		 
		 
		 
}