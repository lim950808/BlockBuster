package com.oracle.BlockBuster.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.BlockBuster.model.SHCommentModel;
import com.oracle.BlockBuster.model.SHReviewModel;
import com.oracle.BlockBuster.service.Paging;
import com.oracle.BlockBuster.service.SHService;
import com.oracle.BlockBuster.service.loginCheck;

@Controller
public class SHCommentController {

	private static final Logger logger = LoggerFactory.getLogger(SHCommentController.class);
	
	@Autowired
	private SHService SHservice;
	
	@Autowired
	private loginCheck loginCheck; //ID session 가져오는 module
	 
	
	
	//댓글 DB반영
	@RequestMapping("commentInsert")
	@ResponseBody
	public String commentInsert(SHCommentModel SHcommentModel, HttpServletRequest request) { 
		logger.info("[STRAT] commentInsert 시작--------------------");
		
		//세션에 저장된 id값 불러오기(필요)
		SHcommentModel.setId(loginCheck.checkSessionId(request));
		
		int insertResult = SHservice.commentInsert(SHcommentModel);
		logger.info("commentInsert() 댓글 작성 반영 결과 : "+insertResult);
		
		String insertResultStr = String.valueOf(insertResult);
		
		
		return insertResultStr;
	}
	
	
	
	
	//등록된 댓글 list 불러오기
	@RequestMapping(value="commentList")
	public String commentList(SHCommentModel SHcommentModel, String currentPage, Model model) { 
		logger.info("[STRAT] commentList 시작--------------------");
		
		int c_total = SHservice.c_total(SHcommentModel.getR_no());
		logger.info("c_total 결과 : " +c_total);
		
		Paging pg = new Paging(c_total, currentPage);
		SHcommentModel.setStart(pg.getStart());   // 시작시 1
		SHcommentModel.setEnd(pg.getEnd());       // 시작시 10
		
		List<SHCommentModel> commentList = SHservice.commentList(SHcommentModel);
		
		model.addAttribute("commentList",commentList);
		model.addAttribute("c_total", c_total);
		model.addAttribute("pg",pg);
		
		
		return "Review/commentListSH";
	}
	
	
	//댓글 삭제
	@RequestMapping(value="commentDelete")
	@ResponseBody
	public String commentDelete(SHCommentModel SHcommentModel, Model model) {
		logger.info("[STRAT] commentDelete 시작--------------------");
		
		logger.info("[3-1-1] commentDelete() 시작");
		int result = SHservice.commentDelete(SHcommentModel);
		logger.info("resultStr결과 : " +result);
		
		String resultStr = String.valueOf(result);
		
		
		return resultStr; 
	}
	
	
	
	//댓글 수정
	@RequestMapping(value="commentRealEdit")
	@ResponseBody
	public String commentEdit(SHCommentModel SHcommentModel, Model model) {
		logger.info("[STRAT] commentEdit 시작");
		
		logger.info("[5-1-1] commentEdit() 시작");
		int editResult = SHservice.commentEdit(SHcommentModel);
		System.out.println("commentEdit 댓글 수정 반영 결과 : "+editResult);
		
		String resultStr = String.valueOf(editResult);
		
		
		return resultStr; 
	}

	
}
