package com.oracle.BlockBuster.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.BlockBuster.model.SHGoodModel;
import com.oracle.BlockBuster.service.SHService;


@Controller
public class SHGoodController {
	
private static final Logger logger = LoggerFactory.getLogger(SHGoodController.class);
	
	@Autowired
	private SHService SHservice;
	
	
	
	//게시판 좋아요 적용/해제 판별
	@PostMapping(value="checkGood")
	public String checkGood(SHGoodModel SHgoodModel, Model model) {
		logger.info("[STRAT] checkGood 시작--------------------");
		
		logger.info("[1-1-1] userGood()_forward:insertGood || forward:deleteGood 보냄");
		int checkGood = SHservice.userGood(SHgoodModel);
		
		if(checkGood == 0) {
			return "forward:insertGood";
		} else {
			return "forward:deleteGood";
		}
	}

	
	
	
	//게시글 전체 좋아요 개수
	@PostMapping(value="totalGood")
	@ResponseBody
	public String totalGood(int r_no) {
		logger.info("[STRAT] totalGood 시작--------------------");
	
		logger.info("[2-1-1] totalGood() 시작");
		int goodInsertResult = SHservice.totalGood(r_no);
		String goodInsert = String.valueOf(goodInsertResult);
		
		return goodInsert;
	}

	
	
	
	//좋아요 적용
	@PostMapping(value="insertGood")
	@ResponseBody
	public String insertGood(SHGoodModel SHgoodModel) {
		logger.info("[STRAT] insertGood 시작--------------------");
		
		logger.info("[3-1-1] insertGood() 시작");
		int goodInsertResult = SHservice.insertGood(SHgoodModel);
		String goodInsert = String.valueOf(goodInsertResult);
		
		return goodInsert;
	}

	
	
	
	//좋아요 해제
	@PostMapping(value="deleteGood")
	@ResponseBody
	public String deleteGood(SHGoodModel SHgoodModel) {
		logger.info("[STRAT] deleteGood 시작--------------------");
			
		logger.info("[3-1-1] deleteGood() 시작");
		int goodDeleteResult = SHservice.deleteGood(SHgoodModel);
		
		if(goodDeleteResult == 1) goodDeleteResult = 2;
		String goodDelete = String.valueOf(goodDeleteResult);
		
		return goodDelete;
	}	
	

}
