package com.oracle.BlockBuster.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.BlockBuster.model.SHProcedureVO;
import com.oracle.BlockBuster.service.SHService;


@Controller
public class SHProcedureController {
	
private static final Logger logger = LoggerFactory.getLogger(SHProcedureController.class);
	
	@Autowired
	private SHService SHservice;

	
	//  Procedure Test 입력화면 
	@RequestMapping(value = "procedureForm", method = RequestMethod.GET)
	public String procedureForm(Model model) {
		logger.info("[STRAT] procedureForm 시작--------------------");
		
	    return "Review/procedureFormSH";
	}
	// Procedure Test 입력후 VO 전달 -->2
	@PostMapping(value="insertProcedure")
	@ResponseBody
	public String procedureInsert(SHProcedureVO SHprocedureVO, Model model) {
		logger.info("[STRAT] insertProcedure 시작--------------------");
		
		SHservice.insertProcedure(SHprocedureVO);   // Procedure Call 
		
		int insertResult = 0;
		
		if (SHprocedureVO == null) {
			logger.info("SHprocedureVO NULL");
			insertResult=0;
		}else {
			logger.info("Q_anonymous()->"+SHprocedureVO.getQ_anonymous());
			logger.info("Q_content()->"+SHprocedureVO.getQ_content());
			insertResult=1;
		}
		
		String insertResultStr = String.valueOf(insertResult);
		
		return insertResultStr;
	}	
	
	
	@RequestMapping(value = "cursorList")
	public String cursorList(Model model) {
		logger.info("[STRAT] cursorList 시작--------------------");
		
		//행개수 확인
		int size = SHservice.cursorListSize();
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("startNo", size-10); //일회성, dto처럼 명시하기 애매한 경우..? 
		map.put("endNo", size);
		
		SHservice.cursorList(map);
		
		List<SHProcedureVO> listCursor = (List<SHProcedureVO>) map.get("cursorList");
		
		//콘솔에서 확인하고자 한다면..
		for(SHProcedureVO cursor : listCursor) {
			logger.info("cursor.getQ_content->"+cursor.getQ_content());
			logger.info("cursor.getQ_anonymous->"+cursor.getQ_anonymous());
		}
		logger.info("listCursor Size->"+ listCursor.size());
		model.addAttribute("listCursor", listCursor);
		model.addAttribute("size", size);
	  
	  return "Review/cursorListSH";
    }

	

}
